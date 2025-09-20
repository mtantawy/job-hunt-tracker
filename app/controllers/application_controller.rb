# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Clearance::Controller

  before_action do
    Rack::MiniProfiler.authorize_request
  end
end
