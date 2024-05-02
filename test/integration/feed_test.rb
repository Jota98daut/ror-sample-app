require "test_helper"

class FeedTest < ActionDispatch::IntegrationTest
  test 'should see microposts from subscribed platforms' do
    user1 = User.create!(username: 'u1', email: 'u1@example.com', password: '1234567', password_confirmation: '1234567')
    user2 = User.create!(username: 'u2', email: 'u2@example.com', password: '1234567', password_confirmation: '1234567')
    plat = platforms(:plat)
    mpost = Micropost.create!(content: 'content', platform: plat, user: user2)
    sign_in user1
    user1.subscribe plat

    get root_path
    assert_select "#micropost-#{mpost.id}"
  end
end
