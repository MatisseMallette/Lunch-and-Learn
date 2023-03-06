class User < ApplicationRecord
  validates_presence_of :email, :name, :api_key
  validates :email, uniqueness: true
  before_validation :generate_api_key
  
  def generate_api_key
    self.api_key = SecureRandom.hex
  end
end
