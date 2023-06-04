# frozen_string_literal: true

class ProcessStep < ApplicationRecord
  include ConvertFromAndToUserTimezone

  has_rich_text :notes

  belongs_to :opportunity, touch: true

  # rubocop:disable Rails/HasAndBelongsToMany
  has_and_belongs_to_many :contacts
  # rubocop:enable Rails/HasAndBelongsToMany

  validates :title, presence: true
  validates :state, comparison: { equal_to: "scheduled" }, if: -> { scheduled_for.present? && scheduled_for.future? }

  before_validation { self.state = :scheduled if scheduled_for.present? && scheduled_for.future? }

  scope :sorted, -> { order(scheduled_for: :desc, created_at: :desc) }

  enum state: {
         waiting_on_me: "waiting on me",
         waiting_on_them: "waiting on them",
         scheduled: "scheduled",
         done: "done",
       },
    _default: "waiting on me"
end
