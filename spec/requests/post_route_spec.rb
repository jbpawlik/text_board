require 'rails_helper'

describe "post a board route", :type => :request do

  before do
    post '/boards', params: { :name => 'Chuck Testa Message Board' }
  end

  it 'returns the board name' do
    expect(JSON.parse(response.body)['name']).to eq('Chuck Testa Message Board')
  end

  it 'returns a created status' do
    expect(response).to have_http_status(:created)
  end
end