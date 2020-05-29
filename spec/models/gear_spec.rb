# frozen_string_literal: true

# == Schema Information
#
# Table name: gears
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :string
#  harm        :integer
#  armor       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'rails_helper'

RSpec.describe Gear, type: :model do
  context 'when parameters are valid' do
    let(:gear) { create :gear }

    it 'creates a new Gear' do
      expect(gear).to be_valid
    end
  end

  context 'when parameters are invalid' do
    let(:gear) { build :gear, name: '' }

    it 'does not create a new Gear' do
      expect(gear).not_to be_valid
    end
  end
end
