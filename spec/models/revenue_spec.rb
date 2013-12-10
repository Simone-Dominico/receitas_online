require 'spec_helper'

describe Revenue do

  let(:user) { FactoryGirl.create(:user) }
  let(:category) { FactoryGirl.create(:category) }
  before { @revenue = user.revenues.build(preparation: "Lorem ipsum", name: "Pudim", ingredients: "Leite")}

  subject { @revenue }

  it { should respond_to(:name) }
  it { should respond_to(:preparation) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
   it { should respond_to(:category) }
  it { should respond_to(:ingredients) }

  its(:user) { should eq user }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @revenue.user_id = nil }
    it { should_not be_valid }
  end
  describe "with blank preparation" do
    before { @revenue.preparation = " " }
    it { should_not be_valid }
  end
   describe "with blank name" do
    before { @revenue.name = " " }
    it { should_not be_valid }
  end
    describe "with blank name" do
    before { @revenue.ingredients = " " }
    it { should_not be_valid }
  end

end