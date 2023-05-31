# frozen_string_literal: true

class AddPositionAndJobDescriptionLinkToOpportunities < ActiveRecord::Migration[7.1]
  def change
    add_column(:opportunities, :position, :string, null: true)
    add_column(:opportunities, :job_description_link, :string, null: true)
  end
end
