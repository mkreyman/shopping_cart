# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product do
    name { Faker::Commerce.product_name }
    description { Faker::Lorem.sentence }
    price { rand(0.01..999.99) }
    image_url "https://github-images.s3.amazonaws.com/help/repository/https-url-clone.png"
  end

end
