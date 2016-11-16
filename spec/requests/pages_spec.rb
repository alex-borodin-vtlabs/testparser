require 'rails_helper'

RSpec.describe "Pages", type: :request do
  describe "pages" do
    before(:each) do
      @attrs = FactoryGirl.attributes_for(:google_page)
      @wrongattrs = FactoryGirl.attributes_for(:wrong_url)
      @noattrs = FactoryGirl.attributes_for(:wrong_url)
    end
    it "list!" do
      get api_v0_pages_path
      expect(response).to have_http_status(200)
    end
    it "creates!" do
      post api_v0_pages_path, params: {page: @attrs}
      expect(response).to have_http_status(201)
    end
    it "has content!" do
      post api_v0_pages_path, params: {page: @attrs}
      expect(response.body).to include("Google")
    end
    it "not creates with no url!" do
      post api_v0_pages_path, params:  {page: @noattrs}
      expect(response).to have_http_status(422)
    end
    it "not creates with wrong url!" do
      post api_v0_pages_path, params:  {page: @wrongattrs}
      expect(response).to have_http_status(422)
    end
  end
end
