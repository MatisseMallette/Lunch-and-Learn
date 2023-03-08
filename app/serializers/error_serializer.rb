class ErrorSerializer
  def self.serialize(error)
    {
      "message": 'There was an error processing your request',
      "errors": error.full_messages,
      "status": find_status[error.class].to_s
    }
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
