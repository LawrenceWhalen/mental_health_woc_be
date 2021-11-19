require 'rails_helper'

describe RegiistrationsController do
  let (:user) {build_user}
  let (:existing_user) { create_user }
  let (:signup_url) { '/api/signup' }

  context 'When creating a new user' do
    before do
      post signup_url, params: {
        user: {
          email: user.email,
          password: user.password,
          username: user.username
        }
      }
    end

    it 'returns 200' do
      expect(response.status).to eq(200)
    end

    it 'returns a json token' do
      expect(response.headers['Authorization']).to be_present
    end

    it 'returns the users email and username' do
      expect(json['data']).to have_attribute(:email).with_value(user.email)
      expect(json['data']).to have_attribute(:username).with_value(user.username)
    end
  end

  context 'When the email alredy exists' do
    before do
      post signup_url, params: {
        user: {
          email: existing_user.email,
          password: user.password,
          username: user.username
        }
      }
    end

    it 'returns 400' do
      binding.pry
    end
  end
end