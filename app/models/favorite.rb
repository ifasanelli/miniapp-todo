class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :task_list
end
