# frozen_string_literal: true

module Opportunities
  class ContactsController < ContactsController
    before_action :set_contactable

    private

    def set_contactable
      @contactable = Opportunity.find(params[:opportunity_id])
    end
  end
end
