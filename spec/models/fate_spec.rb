# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Fate, type: :model do
  let(:fate) { create :fate }

  context 'with valid attributes' do
    it 'creates and stores attributes' do
      expect(fate).to be_valid
    end
  end
end
