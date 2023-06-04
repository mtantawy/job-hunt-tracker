# frozen_string_literal: true

class CreateJoinTableProcessStepContact < ActiveRecord::Migration[7.1]
  def change
    create_join_table(:process_steps, :contacts) do |t|
      t.index([:process_step_id, :contact_id])
      t.index([:contact_id, :process_step_id])
    end
  end
end
