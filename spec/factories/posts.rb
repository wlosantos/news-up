FactoryBot.define do
  factory :post do
    title { "MyString" }
    body { "MyText" }
    contrast { 1 }
    type_subject { 1 }
    user { nil }
  end
end
