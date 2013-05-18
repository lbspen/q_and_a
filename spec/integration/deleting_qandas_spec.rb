require 'spec_helper'

feature "Deleting qandas" do
  scenario "Deleting a qanda" do
    Factory(:qanda, :question => "what's up?")
    visit "/"
    click_link "Show"
    click_link "Destroy"
    page.should have_content("Qanda was successfully deleted.")
    visit "/"
    page.should_not have_content("what's up?")
  end
end
