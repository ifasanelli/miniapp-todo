class TaskList < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  accepts_nested_attributes_for :tasks, allow_destroy: true, reject_if: proc { |att| att['description'].blank? }

  enum status: { personal: 0, shareable: 5 }

  validates :name, presence: { message: 'Nome não pode ficar em branco' }
end
