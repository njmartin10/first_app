require 'spec_helper'

describe "Landing page" do

  it "should have the content 'Sign up now'" do
    visit '/'
    page.should have_content('Sign up now to give the developer access to all your credit cards!')
  end
end
