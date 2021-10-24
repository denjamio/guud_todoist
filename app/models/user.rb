class User < ApplicationRecord
  has_many :tasks, dependent: :destroy
  has_many :tags, dependent: :destroy

  validates :email, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
