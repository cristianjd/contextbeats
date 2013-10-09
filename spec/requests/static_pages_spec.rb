require 'spec_helper'

describe "Static Pages" do

  subject { page }
  before { visit root_path }

  shared_examples_for "links to pages" do
    it "correctly changes page" do
      click_link(name)
      expect(page).to have_selector(".activenav")
    end
  end

  describe "Home page" do
    it { should have_content('Welcome') }
    it { should have_no_selector(".activenav") }
  end

 # describe "News page" do
 #   let(:name) { 'News' }
 #   it_should_behave_like "links to pages"
 # end
end
