require 'rails_helper'

RSpec.describe TransactionsController, type: :controller do
  it 'Get Index Page' do
    get :index
    binding.pry
    expect(response.status).to eq(200)
    assert_template '/index'
  end
end
