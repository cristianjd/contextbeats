require 'spec_helper'

describe Comment do

  let(:post) { FactoryGirl.create(:post) }
  before do
    @comment = post.comments.build(:body => "Lorem Ipsum", :commenter => "Lorem Ipsum")
  end

  subject { @comment }

  it { should respond_to(:commenter) }
  it { should respond_to(:post_id) }
  it { should respond_to(:post) }
  its(:post) { should == post }

  it { should be_valid }

  describe "when post_id is not present" do
    before { @comment.post_id = nil }
    it { should_not be_valid }
  end

  describe "accessible attributes" do
    it "should not allow access to post_id" do
      expect do
        Comment.new(post_id: post.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end

  describe "with blank content" do
    before { @comment.body = " " }
    it { should_not be_valid }
  end
end