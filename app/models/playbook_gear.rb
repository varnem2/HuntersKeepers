# frozen_string_literal: true

# Through table model for Playbook <=> Gear
class PlaybookGear < ApplicationRecord
  belongs_to :playbook
  belongs_to :gear
end
