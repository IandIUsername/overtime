Post.delete_all

puts "all posts deleted"
User.delete_all
puts "all users deleted"

@user = User.create(email: "dogs@dogs.com", password: "password", password_confirmation: "password", first_name: "Doogie", last_name: "Howser")

puts "1 user created
"
100.times do |post|
    Post.create!(date: Date.today, rationale: "#{Post} rationale content", user_id: @user.id)
end

puts "100 posts have been created"