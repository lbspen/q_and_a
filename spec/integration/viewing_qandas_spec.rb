require 'spec_helper'

feature "Viewing qandas" do
  let!(:user) { Factory(:user) }
  let!(:qanda) do 
    qanda = Factory(:qanda, :question => "why", :answer => "because") 
    qanda.update_attribute(:creator, user)
    qanda
  end

  scenario "Listing all qandas" do
    visit '/'
    click_link 'Show'
    page.current_url.should == qanda_url(qanda)
  end
end
