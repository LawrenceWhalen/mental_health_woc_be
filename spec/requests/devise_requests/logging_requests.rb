require 'rails_helper'

RSpec.describe 'login/out requests' do
  let (:user) { create_user }
  let (:login_url) { '/api/login' }
  let (:logout_url) { '/api/logout' }

  context 'When loggin in' do
    before do
      login)(user)
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
          password: "#{user.email}_incorrect"
        }
      }
    end

    it 'returns 401' do
      expect(response.status).to eq(401)
    end

    it 'returns an error message' do
      expect(json['errors'][0]['detail']).to eq("Email has already been taken")
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

    it 'returns an error message' do
      expect(json['errors'][0]['detail']).to eq("Email has already been taken")
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

    it 'returns an error message' do
      expect(json['errors'][0]['detail']).to eq("Email has already been taken")
    end
  end

  context 'When logging out' do
    it 'returns 204' do
      delete logout_url

      expect(response.status).to eq(204)
    end
  end
end