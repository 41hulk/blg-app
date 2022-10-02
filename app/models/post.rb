class Post < ApplicationRecord
  has_many :likes
  has_many :comments
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  after_save :update_posts_counter
  validates_associated :author
  validates :title, length: { in: 1..250, message: 'the title should not exceed 250 char' }
  validates :text, presence: true
  validates :likes_counter, comparison: { greater_than_or_equal_to: 0 }
  validates :comments_counter, comparison: { greater_than_or_equal_to: 0 }

  def find_comments
    Comment.where(post: self).order(created_at: :desc).limit(5)
  end

  private

  # A method that updates the posts counter for a user.
  def update_posts_counter
    author.increment!(:posts_counter)
  end

end
