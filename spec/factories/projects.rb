FactoryBot.define do
  factory :project do
    sequence(:name) { |n| "Test Project #{n}" }
  end
end
