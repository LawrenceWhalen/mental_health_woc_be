require 'faker'
require 'factory_bot_rails'

module PostHelpers

  def create_post(user)
    FactoryBot.create(:post, 
            title: Faker::Lorem.word,
            content: Faker::Lorem.sentence,
            user: user
        )
  end

  def build_post(user)
    FactoryBot.build(:post, 
            title: Faker::Lorem.word,
            content: Faker::Lorem.sentence,
            user: user
        )
  end

end
