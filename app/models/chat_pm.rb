class ChatPm < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order(created_at: :desc)}
  validates :user_id, presence: true
  validates :message, presence: true
end
