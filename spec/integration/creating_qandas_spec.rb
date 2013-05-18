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
end