# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'fates/index', type: :view do
  let(:fates) { create_list(:fate, 2) }

  before do
    assign(:fates, fates)
  end

  it 'renders a list of fates' do
    render
    assert_select 'tr>td', text: fates.first.hunter.name
    assert_select 'tr>td', text: fates.first.hunter.name
  end
end
