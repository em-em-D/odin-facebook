require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @post = post(content:'hello world')
    @comment = @post.comment.build(writeup: "lorem")
  end

  test "should be valid" do
    assert @comment.valid?
  end

  test "post id should be checked" do
    @comment.post_id = nil
    assert_not @comment.valid?
  end

  test "writeup should be present" do
    @comment.writeup = " lorem"
    assert_not @comment.valid?
  end

  test "content should no be more than 100 characters" do
    @comment.writeup = "L" * 100
    assert_not @comment.valid?
  end

end
