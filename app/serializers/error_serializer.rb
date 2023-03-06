class ErrorSerializer
  def self.serialize(error)
    {
      message: error.full_messages,
      status: find_status[error.class].to_s
    }
  end

  private

  def self.find_status
    {
      ActiveRecord::RecordNotFound => 404,
      ActiveModel::Errors => 422,
      ActiveRecord::StatementInvalid => 404,
      String => 400
    }
  end
end