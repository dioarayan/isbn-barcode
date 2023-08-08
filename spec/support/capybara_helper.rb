require "byebug"

module CapyBaraHelper
  def click_calculate
    visit root_path

    click_on "Calculate"

    expect(page).to have_content("Result")
  end
end

RSpec.configure do |config|
  config.include CapybaraHelper, type: :feature
end
