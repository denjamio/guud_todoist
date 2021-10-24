class Task < ApplicationRecord
  belongs_to :user

  has_many :task_tags, dependent: :destroy
  has_many :tags, through: :task_tags, before_add: :validate_tags_number

  validates :title, :priority, :status, presence: true
  validates :status, inclusion: { in: %w(done to_do),
                                message: "%{value} no es un estado válido" }

  private

  def validate_tags_number(tag)
    if tag_ids.count > 3
      errors.add(:tags, "No puedes tener más de 3 etiquetas asociadas a la misma tarea")
      raise ActiveRecord::Rollback
    end
  end
end
