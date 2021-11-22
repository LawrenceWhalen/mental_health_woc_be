require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Post relationships' do
    it { should belong_to(:user) }
    it { should have_many(:comments) }
  end

  describe 'Post validations' do
    it { should validate(:title), presence: true}
    it { should validate(:content), presence: true}
  end
end
