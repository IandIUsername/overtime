require 'rails_helper'

RSpec.describe User, type: :model do
  
  before do
        @user = FactoryGirl.create(:user)
        #@user = User.create(email: "test@test.com", password: "password", password_confirmation: "password", first_name: "first", last_name: "last")
     end
  
  describe "creation" do
    
   
          
      it "can be created" do
          expect(@user).to be_valid
      end
      
      it "cannot be created without first_name" do
          @user.first_name = nil
          expect(@user).to_not be_valid
      end
      
      
      it "cannot be created without last_name" do
          @user.last_name = nil
          expect(@user).to_not be_valid
      end
      
      it "cannot be created without phone number" do
          @user.phone = nil
          expect(@user).to_not be_valid
      end
      
      it "requires the phone attr to only contain integers" do
         @user.phone = 'mygreatstr'
          expect(@user).to_not be_valid
       end
    
    it "requires the phone attr to only have 10 container" do
        @user.phone = '123456789101'
        expect(@user).to_not be_valid
    
     end
     
  

  end    
 
       describe "custom name methods " do
         it "has a full name method that combines first and last name" do
           expect(@user.full_name).to eq("SNOW, JON")
           
         end
       
   end
 
 end
