# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

test_user = FactoryBot.create :user, username: "test_user", email: "test-user@gmail.com"
another_user = FactoryBot.create :user, username: "another_user", email: "another-user@gmail.com"

20.times do
  FactoryBot.create :task, :randomized, user: test_user
end

5.times do
  FactoryBot.create :task, :randomized, user: another_user
end
