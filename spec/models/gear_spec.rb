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
  let(:gear) { create :gear }
  let(:playbook) { create :playbook, gears: [gear] }

  it 'can determine which playbooks the gear belongs to' do
    expect(gear.playbooks).to include(playbook)
  end
end
