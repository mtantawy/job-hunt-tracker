# frozen_string_literal: true

class AddStateToOpportunity < ActiveRecord::Migration[7.1]
  def change
    add_column(:opportunities, :state, :string)
  end
end
