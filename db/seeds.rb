Post.delete_all

puts "all posts deleted"

User.delete_all

puts "all users deleted"

AuditLog.delete_all

puts "all auditlogs deleted"

@user = User.create(email: "dogs@dogs.com", 
password: "password", 
password_confirmation: "password", 
first_name: "Doogie", 
last_name: "Howser", 
phone: "1234567890")

puts "1 user created"

@adminuser = AdminUser.create(email: "admin@putzesrus.com", 
password: 'password', 
password_confirmation: 'password', 
first_name: 'AdminBill', 
last_name: 'AdminExcellent-adventure', 
phone: '1234567890')

puts "1 adminuser created"

100.times do |post|
    Post.create!(date: Date.today, rationale: "#{Post} rationale content", user_id: @user.id, overtime_request: 2.5)
end


puts "100 posts have been created"


100.times do |audit_log|
    AuditLog.create!(user_id: @user.id, status: 0, start_date: (Date.today - 6.days) )
end


puts "100 auditlogs have been created"
