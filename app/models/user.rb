class User < ApplicationRecord
  has_many :tasks, dependent: :destroy
  has_many :tags, dependent: :destroy

  validates :email, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  after_create :generate_api_key

  def generate_api_key
    self.api_key = SecureRandom.hex
    self.save
  end
end
