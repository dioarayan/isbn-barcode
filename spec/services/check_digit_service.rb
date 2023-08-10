require "rails_helper"

describe '#Show check digit result' do
  let(:input) {'978014300723'}

  shared_examples "an invalid input" do
    it { is_expected.not_to be_valid }
  end

  context "when the input is blank" do 
    
  end

  context "when the input has letters present" do

  end

  context "when the input has minimum numbers of 12" do

  end

end