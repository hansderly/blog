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

  # Index page
  # describe 'index page' do
  #   it 'shows the rendering of user Hans name' do
  #     visit '/'
  #     expect(page).to have_content('Hans')
  #   end
  # end

  # Show page
  describe 'show page' do
    it "should display the user's profile picture." do
      visit "/users/#{subject.id}"
      expect(page.find('img')['src']).to have_content subject.photo
    end

    it 'should render the username of the user' do
      visit "/users/#{subject.id}"
      expect(page).to have_content(subject.name)
    end

    it 'should render the  number of posts the user has written.' do
      visit "/users/#{subject.id}"
      expect(page.find('.post-counter')).to have_content subject.posts_counter.to_s
    end

    it 'should render the  bio of the user' do
      visit "/users/#{subject.id}"
      expect(page.find('.bio-text')).to have_content subject.bio.to_s
    end

    it 'should render the  3 first posts of the user' do
      visit "/users/#{subject.id}"
      expect(page).to have_selector('.post-comment', count: 3)
    end
  end
end
