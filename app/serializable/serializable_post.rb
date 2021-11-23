class SerializablePost < JSONAPI::Serializable::Resource
  type 'posts'

  attributes :title, :content

  link :self do
    @url_helpers.api_v1_post_url(@object.id)
  end
end