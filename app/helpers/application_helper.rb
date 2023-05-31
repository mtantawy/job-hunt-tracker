# frozen_string_literal: true

module ApplicationHelper
  # update these methods to accept timezone or use logged in user's timezone
  def datetime_format_full(datetime)
    "#{datetime.getlocal.strftime("%A, %d.%m.%Y %I:%M %p")} (#{time_ago_in_words(datetime)} ago)"
  end

  def date_format_short(datetime)
    datetime.getlocal.strftime("%d.%m.%Y")
  end
end
