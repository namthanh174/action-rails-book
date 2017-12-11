require 'spec_helper'

describe User do
#   pending "add some examples to (or delete) #{__FILE__}"
    describe "password" do
       it "needs a password and conformation to save" do
          u = User.new(name: 'steve', email: "steve@example.com")
          
          u.save
          expect(u).to_not be_valid
          
          u.password = "password"
          u.password_confirmation = ""
          u.save
          expect(u).to_not be_valid
          
          u.password_confirmation = "password"
          u.save
          expect(u).to be_valid
       end
       
       it "Need password and confirmation to match" do
          u = User.create(
              name: "steve",
              password: "hunter2",
              password_confirmation: "hunter")
            expect(u).to_not be_valid
       end
       
       
       it "requires an email" do
          u = User.new(name: "steve", password: "hunter2", password_confirmation: "hunter2")
          
          u.save
          expect(u).to_not be_valid
          
          u.email = "steve@example.com"
          u.save
          expect(u).to be_valid
       end
    end
    
    describe "authentication" do
       let(:user) {User.create(
            name: "steve",
            password: 'hunter2',
            password_confirmation: "hunter2"
        )} 
        
        it "authentication with a correct password" do
           expect(user.authenticate("hunter2")).to be 
        end
        
        it "does not authenticationwith an incorrect password" do
           expect(user.authenticate("hunter1")).to_not be 
        end
    
    end
    
end
