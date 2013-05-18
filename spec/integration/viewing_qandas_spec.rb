require 'spec_helper'

feature "Viewing qandas" do
  scenario "Listing all qandas" do
    qanda = Factory.create(:qanda, :question => "why", :answer => "because")
    visit '/'
    click_link 'Show'
    page.current_url.should == qanda_url(qanda)
  end
end
