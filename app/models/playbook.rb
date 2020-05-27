# frozen_string_literal: true

# == Schema Information
#
# Table name: playbooks
#
#  id             :bigint           not null, primary key
#  name           :string
#  available_gear :int
#  description    :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# The class or playbook that the hunter has
# provides unique abilities to the Hunter
class Playbook < ApplicationRecord
  has_many :improvements
  has_many :playbook_gears
  has_many :gears, through: :playbook_gears
  has_many :moves
  has_many :ratings, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
end
