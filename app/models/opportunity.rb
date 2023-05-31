# frozen_string_literal: true

class Opportunity < ApplicationRecord
  has_rich_text :job_description
  has_rich_text :notes
  has_many :contacts, as: :contactable, dependent: :destroy
  has_many :process_steps,
    dependent: :destroy,
    after_add: :update_state_based_on_process_steps,
    after_remove: :update_state_based_on_process_steps

  validates :company_name, presence: true
  validates :source_name, presence: true
  validates :source_link, presence: true

  scope :sorted, -> { order(updated_at: :desc) }

  enum state: {
         exploring: "exploring",
         ongoing: "ongoing",
         closed: "closed",
       },
    _default: "exploring"

  def latest_process_step
    process_steps.last
  end

  def update_state_based_on_process_steps(_)
    ongoing! if process_steps.any?
    exploring! if process_steps.none?
  end
end
