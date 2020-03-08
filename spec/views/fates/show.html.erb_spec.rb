# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'fates/show', type: :view do
  before do
    @fate = assign(:fate, create(:fate))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(//)
  end
end
