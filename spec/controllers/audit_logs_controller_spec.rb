require 'rails_helper'

RSpec.describe AuditLogsController, type: :controller do
    
    
    def index
        @audit_logs = AuditLog.all
    end
    
end
