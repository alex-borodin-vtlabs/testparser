FactoryGirl.define do
    # Define a basic devise user.
    factory :page do
        factory :google_page do
            id 1
            page_url "http://google.com"
            page_content ""
        end
        factory :wrong_url do
            id 2
            page_url "google.com"
            page_content ""
        end
        factory :no_url do
            id 2
            page_content ""
        end
    end

end
