require 'rails_helper'

describe "update a board route", :type => :request do
  # let!(:boards) { FactoryBot.create_list(:board, 20)}

  before(:each) do
    @board = Board.create({:name => 'Chuck Testa Message Board'})
  end

  # before do
  #   post '/boards', params: { :name => 'Chuck Testa Message Board'}
  #   put '/boards/1', params: { :name => 'I Hate Chuck Testa'}
  # end

  
  it 'returns the board name' do
    put "/boards/#{@board.id}", params: {:name => 'I Hate Chuck Testa'}
    get "/boards/#{@board.id}"
    expect(JSON.parse(response.body)['name']).to eq('I Hate Chuck Testa')
  end

  it 'returns a created status' do
    put "/boards/#{@board.id}/", params: {:name => 'I Hate Chuck Testa'}
    expect(response).to have_http_status(200)
  end
end