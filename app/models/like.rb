class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :post
  validates_associated :post, :author
  after_save :update_likes_counter
  # Method that updates the likes counter for a post.
  def update_likes_counter
    post.increment!(:likes_counter)
  end

  private :update_likes_counter
end
