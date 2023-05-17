require 'application_system_test_case'

class PostsTest < ApplicationSystemTestCase
  test 'User profile picture is being displayed' do
    visit user_posts_path(users(:one))
    assert_selector "img[src='https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png?20150327203541']"
  end
  test 'User username is being displayed' do
    visit user_posts_path(users(:one))
    assert_text 'Jorge'
  end
  test 'Number of posts of the user is being displayed' do
    visit user_posts_path(users(:one))
    assert_text 'Number of posts: 2'
  end
  test 'Posts title and description is being displayed' do
    user = users(:one)
    visit user_posts_path(user)
    user.posts.each do |post|
      assert_text post.title
      assert_text post.text
    end
  end
end
