# frozen_string_literal: true

FactoryBot.define do
  factory :fate do
    hunter
    found_out_list { 'Nightmares and visions' }
    heroic_list { ['Sacrifice', 'True Love'] }
    doom_list { %w[Death Damnation] }
  end
end
