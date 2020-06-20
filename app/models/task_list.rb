class TaskList < ApplicationRecord
  belongs_to :user
  has_many :tasks

  enum status: { private: 0, public: 5 }

  validates :name, presence: { message: 'Nome não pode ficar em branco' }
end
