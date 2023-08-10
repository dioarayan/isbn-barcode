require "rails_helper"

describe '#Show check digit result' do
  let(:input) { :isbn_input }

  shared_examples "an invalid input" do
    
    it { is_expected.not_to be_valid }
  end

  context "when the input is blank" do 
    input = ""

    expect_any_instance_of(isbn_controller).to receive(:solve).with()
    

    it_behaves_like "an invalid input"
  end

  context "when the input has letters present" do
    let(:input) {'978asd123'}

    it_behaves_like "an invalid input"
  end

  context "when the input has minimum numbers of 12" do
    let(:input) {'978'}

    it_behaves_like "an invalid input"
  end

end