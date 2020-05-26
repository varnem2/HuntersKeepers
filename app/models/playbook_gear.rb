# frozen_string_literal: true

class PlaybookGear < ApplicationRecord
  belongs_to :playbook
  belongs_to :gear
end
