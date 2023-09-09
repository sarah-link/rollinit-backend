# frozen_string_literal: true

shared_examples 'a successful response' do
  it 'is successful' do
    expect(response.content_type).to eq('application/json; charset=utf-8')
    expect(response).to have_http_status(:success)
  end
end

shared_examples 'a bad response' do
  it 'returns a 404' do
    expect(response.content_type).to eq('application/json; charset=utf-8')
    expect(response).to have_http_status(404)
  end
end
