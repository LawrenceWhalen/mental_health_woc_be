class SerializableUser < JSONAPI::Serializable::Resource
  type 'users'

  attributes :email, :username

  link :self do
    @url_helpers.api_v1_user_url(@object.id)
  end
end