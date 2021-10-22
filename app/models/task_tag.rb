class TaskTag < ApplicationRecord
  belongs_to :task
  belongs_to :tag

  validates :tag, uniqueness: { scope: :task,
                                 message: "Una tarea no puede tener más de una etiqueta con el mismo nombre" }
end
