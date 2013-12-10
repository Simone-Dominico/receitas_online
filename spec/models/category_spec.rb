require 'spec_helper'

describe Category do
  before do
		@category = Category.new(name: "Lanches")
	end

  subject { @category }

  it { should respond_to(:name) }

  it { should be_valid }

end
