require 'rails_helper'

RSpec.describe TransactionsController, type: :controller do

  let!(:user) {User.create(first_name:"Harish", last_name:"Patankar", email:"harishspatankar@gmail.com", password:"harishsp")}
  let!(:category) {Category.create(name:"food")}

  it 'Get Index Page' do
    get :index, params: { user_id: 1 }
    expect(response.status).to eq(200)
  end

  it 'Get new Page' do
    get :new, params: { user_id: 1 }
    expect(response.status).to eq(200)
  end

  it 'Get show Page' do
    get :show, params: { user_id: 1, id:1 }
    expect(response.status).to eq(200)
  end

  it 'Get create Page' do
    get :create, params: { user_id: 1, transaction: { id:1, amount:100, transaction_type:"credit", balance:300, category_id:1 } }
    expect(response.status).to eq(302)
  end

  it 'should give JSON repsonse for Index Page' do
    get :index, params: { user_id: 1 }, format: :json
    expect(response.content_type).to eq('application/json')
  end

  it 'should give HTML repsonse for Index Page' do
    get :index, params: { user_id: 1 }, format: :html
    expect(response.content_type).to eq('text/html')
  end

  it 'should give JSON repsonse for Show Page' do
    get :show, params: { user_id: 1, id:1 }, format: :json
    expect(response.content_type).to eq('application/json')
  end

  it 'should give HTML repsonse for Show Page' do
    get :show, params: { user_id: 1, id:1 }, format: :html
    expect(response.content_type).to eq('text/html')
  end

end
