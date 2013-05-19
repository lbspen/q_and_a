require 'spec_helper'

feature "Editing qandas" do

  let!(:creator) { Factory(:confirmed_user) }
  let!(:qanda) do 
    qanda = Factory(:qanda, :question => "why", :answer => "because") 
    qanda.update_attribute(:creator, creator)
    qanda
  end

  before do
    user = Factory(:user, :email => "qanda@editor.com")
    user.confirm!

    visit "/"
    click_link "Edit"
    message = "You need to sign in or sign up before continuing."
    page.should have_content(message)

    fill_in "Email", :with => "qanda@editor.com"
    fill_in "Password", :with => "password"
    click_button "Sign in"
    within ("h1") { page.should have_content("Editing qanda") }
  end


  scenario "Updating a qanda" do
    visit "/"
    click_link "Show"
    click_link "Edit"
    fill_in "Question", :with => "value beta"
    click_button "Update"
    page.should have_content("Qanda was successfully updated.")
    within ("#editors") do
      page.should have_content('Edited by qanda@editor.com')
    end
  end
end
