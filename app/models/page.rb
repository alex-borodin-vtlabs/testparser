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
      h_content = doc.css('h1', 'h2', 'h3').map { |tag| tag.text.strip }
      href_content = doc.css('a').map { |link| link['href'] }
      self.page_content = h_content + href_content
      return self.save
    end
  end
end
