require 'rails_helper'

describe CampaignsController, type: :controller do
  describe 'POST #create' do
    let(:audience) { FactoryBot.create(:audience) }

    context 'valid params' do
      let(:valid_attributes) { {name: 'CMP name', uid: '12345', audience_id: audience.id} }

      it 'succesfully saved' do
        expect do
          post :create, params: { campaign: valid_attributes }
        end.to change(Campaign, :count).by(1)

        expect(response).to have_http_status(200)
        expect(JSON.parse(response.body)['campaign']['uid']).to eq('12345')
      end
    end

    context 'invalid params' do
      let(:invalid_attributes) { {name: 'CMP name', uid: nil, audience_id: audience.id} }

      it 'not created' do
        expect do
          post :create, params: { campaign: invalid_attributes }
        end.to_not change(Campaign, :count)

        expect(response).to have_http_status(422)
      end
    end
  end

  describe 'PUT #update' do
    let!(:campaign) { FactoryBot.create(:campaign) }
    let(:valid_attributes) { FactoryBot.attributes_for(:campaign) }
    let(:invalid_attributes) { FactoryBot.attributes_for(:campaign, name: '', uid: '') }

    context 'valid params' do
      it 'campaign is successfully updated' do
        put :update, params: { id: campaign.id, campaign: valid_attributes }

        expect(response).to have_http_status(200)
        expect(JSON.parse(response.body)['campaign']['uid']).to eq(valid_attributes[:uid])
      end
    end

    context 'invalid params' do
      it "campaign doesn't get updated" do
        put :update, params: {  id: campaign.id, campaign: invalid_attributes }

        expect(response).to have_http_status(422)
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:campaign) { FactoryBot.create(:campaign) }

    it 'deletes campaign' do
      expect do
        delete :destroy, params: { id: campaign.id }
      end.to change(Campaign, :count).by(-1)
      
      expect(response).to have_http_status(:no_content)
    end
  end
end
