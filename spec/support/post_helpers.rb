require 'faker'
require 'factory_bot_rails'

module PostHelpers

  def create_user
    FactoryBot.create(:post, 
            title: Faker::Lorem.word,
            content: Faker::Lorem.sentence
        )
  end

    def build_user
    FactoryBot.build(:post, 
            title: Faker::Lorem.word,
            content: Faker::Lorem.sentence
        )
  end

end
