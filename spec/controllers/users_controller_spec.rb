require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  it 'Get Index Page' do
    get :index
    expect(response.status).to eq(200)
    assert_template 'users/index'
  end

  it 'should give JSON repsonse for Index Page' do
    get :index, format: :json
    expect(response.content_type).to eq('application/json')
  end
end
