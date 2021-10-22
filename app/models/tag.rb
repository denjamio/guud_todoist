class Tag < ApplicationRecord
  belongs_to :user

  has_many :task_tags
  has_many :tasks, through: :task_tags

  validates :name, presence: true
  validates :name, uniqueness: { scope: :user,
                                 message: "Ya tienes una etiqueta con ese nombre" }
end
