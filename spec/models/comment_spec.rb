require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Comment relationships' do
    it { should belong_to(:user) }
    it { should belong_to(:parent) }
  end
end
