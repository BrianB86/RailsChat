class User < ActiveRecord::Base
  before_save {self.name = name.downcase}
  validates :name, presence: true, length: {maximum: 20}, uniqueness: {case_sensitive: false}
  has_secure_password
  PASSWORD_REGEX = /.*[0-9].*[\S]\z/i
  validates :password, presence: true, length: {minimum: 7}, format: { with: PASSWORD_REGEX,
    message: "The password must contain at least one number."}, allow_nil: true


  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost

    BCrypt::Password.create(string, cost: cost)
  end

end
