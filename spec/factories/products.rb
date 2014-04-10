# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product do
    name "Product"
    description "Some description"
    price 24.95
    image_url "https://github-images.s3.amazonaws.com/help/repository/https-url-clone.png"
  end
end
