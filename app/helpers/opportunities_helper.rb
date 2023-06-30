# frozen_string_literal: true

module OpportunitiesHelper
  def url_preview(url)
    url = url.to_s
    url = url.split("://")[1] if url.include?("://")
    url = url.split("www.")[1] if url.include?("www.")
    return url if url.length <= 20

    url[0..20] + "..."
  end

  def group_by_state(opportunities)
    opportunities.group_by do |opportunity|
      opportunity.latest_process_step.state
    end.sort_by { |state, _opportunities| ProcessStep.states.keys.index(state) }.to_h
  end
end
