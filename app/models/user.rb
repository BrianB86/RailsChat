class User < ActiveRecord::Base
  before_save {self.name = name.downcase}
  validates :name, presence: true, length: {maximum: 20}, uniqueness: {case_sensitive: false}
  has_secure_password
  PASSWORD_REGEX = /.*[0-9].*[\S]\z/i
  validates :password, presence: true, length: {minimum: 7}, format: { with: PASSWORD_REGEX}
end
