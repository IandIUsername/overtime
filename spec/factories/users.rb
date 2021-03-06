FactoryGirl.define do
    sequence :email do |n|
        "test#{n}@example.com"
    end
    
    
    factory :user do
        first_name "Jon"
        last_name "Snow"
        email { generate :email }
        phone "1234567890"
        password "password"
        password_confirmation "password"
       
    end
    
 
    
    factory :admin_user, class: "AdminUser" do
        first_name "Admin"
        last_name "User"
        email  { generate :email }
        phone "1234567890"
        password "password"
        password_confirmation "password"
        
    end
    
    factory :non_authorized_user, class: "User" do
        first_name 'Non'
        last_name  'Authorized'
        email { generate :email }
        phone "1234567890"
        password 'password'
        password_confirmation 'password'
    end
    
end