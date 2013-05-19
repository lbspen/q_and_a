require 'spec_helper'

describe QandasController do
  it "displays an error for a missing qanda" do
    get :show, :id => "not-here"
    response.should redirect_to(qandas_path)
    message = "The qanda you were looking for could not be found."
    flash[:alert].should == message
  end
end