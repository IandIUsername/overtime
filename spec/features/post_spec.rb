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
         post1.update(user_id: @user.id)
         post2.update(user_id: @user.id)
          #post1 = Post.create(date: Date.today, rationale: "post1", user_id: @user.id)
          #post2 = Post.create(date: Date.today, rationale: "post2", user_id: @user.id)
          visit posts_path
          expect(page).to have_content(/rationale|content/)
      end
      
      it "has a scope such that only post creators can see their posts" do
          
          
         post1 = Post.create(date: Date.today, rationale: "dogs", user_id: @user.id )
         post1 = Post.create(date: Date.today, rationale: "dogs", user_id: @user.id )
         
         other_user = User.create(first_name: 'other', last_name: 'user', email: 'other_user@other_user.com', password: 'password', 'password_confirmation': 'password')
         
         post_from_other_user = Post.create(date: Date.today, rationale: "can't see post", user_id: other_user.id)
         
         visit posts_path
         puts  "Posts:", Post.count
         expect(page).not_to have_content("can't see post")
       
      end
      
      describe "new" do
          it "has a link from the home page" do
          visit root_path
          click_link("new_post_from_nav")
          expect(page.status_code).to eq(200)
      end
      end
      
      describe "delete" do
          it "can be deleted" do
              @post = FactoryGirl.create(:post)
              @post.update(user_id: @user.id)

              visit posts_path
              click_link("delete_post_#{@post.id}_from_index")
              expect(page.status_code).to eq(200)
              
          end
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
           @edit_user = User.create(first_name: "Bob", last_name: "Bobman", email: "bob@bobman.com", password: "password", password_confirmation: "password", )
           
           login_as(@edit_user, :scope => :user)
           @edit_post = Post.create(date: Date.today, rationale: "stuff", user_id: @edit_user.id)
           #@post = FactoryGirl.create(:post)
       end
       
     
       
       it "can be edited" do
          visit edit_post_path(@edit_post)
          
          fill_in 'post[date]', with: Date.today
          fill_in 'post[rationale]', with: "Edited content"
          click_on "Save"
          expect(page).to have_content("Edited content")
       end
       
       it "cannot be edited by a non-authorized user" do
           logout(:user)
           non_authorized_user = FactoryGirl.create(:non_authorized_user)
           login_as(non_authorized_user, :scope => :user)
           
           visit edit_post_path(@edit_post)
           expect(current_path).to eq(root_path)
       end
   end
end