# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'fates/edit', type: :view do
  before do
    @fate = assign(:fate, create(:fate))
  end

  it 'renders the edit fate form' do
    render

    assert_select 'form[action=?][method=?]', fate_path(@fate), 'post' do
      assert_select 'input[name=?]', 'fate[hunter_id]'
    end
  end
end
