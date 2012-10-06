require 'spec_helper'

describe User do

  before do
    @user = User.new(name: "Example User", email: "user@example.com",
                     password: "foobar", password_confirmation: "foobar")
  end

  subject { @user }

  it { should respond_to(:authenticate) }
  it { should respond_to(:microposts) }

  it { should respond_to(:feed) }
  it { should respond_to(:relationships) }
  it {should respond_to(:followed_users)}
  it { should respond_to(:reverse_relationships) }
  it { should respond_to(:followers) }

  describe "micropost associations" do

    before { @user.save }
    let!(:older_micropost) do
      FactoryGirl.create(:micropost, user: @user, created_at: 1.day.ago)
    end
    let!(:newer_micropost) do
      FactoryGirl.create(:micropost, user: @user, created_at: 1.hour.ago)
    end

    it "should have the right microposts in the right order" do
      @user.microposts.should == [newer_micropost, older_micropost]
    end
  end

end



#require 'spec_helper'
#
#describe User do
#
#  it { should respond_to(:password_confirmation) }
#  it { should respond_to(:remember_token) }
#  it { should respond_to(:admin) }
#  it { should respond_to(:authenticate) }
#
#  it { should be_valid }
#  it { should_not be_admin }
#
#  describe "with admin attribute set to 'true'" do
#    before do
#      @user.save!
#      @user.toggle!(:admin)
#    end
#
#    it { should be_admin }
#  end
#end