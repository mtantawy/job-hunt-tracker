# frozen_string_literal: true

module Opportunities
  class ProcessStepsController < ProcessStepsController
    before_action :set_opportunity

    private

    def set_opportunity
      @opportunity = Opportunity.find(params[:opportunity_id])
    end
  end
end
