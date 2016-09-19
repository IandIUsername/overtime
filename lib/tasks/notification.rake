namespace :notification do
  desc "Sends sms notification to employees asking them to log whether they has overtime"
  task sms: :environment do
    
    
    #schedule to run on each sunday at 5pm
    #iterate over all employees
    #skip AdminUsers
    #send a message that has instructions and a link to log time
    #no spaces or dash
    #has to be 10 character
    #every character must be a number
    # number with no spaces or dashes that is exactly 10 characters and all characters have to be a number
    
    #User.all.each do |user|
     # Sms_tool.send_sms()
      
    #end
    
    #puts "I am in a rake task"
  #end

end
