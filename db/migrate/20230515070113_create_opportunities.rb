# frozen_string_literal: true

class CreateOpportunities < ActiveRecord::Migration[7.1]
  def change
    create_table(:opportunities) do |t|
      t.string(:source_name)
      t.string(:source_link)

      t.timestamps
    end
  end
end
