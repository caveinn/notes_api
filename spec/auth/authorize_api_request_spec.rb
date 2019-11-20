require 'rails_helper'
require Rails.root.join('spec/support/controller_spec_helper')

RSpec.describe AuthorizeApiRequest do
  # Create a user
  let(:user) { create(:user) }

  # Mock Auth header
  let(:header) { { 'Authorization' => token_generator(user.id) } }

  # Valid request
  subject(:request) { described_class.new(header) }

  # Invalid request
  subject(:invalid_request) { described_class.new({}) }
  
  describe '#call' do
    # returns user object when request is valid
    context 'when valid request' do
      it 'returns user object' do
        result = request.call
        expect(result[:user]).to eq(user)
      end
    end

    # returns error message when invalid request
    context 'when invalid request' do
      context 'when missing token' do
        it 'raises a MissingToken error' do
          expect { invalid_request.call }
            .to raise_error(ExceptionHandler::MissingToken, 'Missing token')
        end
      end

      context 'when invalid token' do
        subject(:invalid_request) do
          described_class.new('Authorization' => token_generator(5))
        end

        it 'raises an InvalidToken error' do
          expect { invalid_request.call }
            .to raise_error(ExceptionHandler::InvalidToken, /Invalid token/)
        end
      end

      context 'when token is expired' do
        let(:header) { { 'Authorization' => expired_token_generator(user.id) } }
        subject(:request) { described_class.new(header) }

        it 'raises ExceptionHandler::ExpiredSignature error' do
          expect { request.call }
            .to raise_error(
              ExceptionHandler::InvalidToken,
              /Signature has expired/
            )
        end
      end
    end
  end   
end