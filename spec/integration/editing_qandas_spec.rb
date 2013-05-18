require 'spec_helper'

feature "Editing qandas" do
  scenario "Updating a qanda" do
    Factory(:qanda, :question => "value")
    visit "/"
    click_link "Show"
    click_link "Edit"
    fill_in "Question", :with => "value beta"
    click_button "Update"
    page.should have_content("Qanda was successfully updated.")
  end
end
