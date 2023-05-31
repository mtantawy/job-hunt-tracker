# frozen_string_literal: true

class CreateProcessSteps < ActiveRecord::Migration[7.1]
  def change
    create_table(:process_steps) do |t|
      t.string(:title)
      t.string(:state)
      t.references(:opportunity, null: false, foreign_key: true)

      t.timestamps
    end
  end
end
