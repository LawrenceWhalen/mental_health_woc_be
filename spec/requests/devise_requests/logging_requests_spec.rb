require 'rails_helper'

RSpec.describe SessionsController, type: :request do
  let (:user) { create_user }
  let (:login_url) { '/api/login' }
  let (:logout_url) { '/api/logout' }

  context 'When loggin in' do
    before do
      login_with_api(user)
    end

    it 'returns a json token' do
      expect(response.headers['Authorization']).to be_present
    end

    it 'returns 200' do
      expect(response.status).to eq(200)
    end
  end

  context 'When password is incorrect' do
    before do
      post login_url, params: {
        user: {
          email: user.email,
          password: "#{user.password}_incorrect"
        }
      }
    end

    it 'returns 401' do
      expect(response.status).to eq(401)
    end

    it 'returns a non-exploitable error message' do
      expect(json['error']).to eq("Invalid Email or password.")
    end
  end

  context 'When password is missing' do
    before do
      post login_url, params: {
        user: {
          email: 'user.email',
          passoer: nil
        }
      }
    end

    it 'returns 401' do
      expect(response.status).to eq(401)
    end

    it 'returns a non-exploitable error message' do
      expect(json['error']).to eq("Invalid Email or password.")
    end
  end

  context 'When User does not exist' do
    before do
      post login_url, params: {
        user: {
          email: 'test_email@test.com',
          passoer: 'test_password'
        }
      }
    end

    it 'returns 401' do
      expect(response.status).to eq(401)
    end

    it 'returns a non-exploitable error message' do
      expect(json['error']).to eq("Invalid Email or password.")
    end
  end

  context 'When logging out' do
    it 'returns 204' do
      delete logout_url

      expect(response.status).to eq(204)
    end
  end
end