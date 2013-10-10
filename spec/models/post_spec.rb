require 'spec_helper'

describe Post do

  before do
    @post = Post.new(:title => "Lorem Ipsum", :content => "Lorem Ipsum")
  end

  subject { @post }

  it { should respond_to(:content) }
  it { should respond_to(:title) }

  it { should be_valid }

  describe "with blank content" do
    before { @post.content = " " }
    it { should_not be_valid }
  end

  describe "comment associations" do

    before { @post.save }
    let!(:older_comment) do
      FactoryGirl.create(:comment, post: @post, created_at: 1.day.ago)
    end
    let!(:newer_comment) do
      FactoryGirl.create(:comment, post: @post, created_at: 1.hour.ago)
    end

    it "should have the right comments in the right order" do
      @post.comments.should == [older_comment, newer_comment]
    end

    it "should destroy associated microposts" do
      comments = @post.comments.dup
      @post.destroy
      comments.should_not be_empty
      comments.each do |comment|
        Comment.find_by_id(comment.id).should be_nil
      end
    end
  end
end