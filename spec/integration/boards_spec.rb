require 'swagger_helper'

describe 'Text_Board API' do

  path '/boards' do

    post 'Creates a board' do
      tags 'Boards'
      consumes 'application/json'
      parameter name: :board, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string }
        },
        required: [ 'name' ]
      }

      response '201', 'board created' do
        let(:board) { { name: 'foo' } }
        run_test!
      end

      response '404', "Name can't be blank" do
        let(:board) { { name: ''} }
        run_test!
      end
    end
  end

  path '/boards' do

    get 'Retrieves all the boards' do
      tags 'Boards'
      produces 'application/json'
      parameter id: :board, in: :path, type: :string

      response '200', 'board found' do
        schema type: :object,
          properties: {
            name: { type: :string },
          },
          required: ['name']

        let(:board) { { name: 'foo' } }
        run_test!
      end
    end
  end

  path '/boards/{id}' do

    get 'Retrieves a board' do
      tags 'Boards'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      response '200', 'board found' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            name: { type: :string },
          },
          required: ['name']

        let(:id) { Board.create!(name: 'foo').id.to_i }
        run_test!
      end

      response '404', 'board not found' do
        let(:id) { -1}
        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:'Accept') { 'application/foo' }
        run_test!
      end
    end
  end
end

