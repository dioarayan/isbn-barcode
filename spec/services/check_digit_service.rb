require "rails_helper"

RSpec.shared_examples "raises exception" do |input|
  it 'displays error message' do
    expect { Calculate::CalculateDigits.new(isbn_input: input).call }.to raise_error(CalculateDigitsException)
  end
end

RSpec.describe 'CalculateDigitsService' do
  describe '#Call' do
    
    context "when the input is valid" do 
      isbn_input = '978014300723'

      it 'displays the correct check digit' do
        result = Calculate::CalculateDigits.new(isbn_input: isbn_input).call
        expect(result).to eq('4')
      end 
    end

    context "when the input has letters" do
      isbn_input = '978014300723asd'

      it_behaves_like 'raises exception', isbn_input
    end

    context "when the input has a length other than 12" do
      isbn_input = '97801430072'

      it_behaves_like 'raises exception', isbn_input
    end

    context "when the input does not start 978" do
      isbn_input = '12301430072'

      it_behaves_like 'raises exception', isbn_input
    end

  end

end
