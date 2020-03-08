# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Fates', type: :request do
  before do
    sign_in create(:user)
  end

  describe 'GET /fates' do
    it 'works! (now write some real specs)' do
      get fates_path
      expect(response).to have_http_status(:ok)
    end
  end
end
