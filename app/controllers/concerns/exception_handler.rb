module ExceptionHandler
  extend ActiveSupport::Concern
        
  included do
    # Define custom handlers
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  end
  
  private
        
  # JSON response with message; Status code 404 - Not found
  def record_not_found(e)
    json_response({ success: false, message: e.message }, :not_found)
  end     
end