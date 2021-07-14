require 'rails_helper'

describe Campaign, type: :model do
  let(:campaign) { Campaign.new(name: 'foo', uid: 'cmp_uid',) }
  before { campaign.save }

  context 'relations' do
    it { is_expected.to belong_to(:audience) }
  end

  context 'name uniqueness' do
    let(:campaign1) { Campaign.new(name: 'foo') }
    it { expect(campaign1).to_not be_valid }
  end

  context 'precence name' do
    let(:campaign) { Campaign.new(name: '') }
    it { expect(campaign).to_not be_valid }
  end

  context 'uid uniqueness' do
    let(:campaign1) { Campaign.new(uid: 'cmp_uid') }
    it { expect(campaign1).to_not be_valid }
  end
  
  context 'precence uid' do
    let(:campaign) { Campaign.new(uid: '') }
    it { expect(campaign).to_not be_valid }
  end
end
