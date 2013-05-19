require 'spec_helper'

feature 'Creating QandAs' do
  before do
    user = Factory(:user, :email => "qanda@example.com")
    Factory(:qanda, :question => "how come?", :answer => "because", 
      :creator => user)
    user.confirm!

    visit "/"
    click_link "New Qanda"
    message = "You need to sign in or sign up before continuing."
    page.should have_content(message)

    fill_in "Email", :with => "qanda@example.com"
    fill_in "Password", :with => "password"
    click_button "Sign in"
    within ("h1") { page.should have_content("New qanda") }
  end

  scenario "can create a qanda" do
    visit '/'
    click_link 'New Qanda'
    fill_in 'Question', :with => 'why'
    fill_in 'Answer', :with => 'because'
    click_button 'Create Qanda'
    page.should have_content('Qanda was successfully created.')
    within ("#author") do
      page.should have_content('Created by qanda@example.com')
    end
  end

  scenario "can not create a Qanda without a field1" do
    visit '/'
    click_link 'New Qanda'
    click_button 'Create Qanda'
    page.should have_content("Qanda has not been created.")
    page.should have_content("Question can't be blank")
    page.should have_content("Answer can't be blank")
  end

end