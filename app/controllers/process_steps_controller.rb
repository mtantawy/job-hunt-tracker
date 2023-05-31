# frozen_string_literal: true

class ProcessStepsController < ApplicationController
  before_action :require_login
  before_action :set_process_step, only: [:update, :destroy]

  def create
    @opportunity.process_steps.create!(process_step_params)
    redirect_to(@opportunity)
  end

  def update
    @process_step.update!(process_step_params)
    redirect_to(@opportunity)
  end

  def destroy
    @opportunity.process_steps.destroy(@process_step)
    redirect_to(@opportunity)
  end

  private

  def process_step_params
    params.require(:process_step).permit(
      :title,
      :state,
      :notes,
      :created_at,
      :scheduled_for,
    )
  end

  def set_process_step
    @process_step = ProcessStep.find(params[:id])
  end
end
