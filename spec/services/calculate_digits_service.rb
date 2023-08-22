require "rails_helper"

RSpec.shared_examples "raises exception" do |input|
  it 'displays error message' do
    expect { Calculate::CalculateDigits.new(isbn_input: input).call }.to raise_error(CalculateDigitsException)
  end
end

RSpec.describe 'CalculateDigitsService' do
  describe '#Call' do
    
    context "when there is an input" do 
      isbn_input = '978014300723'

      it 'displays the complete ISBN' do
        result = Calculate::CalculateDigits.new(isbn_input: isbn_input).call
        expect(result).to eq('9780143007234')
      end 
    end
    
    context "when the expected check digit is 0" do 
      isbn_input = '978014308291'

      it 'displays the complete ISBN with 0 as the last digit' do
        result = Calculate::CalculateDigits.new(isbn_input: isbn_input).call
        expect(result).to eq('9780143082910')
      end 
    end

  end

end

