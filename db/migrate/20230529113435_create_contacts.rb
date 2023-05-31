# frozen_string_literal: true

class CreateContacts < ActiveRecord::Migration[7.1]
  def change
    create_table(:contacts) do |t|
      t.string(:name)
      t.references(:contactable, polymorphic: true, null: false)
      t.string(:email)
      t.string(:phone)
      t.string(:link)

      t.timestamps
    end
  end
end
