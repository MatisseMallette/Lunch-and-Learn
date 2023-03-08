class ErrorSerializer
  def self.serialize(error)
    {
      "message": 'There was an error processing your request',
      "errors": find_message(error),
      "status": find_status[error.class].to_s
    }
  end

  def self.find_message(error)
    if error.instance_of?(ActiveModel::Errors) 
      error.full_messages
    else
      [error.message]
    end
  end

  def self.find_status
    {
      ActiveRecord::RecordNotFound => 404,
      ActiveModel::Errors => 422,
      ActiveRecord::StatementInvalid => 404,
      String => 400
    }
  end
end
