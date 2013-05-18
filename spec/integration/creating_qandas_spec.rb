require 'spec_helper'

feature 'Creating QandAs' do
  scenario "can create a qanda" do
    visit '/'
    click_link 'New Qanda'
    fill_in 'Question', :with => 'why'
    fill_in 'Answer', :with => 'because'
    click_button 'Create Qanda'
    page.should have_content('Qanda was successfully created.')
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