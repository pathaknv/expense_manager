require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  let!(:user) { User.create(first_name: 'Nikhil', last_name: 'Pathak', email: 'nvp@g.com',password: 'qwertyuiop') }

  context 'Index Page Validation' do
    it 'should get HTML response for Index Page' do
      get :index
      expect(response.status).to eq(200)
      assert_template 'users/index'
    end

    it 'should give JSON repsonse for Index Page' do
      get :index, format: :json
      expect(response.content_type).to eq('application/json')
    end
  end

  context 'User Creation Testcases' do
    it 'should accept response with explicit params' do
      post :create, params: { user: { first_name: 'Nikhil', last_name: 'Pathak', email: 'nvp@g.com',password: 'qwertyuiop' } }, format: :json
      expect(response.status).to eq(302)
      expect(response.content_type).to eq('text/html')
    end

    it 'should get new page with HTML response' do
      get :new
      expect(response.status).to eq(200)
      expect(response.content_type).to eq('text/html')
    end
  end

  context 'Show Page Validations' do
    it 'should get HTML response for Show Page' do
      get :show, params: { id: 1 }
      expect(response.status).to eq(200)
      expect(response.content_type).to eq('text/html')
    end

    it 'should get JSON response for Show Page' do
      get :show, params: { id: 1 }, format: :json
      expect(response.status).to eq(200)
      expect(response.content_type).to eq('application/json')
    end
  end

end
