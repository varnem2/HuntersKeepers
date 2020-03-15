# frozen_string_literal: true

class Fate < ApplicationRecord
  belongs_to :hunter

  FOUND_OUT = [
    'Nightmares and visions',
    'Some weirdo told you',
    'An ancient cult found you',
    'Sought out by your nemesis',
    'Attacked by monsters',
    'Trained from birth',
    'You found the prophecy'
  ].freeze

  acts_as_taggable_on :found_out, :heroic, :doom
  validates :found_out_list,
            length: { is: 1 },
            array_inclusion: { in: FOUND_OUT }
end
