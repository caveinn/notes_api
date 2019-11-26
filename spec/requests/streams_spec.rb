RSpec.describe 'streams API' do
    let(:user) { create(:user) }
    let!(:school) { create(:school, created_by: user.id) }
    let!(:streams) { create_list(:item, 20, school_id: school.id) }
    let(:school_id) { school.id }
    let(:id) { streams.first.id }
    let(:headers) { valid_headers }
  
    describe 'GET /schools/:school_id/streams' do
      before { get "/schools/#{school_id}/streams", params: {}, headers: headers }
    end
  
    describe 'GET /schools/:school_id/streams/:id' do
      before { get "/schools/#{school_id}/streams/#{id}", params: {}, headers: headers }
    end
  
    describe 'POST /schools/:school_id/streams' do
      let(:valid_attributes) { { name: 'four' }.to_json }
  
      context 'when request attributes are valid' do
        before do
          post "/schools/#{school_id}/streams", params: valid_attributes, headers: headers
        end
      end
  
      context 'when an invalid request' do
        before { post "/schools/#{school_id}/streams", params: {}, headers: headers }
      end
    end
  
    describe 'PUT /schools/:school_id/streams/:id' do
      let(:valid_attributes) { { name: 'four' }.to_json }
  
      before do
        put "/schools/#{school_id}/streams/#{id}", params: valid_attributes, headers: headers
      end
    end
  
    describe 'DELETE /schools/:id' do
      before { delete "/schools/#{school_id}/streams/#{id}", params: {}, headers: headers }
    end
end