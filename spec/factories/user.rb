# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    id { rand(100 * 100) }
    name { "user#{rand(100 * 100)}" }
    email { "#{rand(100 * 100)}@example.com" }
  end
end
