describe "navigate" do
   describe "index" do
      it "can be reached sucessfully" do
          visit posts_path
            expect(page.status_code).to eq(200)
      end
      it "has a title of Posts" do
          visit posts_path
          expect(page).to have_content(/Posts/)
      end
   end
end