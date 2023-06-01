# frozen_string_literal: true

module ApplicationHelper
  def datetime_format_full(datetime)
    "#{datetime.strftime("%A, %d.%m.%Y %I:%M %p")}
    (#{time_ago_in_words(datetime)}
    #{datetime.before?(Time.current) ? "ago" : "from now"})"
  end

  def date_format_short(datetime)
    datetime.strftime("%d.%m.%Y")
  end

  def notes_preview(notes)
    notes.to_plain_text.slice(0..100).squish + "..."
  end
end
