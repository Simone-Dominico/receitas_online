require 'spec_helper'

describe Revenue do

  let(:user) { FactoryGirl.create(:user) }
  before { @revenue = user.revenues.build(preparation: "Lorem ipsum") }

  subject { @revenue }

  it { should respond_to(:preparation) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
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

  describe "with preparation that is too long" do
    before { @revenue.preparation = "a" * 141 }
    it { should_not be_valid }
  end
end