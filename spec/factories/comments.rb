FactoryBot.define do
  factory :comment do
    commenter { "MyText" }
    status { 1 }
    post { nil }
    user { nil }
  end
end
