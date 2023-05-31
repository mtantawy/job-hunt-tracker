# frozen_string_literal: true

class AddScheduledForToProcessStep < ActiveRecord::Migration[7.1]
  def change
    add_column(:process_steps, :scheduled_for, :datetime)
  end
end
