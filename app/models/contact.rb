# frozen_string_literal: true

class Contact < ApplicationRecord
  belongs_to :contactable, polymorphic: true
  has_rich_text :notes

  # rubocop:disable Rails/HasAndBelongsToMany
  has_and_belongs_to_many :process_steps
  # rubocop:enable Rails/HasAndBelongsToMany

  validates :name, presence: true
end
