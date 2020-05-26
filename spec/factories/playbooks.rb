# frozen_string_literal: true

FactoryBot.define do
  factory :playbook do
    name { 'The Unspecified' }
    description { 'A mysterious wonderer' }
    gears { [FactoryBot.create(:gear)] }
  end
end
