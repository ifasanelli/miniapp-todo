FactoryBot.define do
  factory :task do
    task_list
    description { 'Tesoura' }
    status { 0 }
  end
end