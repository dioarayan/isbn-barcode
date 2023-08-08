require "rails_helper"

describe  '#Show check digit result' do
  before do
    click_calculate
  end

  context "when successful click" do 
    it "redirects to result page" do
      expect(page).to have_content("Result")
    end
  end
end