require 'spec_helper'

feature "Editing qandas" do

  let!(:user) { Factory(:confirmed_user) }
  let!(:qanda) do 
    qanda = Factory(:qanda, :question => "why", :answer => "because") 
    qanda.update_attribute(:creator, user)
    qanda
  end

  before do
    sign_in_as!(user)
  end

  scenario "Updating a qanda" do
    visit "/"
    click_link "Show"
    click_link "Edit"
    fill_in "Question", :with => "value beta"
    click_button "Update"
    page.should have_content("Qanda was successfully updated.")
  end
end
