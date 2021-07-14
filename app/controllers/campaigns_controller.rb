class CampaignsController < ApplicationController
  before_action :set_campaign, only: %i[show edit update destroy]

  def create
    @campaign = Campaign.new(campaign_params)
    if @campaign.save
      render json: { status: :created, campaign: @campaign }
    else
      render json: @campaign.errors, status: :unprocessable_entity
    end
  end

  def update
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

  def set_campaign
    @campaign = Campaign.find(params[:id])
  end

  def campaign_params
    params.require(:campaign).permit(:name, :uid, :audience_id)
  end
end