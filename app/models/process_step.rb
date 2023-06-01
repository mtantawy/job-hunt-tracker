# frozen_string_literal: true

class ProcessStep < ApplicationRecord
  include ConvertFromAndToUserTimezone

  has_rich_text :notes

  belongs_to :opportunity, touch: true

  validates :title, presence: true

  enum state: {
         waiting_on_me: "waiting on me",
         waiting_on_them: "waiting on them",
         scheduled: "scheduled",
         done: "done",
       },
    _default: "waiting on me"
end
