FactoryGirl.define do
    
    
    factory :post do
       date Date.today
       rationale "some rationale"
      
       user
    end
    
    
    
    factory :second_post, class: "Post" do
        date Date.yesterday
        rationale "more content"
      
        user
    end
    
    
    factory :post_from_other_user, class: "Post" do
        date Date.today
        rationale "other user post content"
        
        non_authorized_user
    end
    

    
end