# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PlaybookGear, type: :model do
  let(:gear) { create :gear }
  let(:playbook) { create :playbook }

  it 'correctly pulls gear from a playbook' do
    playbook.gears << gear
    expect(playbook.gears.ids).to include(gear.id)
  end

  it 'correctly pulls playbooks from gear' do
    playbook.gears << gear
    expect(gear.playbooks.ids).to include(playbook.id)
  end
end
