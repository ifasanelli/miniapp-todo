class Task < ApplicationRecord
  belongs_to :task_list

  enum status: { open: 0, closed: 5 }

  validates :description, presence: { message: 'Descrição não pode ficar em branco' }
end
