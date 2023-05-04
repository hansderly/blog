class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_save :update_post_litkes_counter

  private

  def udpate_post_likes_counter
    post.increment!(:likes_count)
  end
end
