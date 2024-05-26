# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "user#{n}" }
    # This is my email.
    sequence(:email) { |n| "savvy-tasks-user#{n}@gmail.com" }
    password { "password" }
    password_confirmation { "password" }
  end

  factory :test_user, parent: :user do
    email { "test-user@gmail.com" }
  end
end
