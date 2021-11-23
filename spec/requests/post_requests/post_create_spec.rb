require 'rails_helper'

RSpec.describe Api::V1::PostsController, type: :request do
  let (:user) { create_user }
  let (:content_post) { create_post(user) }
  let (:create_post_url) { "/api/v1/users/#{user.id}/posts" }

  context 'When creating a post' do
    before do
      login_with_api(user)
      response_headers = response.headers
      create_post_api(content_post, response_headers)
    end

    it 'returns a 200 status' do
      expect(response.status).to eq(200)
    end

    it 'returns a json bundle with confirmation' do
      expect(response.body[content_post.title]).to be_present
      expect(response.body[content_post.content]).to be_present
    end
  end

  context 'When a user is not logged in' do
    before do
      create_post_api(content_post, 'Bearer')
    end

    it 'returns a 401 status' do
      expect(response.status).to eq(401)
    end

    it 'returns an error message' do
      expect(json['error']).to eq("You need to sign in or sign up before continuing.")
    end
  end

  context 'When post request is missing information' do
    before do
      login_with_api(user)
      post create_post_url, params: {
        title: nil,
        content: nil
      }, 
      headers: {
        'Authorization': response['Authorization']
      }
    end

    it 'returns a 401 status' do
      expect(response.status).to eq(403)
    end

    it 'retursn an error message' do
      expect(json['errors'][0]['message']).to eq('Missing required fields')
    end
  end
end