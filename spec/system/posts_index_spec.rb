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

  describe 'index page' do
    it 'show the user profile picture' do
      visit "/users/#{user.id}/posts"
      expect(page.find('img')['src']).to have_content user.photo
    end
    it 'shows the User name' do
      visit "/users/#{user.id}/posts"
      expect(page).to have_content(user.name)
    end
    it 'show the posts_counter from user profile' do
      visit "/users/#{user.id}/posts"
      expect(page.find('.post-counter')).to have_content user.posts_counter.to_s
    end
    it 'Show the post title on posts#index' do
      visit "/users/#{user.id}/posts"
      expect(page).to have_content subject.title
    end
    it 'Show the post body on posts#index' do
      visit "/users/#{user.id}/posts"
      expect(page).to have_content subject.text
    end
    it 'Show the first comment of a post on posts#index' do
      visit "/users/#{user.id}/posts"
      expect(page).to have_content comment.text
    end
    it 'Show the number of comments of a post on posts#index' do
      visit "/users/#{user.id}/posts"
      expect(page.find("#comments-likes-#{subject.id}")).to have_content subject.comments_counter.to_s
    end
    it 'Show the number of likes of a post on posts#index' do
      visit "/users/#{user.id}/posts"
      expect(page.find("#comments-likes-#{subject.id}")).to have_content subject.likes_counter.to_s
    end
    it 'Show the see all post button of a posts#index' do
      visit "/users/#{user.id}/posts"
      expect(page).to have_content('Pagination')
    end
    it 'redirects from post#index to post#show' do
      visit "/users/#{user.id}/posts"
      find("#show-post-#{subject.id}", text: subject.title).click
      expect(page).to have_current_path("/users/#{user.id}/posts/#{subject.id}", ignore_query: true)
    end
  end
end
