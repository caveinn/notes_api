require 'rails_helper'

RSpec.describe 'streams API' do
    let(:user) { create(:user) }
    let!(:school) { create(:school) }
    let!(:stream) { create(:stream, school_id: school.id) }
    let!(:notes) {create_list(:note, 2, stream_id: stream.id, user_id: user.id)}
    let(:school_id) { school.id }
    let!(:stream_id) { stream.id }
    let(:id) { notes.first.id }
    let(:headers) { valid_headers }
  
    describe 'GET /schools/:school_id/streams/:stream_id/notes' do
      before { get "/schools/#{school_id}/streams/#{stream_id}/notes", params: {}, headers: headers }

      it 'returns notes' do
        expect(json).not_to be_empty
        expect(json.size).to eq(2)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  
    describe 'GET /schools/:school_id/streams/:stream_id/notes/:id' do
      before { get "/schools/#{school_id}/streams/#{stream_id}/notes/#{id}", params: {}, headers: headers }

      context 'when the note exists' do
        it 'returns a particular stream' do 
          expect(json).not_to be_empty
          expect(json['id']).to eq(id)
        end

        it 'returns status code 200' do
          expect(response).to have_http_status(200)
        end
      end

      context 'when the note does not exist' do
        let(:id) { 100 }
  
        it 'returns status code 404' do
          expect(response).to have_http_status(404)
        end
      end
    end
  
    describe 'POST /schools/:school_id/streams/:stream_id/notes' do
      let(:valid_attributes) { { subject: 'science', topic: 'reproduction', notes: 'male and female' }.to_json }
  
      context 'when request attributes are valid' do
        before do
          post "/schools/#{school_id}/streams/#{stream_id}/notes", params: valid_attributes, headers: headers

          it 'creates a note' do
            expect(json.third['subject']).to eq('science')
            expect(json.third['topic']).to eq('reproduction')
            expect(json.third['notes']).to eq('male and female')
          end
    
          it 'returns status code 201' do
            expect(response).to have_http_status(201)
          end
        end
      end
  
      context 'when an invalid request' do
        before { post "/schools/#{school_id}/streams", params:  {} , headers: headers }

        it 'returns status code 422' do
            expect(response).to have_http_status(422)
          end
      end
    end
  
    describe 'PUT /schools/:school_id/streams/:id' do
      let(:valid_attributes) { { subject: 'maths', topic: 'quadratic equations', notes: 'x=y' }.to_json }
  
      context 'when the note exists' do
        before { put "/schools/#{school_id}/streams/#{stream_id}/notes/#{id}", params: valid_attributes, headers: headers }

        it 'returns status code 200' do
            expect(response).to have_http_status(200)
        end
      end
    end
  
    describe 'DELETE /schools/:school_id/streams/:stream_id/notes:id' do
      before { delete "/schools/#{school_id}/streams/#{stream_id}/notes/#{id}", params: {}, headers: headers }

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
end