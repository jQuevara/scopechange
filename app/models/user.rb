class User < ApplicationRecord
  attribute :role, :integer, default: 2 # 1 is admin, 2 is user and should never actually be useds
  validates :email, presence: true, uniqueness: true
  has_secure_password

  def self.find_by_id(id)

  end
end