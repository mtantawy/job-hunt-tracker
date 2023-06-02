# frozen_string_literal: true

class AddRoleToContact < ActiveRecord::Migration[7.1]
  def change
    add_column(:contacts, :role, :string)
  end
end
