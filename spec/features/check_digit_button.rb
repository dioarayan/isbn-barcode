require "rails_helper"

describe '#Show check digit result' do
  let(:input) {'978014300723'}

  before do
    click_calculate
  end

  context "when successful click" do 
    it "redirects to result page" do
      expect(page).to have_content("Result")
        .and have_content('4')
        .and have_content(input + 4.to_s)
    end
  end
end