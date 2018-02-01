require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  it 'Get Index Page' do
    get :index
    expect(response.status).to eq(200)
    assert_template 'users/index'
  end
end
