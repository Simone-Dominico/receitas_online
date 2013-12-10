require 'spec_helper'

describe "Revenue pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }
  it { should have_title('Receitas') }
  it { should have_content('Receitas') }

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
  describe 
  describe "edit" do
    let(:revenue) { FactoryGirl.create(:revenue) }
    before do 
      sign_in user
      visit edit_revenue_path(revenue)
    end

    describe "page" do
      it { should have_content("Edite sua Receita") }
      it { should have_title("Edit Revenue") }
    end
  end
end