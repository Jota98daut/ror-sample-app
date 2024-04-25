require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(username: 'new_user', email: 'new_user@example.com',
                     password: 'abcdef', password_confirmation: 'abcdef')
  end

  test 'associated microposts should be destroyed' do
    @user.save!
    @user.microposts.create!(content: 'Lorem Ipsum')
    assert_difference 'Micropost.count', -1 do
      @user.destroy
    end
  end
end
