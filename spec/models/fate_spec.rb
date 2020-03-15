# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Fate, type: :model do
  let(:fate) { create :fate }

  context 'with valid attributes' do
    it 'creates and stores attributes' do
      expect(fate).to be_valid
    end
  end

  describe 'validations' do
    context 'with one found_out tag from the list' do
      let(:fate) { build :fate, found_out_list: ['Nightmares and visions'] }

      it { expect(fate).to be_valid }
    end

    context 'with a found_out tag not from the list' do
      let(:fate) { build :fate, found_out_list: ['Elephant delivery'] }

      it { expect(fate).not_to be_valid }
    end

    context 'when hunter found out two different ways' do
      let(:fate) { build :fate, found_out_list: ['Nightmares and visions', 'Some weirdo told you'] }

      it { expect(fate).not_to be_valid }
    end
  end
end
