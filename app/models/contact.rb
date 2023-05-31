# frozen_string_literal: true

class Contact < ApplicationRecord
  belongs_to :contactable, polymorphic: true
  has_rich_text :notes

  validates :name, presence: true
end
