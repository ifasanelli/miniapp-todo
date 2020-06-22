class TaskList < ApplicationRecord
  belongs_to :user
  has_many :tasks
  accepts_nested_attributes_for :tasks

  enum status: { personal: 0, shared: 5 }

  validates :name, presence: { message: 'Nome não pode ficar em branco' }
end
