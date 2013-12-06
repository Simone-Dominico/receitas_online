require 'spec_helper'

describe "Revenue pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "revenue creation" do
    before { visit root_path }

    describe "with invalid information" do

      it "should not create a revenue" do
        expect { click_button "Post" }.not_to change(Revenue, :count)
      end

      describe "error messages" do
        before { click_button "Post" }
        it { should have_content('error') }
      end
    end
  end
end