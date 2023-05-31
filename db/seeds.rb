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

# require "faker"

# # Create 10 opportunities
# 10.times do
#   Opportunity.create!(
#     company_name: Faker::Company.name,
#     company_link: Faker::Internet.url,
#     position: Faker::Job.title,
#     job_description_link: Faker::Internet.url,
#     source_name: Faker::Company.name,
#     source_link: Faker::Internet.url,
#     job_description: Faker::Lorem.paragraphs(number: 3).join("\n\n"),
#   )
# end

# # Create 20 contacts, associated with random opportunities
# 20.times do
#   Contact.create!(
#     name: Faker::Name.name,
#     email: Faker::Internet.email,
#     phone: Faker::PhoneNumber.phone_number,
#     link: Faker::Internet.url,
#     contactable: Opportunity.all.sample,
#   )
# end

# # Create 5 rich text notes, associated with random opportunities
# 5.times do
#   Opportunity.all.sample.update!(notes: Faker::Lorem.paragraphs(number: 3).join("\n\n"))
# end

# # Create 5 rich text notes, associated with random contacts
# 5.times do
#   Contact.all.sample.update!(notes: Faker::Lorem.paragraphs(number: 3).join("\n\n"))
# end

# # Create process steps (~3 per opportunity), associated with random opportunities
# (Opportunity.count * 3).times do
#   ProcessStep.create!(
#     title: Faker::Lorem.word,
#     opportunity: Opportunity.all.sample,
#     state: ProcessStep.states.keys.sample,
#     notes: Faker::Lorem.paragraphs(number: 3).join("\n\n"),
#   )
# end
