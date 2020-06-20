class TaskList < ApplicationRecord
  belongs_to :user
  has_many :tasks

  enum status: { personal: 0, shared: 5 }

  validates :name, presence: { message: 'Nome não pode ficar em branco' }
end
