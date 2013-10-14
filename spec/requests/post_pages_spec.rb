require 'spec_helper'

describe "PostPages" do
  subject { page }

  let!(:user) { FactoryGirl.create(:user) }
  before { FactoryGirl.create(:comment) }

  describe "for non-signed-in user" do
    before do
      visit root_path
      click_on 'News'
    end

    describe "index page" do
      it { should_not have_link 'New Post'}
      it { should_not have_link 'Show' }
      it { should_not have_link 'Edit' }
      it { should_not have_link 'Destroy' }
      it { find('.comment_submit').should_not be_visible }

      describe "comments" do
        before { click_on 'Comments (1)' }
        it { should_not have_link 'X' }
        it { should have_css('.errors_2') }

        describe "comment errors", :js => true do
          describe "name left blank" do
            before do
              click_on 'Submit'
            end
            it { should have_content 'Name can not be blank.' }
            it "should not increment comments" do
              expect(Comment.count).to eq(1)
            end
          end
          describe 'body left blank' do
            before do
              find('.comment_commenter').set "Lorem Ipsum"
              click_on 'Submit'
            end
            it { should have_content 'Comment can not be blank.' }
            it "should not increment comments" do
              expect(Comment.count).to eq(1)
            end
          end
        end

        describe "adding a comment" do
          before do
            find('.comment_commenter').set "Lorem Ipsum"
            find('.comment_body').set "Lorem Ipsum"
            click_on "Submit"
            visit root_path
            click_on 'News'
          end
          it "should increment comment count" do
            expect(Comment.count).to eq(2)
          end
          it { should have_link 'Comments (2)' }
        end
      end
    end

    describe "other controller actions" do
      describe "new" do
        before { get new_post_path }
        specify { response.should redirect_to root_path }
      end

      describe "create" do
        before { post posts_path }
        specify { response.should redirect_to root_path }
      end

      describe "show" do
        before { get post_path(1) }
        specify { response.should redirect_to root_path }
      end

      describe "edit" do
        before { get edit_post_path(1) }
        specify { response.should redirect_to root_path }
      end

      describe "update" do
        before { put post_path(1) }
        specify { response.should redirect_to root_path }
      end

      describe "destroy" do
        before { delete post_path(1) }
        specify { response.should redirect_to root_path }
      end

    end
  end

  describe "for signed-in user" do
    before do
      sign_in(user)
      visit root_path
      click_on 'News'
    end

    describe "index page" do
      it { should have_link 'New Post'}
      it { should have_link 'Show' }
      it { should have_link 'Edit' }
      it { should have_link 'Destroy' }

      describe "comments" do
        before { click_on 'Comments (1)' }
        it { should have_link 'X' }
        it "should be able to be destroyed" do
          expect { click_link 'X' }.to change(Comment, :count).by(-1)
        end
      end
    end

    describe "show page" do
      before { click_on 'Show' }
      it { should have_link 'Edit' }
      it { should have_link 'Back' }
    end

    describe "edit page" do
      before { click_on 'Edit' }
      it { should have_content 'Editing post' }
      describe "updating post" do
        before do
          fill_in 'post_content', :with => 'Changed Post'
          click_on 'Update Post'
          visit root_path
          click_on 'News'
        end
        it { should have_content 'Changed Post' }
      end
    end

    describe "new page" do
      before { click_on 'New Post' }
      it { should have_content 'New Post' }
      describe "Creating Post" do
        before do
          fill_in 'post_title', :with => 'Created Post'
          fill_in 'post_content', :with => 'Created Post'
          click_on 'Create Post'
          visit root_path
          click_on 'News'
        end
        it { should have_content 'Created Post' }
        it "should increment post count" do
          expect(Post.count).to eq(2)
        end
      end
    end

    describe "delete post" do
      it "should decrement post count" do
        click_link 'Destroy'
        expect(Post.count).to eq(0)
        expect(page).to_not have_content 'Lorem Ipsum'
      end
    end
  end
end
