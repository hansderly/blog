require 'rails_helper'

RSpec.describe Post, type: :system do
  let(:user) { User.create(name: 'Hans', posts_counter: 0, photo: 'https://picsum.photos/300/300', bio: 'Hans bio') }
  subject do
    Post.create(author: user, title: 'This is a title', text: 'And this is the post body', likes_counter: 0,
                comments_counter: 0)
  end

  let(:hans) { User.create(name: 'Hans', posts_counter: 0, photo: 'https://picsum.photos/300/300', bio: 'Hans bio') }
  let(:post_one) { Post.create(author: user, title: 'This is a title 2', likes_counter: 0, comments_counter: 0) }
  let(:post_two) { Post.create(author: user, title: 'This is a title 3', likes_counter: 0, comments_counter: 0) }
  let(:post_tree) { Post.create(author: user, title: 'This is a title 4', likes_counter: 0, comments_counter: 0) }
  let(:comment) { Comment.create(text: 'This is the comment #0', post: subject, author: user) }
  let(:comment_two) { Comment.create(text: 'This is the comment #1', post: subject, author: hans) }

  before { subject.save }
  before { hans.save }
  before { user.save }
  before { post_one.save }
  before { post_two.save }
  before { post_tree.save }
  before { comment.save }
  before { comment_two.save }

  # INDEX PAGE CAPYBARA
end
