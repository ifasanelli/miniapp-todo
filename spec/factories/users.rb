FactoryBot.define do
  factory :user do
    email { 'teste@teste.com' }
    password { '123456' }
    name { 'Ítalo' }
  end
end