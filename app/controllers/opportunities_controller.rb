# frozen_string_literal: true

class OpportunitiesController < ApplicationController
  before_action :require_login
  before_action :set_opportunity, only: [:show, :edit, :update, :destroy]

  def index
    @opportunities = Opportunity.sorted
  end

  def show
  end

  def new
    @opportunity = Opportunity.new
  end

  def edit
  end

  def create
    @opportunity = Opportunity.new(opportunity_params)

    if @opportunity.save
      redirect_to(@opportunity)
    else
      render(:new, status: :unprocessable_entity)
    end
  end

  def update
    if @opportunity.update(opportunity_params)
      redirect_to(@opportunity)
    else
      render(:edit, status: :unprocessable_entity)
    end
  end

  def destroy
    @opportunity.destroy
    redirect_to(opportunities_path)
  end

  private

  def opportunity_params
    params.require(:opportunity).permit(
      :company_name,
      :company_link,
      :source_name,
      :source_link,
      :position,
      :job_description_link,
      :job_description,
      :state,
      :notes,
      :created_at,
    )
  end

  def set_opportunity
    @opportunity = Opportunity.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to(opportunities_path, alert: "Opportunity \"#{params[:id]}\" not found")
  end
end
