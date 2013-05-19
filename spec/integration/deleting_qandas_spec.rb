require 'spec_helper'

feature "Deleting qandas" do
  let!(:user) { Factory(:confirmed_user) }
  let!(:qanda) do 
    qanda = Factory(:qanda, :question => "why", :answer => "because") 
    qanda.update_attribute(:creator, user)
    qanda
  end

  before do
    sign_in_as!(user)
  end

  scenario "Deleting a qanda" do
    visit "/"
    click_link "Show"
    click_link "Destroy"
    page.should have_content("Qanda was successfully deleted.")
    visit "/"
    page.should_not have_content("what's up?")
  end
end
