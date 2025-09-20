# frozen_string_literal: true

class StatsController < ApplicationController
  before_action :require_login

  def index
    @opportunities_count = Opportunity.count
    @interviews_count = ProcessStep.where.not(scheduled_for: nil).count
    @max_interviews_count, @opportunities_with_most_interviews = opportunities_with_most_interviews
    @interviews_per_day = interviews_per_day
  end

  private

  # move these out and optimize when/if needed

  def opportunities_with_most_interviews
    ProcessStep
      .where
      .not(scheduled_for: nil)
      .group(:opportunity_id)
      .count
      .each_with_object({}) do |thing, result|
        if result[thing[1]].blank?
          result[thing[1]] = [thing[0]]
        else
          result[thing[1]] << thing[0]
        end
      end
      .sort
      .reverse
      .to_h
      .first
  end

  def interviews_per_day
    interviews_per_day = ProcessStep
      .where
      .not(scheduled_for: nil)
      .pluck(:scheduled_for)
      .map(&:to_date)
      .tally
      .sort
      .to_h

    return {} if interviews_per_day.empty?

    dates = (interviews_per_day.keys.first..interviews_per_day.keys.last).to_a
    dates.index_with do |date|
      interviews_per_day[date] || 0
    end
  end
end
