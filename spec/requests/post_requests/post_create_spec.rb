require 'rails_helper'

RSpec.describe PostsController do
  let (:user) { create_user }
  let (:post) { create_post }
  let (:create_post_url) { "/api/v1/users/#{user.id}/create"}

  context 'When creating a post' do
    before do
      login_with_api(user)
      create_post_api(post)
    end

    it 'returns a 200 status' do
      expect(response.status).to eq(200)
    end

    it 'returns a json bundle with confirmation' do
      expect(response.body['data']).to eq(post.content)
      expect(response.body['data']).to eq(post.title)
    end
  end

  context 'When a user is not logged in' do
    before do
      create_post_api(post)
    end

    it 'returns a 401 status' do
      expect(response.status).to eq(401)
    end

    it 'returns an error message' do
      expect(json['error']).to eq("Invalid Email or password.")
    end
  end

  context 'When post request is missing information' do
    before do
      login_with_api(user)
      post create_post_url, params: {
        title: nil,
        content: nil
      }
    end

    it 'returns a 401 status' do
      expect(response.status).to eq(401)
    end

    it 'retursn an error message' do
      expect(json['error']).to eq("Invalid Email or password.")
    end
  end

  context 'When a request tries to create a post for another user' do
    before do
      login_with_api(user)
    end

    it 'returns an error' do
      expect(response.status).to eq(401)
    end

    it 'retursn an error message' do
      expect(json['error']).to eq("Invalid Email or password.")
    end
  end

end