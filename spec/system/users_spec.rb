require 'rails_helper'

RSpec.describe User, type: :system do
  subject { User.new(name: 'Hans', posts_counter: 2, photo: 'https://picsum.photos/300/300', bio: 'Hans bio') }
  let(:hans) { User.new(name: 'Hans', posts_counter: 0, photo: 'https://picsum.photos/300/300', bio: 'Hans bio') }
  let(:post_one) { Post.new(author: subject, title: 'This is a title', likes_counter: 0, comments_counter: 0) }
  let(:post_two) { Post.new(author: subject, title: 'This is a title', likes_counter: 0, comments_counter: 0) }
  let(:post_tree) { Post.new(author: subject, title: 'This is a title', likes_counter: 0, comments_counter: 0) }

  before { subject.save }
  before { hans.save }
  before { post_one.save }
  before { post_two.save }
  before { post_tree.save }

end
