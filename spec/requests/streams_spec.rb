require 'rails_helper'


RSpec.describe 'streams API' do
    let(:user) { create(:user) }
    let!(:school) { create(:school) }
    let!(:streams) { create_list(:stream, 2, school_id: school.id) }
    let(:school_id) { school.id }
    let(:id) { streams.first.id }
    let(:headers) { valid_headers }
  
    # get streams
    describe 'GET /schools/:school_id/streams' do
      before { get "/schools/#{school_id}/streams", params: {}, headers: headers }

      it 'returns streams' do
        expect(json).not_to be_empty
        expect(json.size).to eq(2)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  
    # get stream by id
    describe 'GET /schools/:school_id/streams/:id' do
      before { get "/schools/#{school_id}/streams/#{id}", params: {}, headers: headers }

      context 'when the stream exists' do
        it 'returns a particular stream' do 
          expect(json).not_to be_empty
          expect(json['id']).to eq(id)
        end

        it 'returns status code 200' do
          expect(response).to have_http_status(200)
        end
      end

      context 'when the stream does not exist' do
        let(:id) { 100 }
  
        it 'returns status code 404' do
          expect(response).to have_http_status(404)
        end
      end
    end
  
    # post a stream
    describe 'POST /schools/:school_id/streams' do
      let(:valid_attributes) { { name: 'four' }.to_json }
  
      context 'when request attributes are valid' do
        before { post "/schools/#{school_id}/streams", params: valid_attributes, headers: headers }

        it 'creates a stream' do
          expect(json['streams'].third['name']).to eq('four')
        end
  
        it 'returns status code 200' do
          expect(response).to have_http_status(200)
        end
      end
  
      context 'when an invalid request' do
        before { post "/schools/#{school_id}/streams", params: {}, headers: headers }

        it 'returns status code 422' do
          expect(response).to have_http_status(422)
        end
  
        it 'returns a validation failure message' do
          expect(response.body)
            .to match(/Validation failed: Name can't be blank/)
        end
      end
    end
  
    # edit a stream by id
    describe 'PUT /schools/:school_id/streams/:id' do
      let(:valid_attributes) { { name: 'four' }.to_json }
  
      context ' when a stream exists' do
        before { put "/schools/#{school_id}/streams/#{id}", params: valid_attributes, headers: headers }

        it 'returns status code 200' do
          expect(response).to have_http_status(200)
        end
      end
    end
  
    # delete a stream by id
    describe 'DELETE /schools/:id' do
      before { delete "/schools/#{school_id}/streams/#{id}", params: {}, headers: headers }

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end