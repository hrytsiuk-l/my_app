# frozen_string_literal: true

class CampaignsController < ApplicationController
  before_action :find_campaign, only: %i[show update destroy]

  def create
    @campaign = Campaign.new(campaign_params)
    @campaign.user = current_user
    authorize @campaign
    if @campaign.save
      render json: { status: :created, campaign: @campaign }
    else
      render json: @campaign.errors, status: :unprocessable_entity
    end
  end

  def update
    @campaign.user = current_user
    authorize @campaign
    if @campaign.update(campaign_params)
      render json: { status: :ok, campaign: @campaign }
    else
      render json: @campaign.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @campaign.destroy
    head :no_content
  end

  private

  def find_campaign
    @campaign = Campaign.find(params[:id])
    authorize @campaign
  end

  def campaign_params
    params.require(:campaign).permit(:name, :uid, :audience_id)
  end
end
