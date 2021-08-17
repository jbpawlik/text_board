require 'rails_helper'

describe "get all boards route", :type => :request do
  let!(:boards) { FactoryBot.create_list(:board, 20)}

  before { get '/boards'}

  it 'returns all boards' do
    expect(JSON.parse(response.body).size).to eq(20)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end