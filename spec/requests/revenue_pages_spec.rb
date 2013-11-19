require 'spec_helper'

describe "Revenue pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "revenue creation" do
    before { visit root_path }

    describe "with invalid information" do

      it "should not create a revenue" do
        expect { click_button "Postar" }.not_to change(Micropost, :count)
      end

      describe "error messages" do
        before { click_button "Postar" }
        it { should have_content('error') }
      end
    end

    describe "with valid information" do

      before { fill_in 'revenue_content', with: "Lorem ipsum" }
      it "should create a revenue" do
        expect { click_button "Postar" }.to change(Revenue, :count).by(1)
      end
    end
  end
end
