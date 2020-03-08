# frozen_string_literal: true

class Fate < ApplicationRecord
  belongs_to :hunter

  acts_as_taggable_on :found_out, :heroic, :doom
end
