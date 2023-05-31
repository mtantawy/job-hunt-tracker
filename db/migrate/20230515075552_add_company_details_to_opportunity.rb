# frozen_string_literal: true

class AddCompanyDetailsToOpportunity < ActiveRecord::Migration[7.1]
  def change
    add_column(:opportunities, :company_name, :string)
    add_column(:opportunities, :company_link, :string)
  end
end
