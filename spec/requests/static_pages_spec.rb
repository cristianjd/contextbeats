require 'spec_helper'

describe "Static Pages" do

  subject { page }
  before { visit root_path }

  describe "Home page" do
    it { should have_content('Welcome') }
  end

  describe "News page" do
    before do
      FactoryGirl.create(:post)
      click_link 'News'
    end
    it { should have_content('Lorem Ipsum') }
  end

  describe "About page" do
    before { click_link 'About' }
    it { should have_content('Context is an') }
  end

  describe "Contact page" do
    before { click_link 'Contact' }
    it { should have_content('Use the form below') }
  end

  describe "for signed_in users" do
    let(:user) { FactoryGirl.create(:user) }
    before do
      sign_in user
      visit root_path
    end

    it  { should have_link("Sign Out") }

    describe "after signing out" do
      before { click_link "Sign Out" }
      it { should_not have_link("Sign Out") }
    end
  end
end
