# frozen_string_literal: true

module ConvertFromAndToUserTimezone
  extend ActiveSupport::Concern

  included do
    columns.each do |column|
      next unless column.type == :datetime

      define_method column.name.to_s do
        self[column.name]&.in_time_zone(user_time_zone)
      end

      define_method "#{column.name}=" do |val|
        self[column.name] = val.in_time_zone(user_time_zone)
      end
    end
  end

  private

  # update this methods to use logged in user's timezone
  def user_time_zone
    "CET"
  end
end
