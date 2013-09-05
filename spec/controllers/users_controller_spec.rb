require 'spec_helper'

describe UsersController do 

  let(:user) { FactoryGirl.create(:user)}
  before :each do
  sign_in(user)
  end

  describe '#new' do 
    it 'should render new page' do
      get :new
      expect(response).to render_template('new')
    end
  end

  describe '#show' do
    it 'should show a new user' do
      get :show, id: user.id
      response.should render_template('show')
    end
  end

end