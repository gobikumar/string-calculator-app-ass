require 'rails_helper'

RSpec.describe StringAddCalculatorController, type: :controller do
  describe 'GET #add' do
    it 'renders the add template with empty locals' do
      get :add
      expect(response).to render_template(:add)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST #calculate' do
    context 'with valid input' do
      it 'renders result with HTML' do
        post :calculate, params: { input: '1,2,3' }
        expect(response).to render_template(:add)
        expect(response).to have_http_status(:ok)
      end

      it 'returns result in JSON' do
        post :calculate, params: { input: '1,2,3' }, format: :json
        json = JSON.parse(response.body)
        expect(json['result']).to eq(6)
        expect(json['errors']).to be_nil
        expect(response).to have_http_status(:ok)
      end
    end
  end
end