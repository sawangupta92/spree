FactoryGirl.define do
  factory :taxonomy, class: Spree::Taxonomy do
    sequence(:name) { |n| "Brand #{ n }" }
  end
end
