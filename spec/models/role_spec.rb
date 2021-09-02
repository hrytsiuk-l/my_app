# frozen_string_literal: true

require 'rails_helper'

describe Role, type: :model do
  let(:role) { Role.new(name: 'foo') }
  before { role.save }

  context 'relations' do
    it { is_expected.to have_many(:user_roles) }
    it { is_expected.to have_many(:users).through(:user_roles) }
  end

  context 'name uniqueness' do
    let(:role1) { Role.new(name: 'foo') }
    it { expect(role1).to_not be_valid }
  end

  context 'precence name' do
    let(:role) { Role.new(name: '') }
    it { expect(role).to_not be_valid }
  end
end