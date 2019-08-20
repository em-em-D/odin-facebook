require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = users(:'testing@example.com')
    @post = @user.post.build(content: "Hello world")
  end

  test "should be valid" do
    assert @post.valid?
  end

  test "user id should be checked" do
    @post.user_id = nil
    assert_not @micropost.valid?
  end

  test "content should be present" do
    @post.content = " hello world"
    assert_not @post.valid?
  end

  test "content should no be more than 200 characters" do
    @post.content = "h" * 200
    assert_not @post.valid?
  end

end
