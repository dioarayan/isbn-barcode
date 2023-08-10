require "byebug"

module CapybaraHelper
  def click_calculate
    visit root_path

    within ".calculate" do
      fill_in "isbn_input", with: '978014300723'
      click_button "Calculate"
    end

    expect(page).to have_content("Result")
      .and have_content(4)
      .and have_content('9780143007234')
  end
end

RSpec.configure do |config|
  config.include CapybaraHelper, type: :feature
end
