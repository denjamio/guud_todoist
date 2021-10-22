class Task < ApplicationRecord
  belongs_to :user

  has_many :task_tags
  has_many :tags, through: :task_tags, before_add: :validate_tags_number

  validates :title, presence: true
  validates :status, inclusion: { in: %w(done to_do),
                                message: "%{value} no es un estado válido" }

  private

  def validate_tags_number(tag)
    if tags.size > 3
      errors.add(:base, "No puedes añadir más de 3 etiquetas a la misma tarea")
      raise ActiveRecord::Rollback
    end
  end
end
