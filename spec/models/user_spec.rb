
RSpec.describe User, type: :model do
  describe 'Validations for users' do

  it "saves with all fields filled in" do
  @user = User.new(
      first_name: "Peter" ,
      last_name: "Jackson",
      email: "peterjackson@gmail.com",
      password: "peter123",
      password_confirmation: "peter123" 
  )
  @user.save

      expect(@user).to be_valid
      expect(@user.errors.full_messages).to be_empty
  end

  it "is invalid without a first name" do

    @user = User.new(
      first_name: nil ,
      last_name: "Jackson",
      email: "peterjackson@gmail.com",
      password: "peter123",
      password_confirmation: "peter123" 
  )
  @user.save

    expect(@user).to_not be_valid
    expect(@user.errors.full_messages).to include "First name can't be blank"
    expect(@user.errors.full_messages.length).to be(1)
  end

  it "is invalid without a last name" do

    @user = User.new(
      first_name: "Peter" ,
      last_name: nil,
      email: "peterjackson@gmail.com",
      password: "peter123",
      password_confirmation: "peter123" 
  )
  @user.save

    expect(@user).to_not be_valid
    expect(@user.errors.full_messages).to include "Last name can't be blank"
    expect(@user.errors.full_messages.length).to be(1)
  end

  it "is not valid without an email" do
   
    @user = User.new(
      first_name: "Peter" ,
      last_name: "Jackson",
      email: nil,
      password: "peter123",
      password_confirmation: "peter123" 
  )
  @user.save

    expect(@user).to_not be_valid
    expect(@user.errors.full_messages).to include "Email can't be blank"
    expect(@user.errors.full_messages.length).to be(1)
  end

  it "is not valid without pasword" do
    @user = User.new(
      first_name: "Peter" ,
      last_name: "Jackson",
      email: "peterjackson@gmail.com",
      password: nil,
      password_confirmation: nil 
  )
  @user.save

    expect(@user).to_not be_valid
    expect(@user.errors.full_messages).to include "Password can't be blank"
  end

  it "is not valid when password and password_confirmation don't match" do
    @user = User.new(
      first_name: "Peter" ,
      last_name: "Jackson",
      email: "peterjackson@gmail.com",
      password: "petter123",
      password_confirmation: "petter1234" 
  )
  @user.save
    expect(@user).to_not be_valid
    expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
  end

  it "is not valid when email isn't unique" do

    @user1 = User.new(
      first_name: "Peter" ,
      last_name: "Jackson",
      email: "peterjackson@gmail.com",
      password: "petter123",
      password_confirmation: "petter123" 
  )
  @user1.save

  @user2 = User.new(
    first_name: "Peter" ,
    last_name: "Jackson",
    email: "peterjaCKson@GMAIL.com",
    password: "petter123",
    password_confirmation: "petter123" 
)
@user2.save

    expect(@user2).to_not be_valid
    expect(@user2.errors.full_messages).to include "Email has already been taken"
  end

  it "is not valid when password is shorter than 5 characters" do
    @user = User.new(
      first_name: "Peter" ,
      last_name: "Jackson",
      email: "peterjackson@gmail.com",
      password: "123",
      password_confirmation: "123" 
  )
  @user.save
  p @user.errors.full_messages
    expect(@user).to_not be_valid
    expect(@user.errors.full_messages).to include "Password is too short (minimum is 5 characters)"
  
  end
  end

  describe '.authenticate_with_credentials' do
    
    
  end
end
