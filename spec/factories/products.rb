FactoryBot.define do
  factory :product do
    name { Faker::Lorem.sentence(word_count: 3) }
    description { Faker::Lorem.paragraph(sentence_count: 2) }
    price { Faker::Number.number(digits: 3) }
  end
end
