# frozen_string_literal: true

FactoryBot.define do
  factory :creature do
    association :user
    name { 'creature1' }
    size { 'Medium' }
    creature_type { 'Humanoid' }
    base_creature { false }
  end
end
