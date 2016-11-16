require 'rails_helper'

RSpec.describe Page, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:google_page)).to be_valid
  end
  it "has an invalid factory" do
    expect(FactoryGirl.build(:no_url)).to be_invalid
  end
end
