class PostPolicy < ApplicationPolicy
    
    
    def update?
        
    return true if post_approved? && admin?
    return true if user_or_admin? && !post_approved?
        
    #return true if record.approved? && admin_types.include?(user.type)
    #return true if (record.user_id == user.id || admin_types.include?(user.type)) && !record.approved?
        
    end
 
    
    private
    
    def user_or_admin?
        record.user_id == user.id || admin?
        
    end
    
    
    
    def admin?
        admin_types.include?(user.type)
    end
    
    def post_approved?
        record.approved?
        
    end
    
end