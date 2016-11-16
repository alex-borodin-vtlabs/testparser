require 'rubygems'
require 'nokogiri'
require 'open-uri'

class Page < ApplicationRecord
  validates :page_url, presence: true

  def scrap
    url = self.page_url
    begin
      doc = Nokogiri::HTML(open(url))
    rescue SocketError
      self.errors.add(:error, "Wrong url")
      return false
    rescue => e
      self.errors.add(:error, e.message)
      return false
    else
      self.page_content = doc.css('h1', 'h2', 'h3', 'a').map { |tag| tag.text.strip }
      return self.save
    end
  end
end
