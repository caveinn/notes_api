require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  # creates new user but does not save
  let(:user) { build(:user) }
  let(:headers) { valid_headers.except('Authorization') }
  let(:valid_attributes) do
    attributes_for(:user, password_confirmation: user.password)
  end

  # User signup test suite
  describe 'POST /auth/signup' do
    context 'when valid request' do
      before { post '/auth/signup', params: valid_attributes.to_json, headers: headers }

      it 'creates a new user' do              
        expect(response).to have_http_status(201)
      end

      it 'returns success message' do
        p json
        expect(json['message']).to match(/Account created successfully/)
      end
    end

    context 'when invalid request' do
      before { post '/auth/signup', params: {}, headers: headers }

      it 'does not create a new user' do
        expect(response).to have_http_status(422)
      end
    end
  end
end