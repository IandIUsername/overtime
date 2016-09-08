describe "navigate" do
    before do
        @user = FactoryGirl.create(:user)
           #user = User.create(email: "test@test.com", password: 'password', password_confirmation: 'password', first_name: "John", last_name: 
           #"Snow")
           login_as(@user, :scope => :user)
       end
       
   describe "index" do
       before do
           visit posts_path
       end
       
      it "can be reached sucessfully" do
            expect(page.status_code).to eq(200)
      end
      
      it "has a title of Posts" do
          visit posts_path
          expect(page).to have_content(/Posts/)
      end
      
      it "has a list of posts" do
         post1 = FactoryGirl.create(:post)
         post2 = FactoryGirl.create(:second_post)
          #post1 = Post.create(date: Date.today, rationale: "post1", user_id: @user.id)
          #post2 = Post.create(date: Date.today, rationale: "post2", user_id: @user.id)
          visit posts_path
          expect(page).to have_content(/rationale|content/)
      end
   end
   
   describe "creation" do
       before do
           user = User.create(email: "bird@test.com", password: 'password', password_confirmation: 'password', first_name: "Max", last_name: 
           "Sloober")
           login_as(user, :scope => :user)
           visit new_post_path
       end
       
      it "has a new form that can be reached" do
          expect(page.status_code).to eq(200)
      end
      
      it "can be created from new form page" do
          fill_in 'post[date]', with: Date.today
          fill_in 'post[rationale]', with: "Some rationale"
          click_on "Save"
          expect(page).to have_content("Some rationale")
      end
      
      it "will have a user associated with it" do
          
          fill_in 'post[date]', with: Date.today
          fill_in 'post[rationale]', with: "User Association"
          click_on "Save"
          expect(User.last.posts.last.rationale).to eq("User Association")
          #expect(user.posts.all.first.rationale).to eq("User Association")
      end
      
   end
   
   describe "edit" do
       
       before do
           @post = FactoryGirl.create(:post)
       end
       
       it "can be reached by clicking edit on the index page" do
           #post = FactoryGirl.create(:post)
           visit posts_path
           click_link("Edit_#{@post.id}")
           expect(page.status_code).to eq(200)
       end
       
       it "can be edited" do
          visit edit_post_path(@post)
          fill_in 'post[date]', with: Date.today
          fill_in 'post[rationale]', with: "Edited content"
          click_on "Save"
          expect(page).to have_content("Edited content")
       end
       
       
   end
end