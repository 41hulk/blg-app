require 'rails_helper'

RSpec.describe Like, type: :model do
  subject(:like) do
    user = User.create(name: 'Maria', photo: '', bio: 'Teacher from Brazil.')
    new_post = Post.create(author: user, title: 'Hello 1 (Tom)', text: 'This is my first post')
    Like.new(post: new_post, author: user)
  end

  before { like.save }

  describe 'validations' do
    it 'does not validate without an author' do
      like.author = nil
      expect(comment).to_not be_valid
    end

    it 'should update the likes counter' do
      expect(like.send(:update_likes_counter)).to be_valid
    end
  end
end
