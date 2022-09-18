require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject(:comment) do
    user = User.create(name: 'Maria', photo: '', bio: 'Teacher from Brazil.')
    new_post = Post.create(author: user, title: 'Hello 1 (Tom)', text: 'This is my first post')
    Comment.new(author: user, post: new_post, text: 'hey')
  end

  before { comment.save }

  describe 'validations' do
    it 'does not validate without an author' do
      comment.author = nil
      expect(comment).to_not be_valid
    end

    it 'should update the comments counter' do
      expect(comment.send(:update_comments_counter)).to be_valid
    end
  end
end
