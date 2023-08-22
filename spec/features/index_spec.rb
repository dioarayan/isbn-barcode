require "rails_helper"

RSpec.describe "#Index", type: :feature, js: true do

  before do 
    visit root_path
  end
  
  context "when visiting the page" do
    it "shows the index page" do

      expect(page).to have_content("ISBN13 check digit Generator")
    end
  end

  context "when clicking the calculate button" do
    it "displays the result" do
      within ".isbn-form" do
        fill_in "isbn_input", with: "978014300723"
        click_button "Calculate" 
      end

      expect(page).to have_content("Complete ISBN is: 9780143007234")
    end
  end

  context "when clicking the Reset button" do
    it "clears the result and input" do
      within ".isbn-form" do
        click_link "Reset"
      end
      
      expect(page).to have_content("Enter ISBN:")
    end
  end

end
