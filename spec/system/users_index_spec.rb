
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

  describe 'index page' do
    it 'shows the rendering of user Hans name' do
      visit '/'
      expect(page).to have_content('Hans')
    end
    it 'shows the rendering of user Hans name' do
      visit '/'
      expect(page).to have_content('Hans')
    end
    it 'show the images from user Hans' do
      visit '/'
      sleep(4)
      expect(page.find("#user-#{hans.id}")['src']).to have_content 'https://picsum.photos/300/300'
    end
    it 'show the images from user Hans' do
      visit '/'
      sleep(4)
      expect(page.find("#user-#{subject.id}")['src']).to have_content 'https://picsum.photos/300/300'
    end
    it 'show the posts_counter from user Hans' do
      visit '/'
      expect(page.find("#counter-#{hans.id}")).to have_content hans.posts_counter.to_s
    end
    it 'show the posts_counter from user Hans' do
      visit '/'
      expect(page.find("#counter-#{subject.id}")).to have_content subject.posts_counter.to_s
    end
    it 'redirects from user index to user show Hans' do
      visit '/' # Visit the user index page
      find('span', text: hans.name, match: :first).click
      expect(page).to have_current_path("/users/#{hans.id}", ignore_query: true)
    end
  end

end
