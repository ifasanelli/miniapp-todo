FactoryBot.define do
  factory :task_list do
    user
    name { 'Materiais para o escritório' }
    status { 0 }
  end
end