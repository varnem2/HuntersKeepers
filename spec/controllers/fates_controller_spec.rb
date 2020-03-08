# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FatesController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # Fate. As you add validations to Fate, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    {
      hunter_id: create(:hunter).id,
      found_out_list: 'Nightmares and Visions'
    }
  end

  let(:invalid_attributes) do
    {
      hunter_id: create(:move).id
    }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # FatesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  before do
    @request.env['devise.mapping'] = Devise.mappings[:user]
    sign_in create(:user)
  end

  describe 'GET #index' do
    let!(:fate) { create :fate }

    it 'returns a success response' do
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      fate = Fate.create! valid_attributes
      get :show, params: { id: fate.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      fate = Fate.create! valid_attributes
      get :edit, params: { id: fate.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Fate' do
        expect do
          post :create, params: { fate: valid_attributes }, session: valid_session
        end.to change(Fate, :count).by(1)
      end

      it 'redirects to the created fate' do
        post :create, params: { fate: valid_attributes }, session: valid_session
        expect(response).to redirect_to(Fate.last)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { fate: invalid_attributes }, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:hunter) { create :hunter }
      let(:new_attributes) do
        {
          hunter_id: hunter.id
        }
      end

      it 'updates the requested fate' do
        fate = Fate.create! valid_attributes
        put :update, params: { id: fate.to_param, fate: new_attributes }, session: valid_session
        fate.reload
        expect(fate.hunter).to eq hunter
      end

      it 'redirects to the fate' do
        fate = Fate.create! valid_attributes
        put :update, params: { id: fate.to_param, fate: valid_attributes }, session: valid_session
        expect(response).to redirect_to(fate)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'edit' template)" do
        fate = Fate.create! valid_attributes
        put :update, params: { id: fate.to_param, fate: invalid_attributes }, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested fate' do
      fate = Fate.create! valid_attributes
      expect do
        delete :destroy, params: { id: fate.to_param }, session: valid_session
      end.to change(Fate, :count).by(-1)
    end

    it 'redirects to the fates list' do
      fate = Fate.create! valid_attributes
      delete :destroy, params: { id: fate.to_param }, session: valid_session
      expect(response).to redirect_to(fates_url)
    end
  end
end
