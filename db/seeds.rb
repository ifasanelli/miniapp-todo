user1 = User.create!(email: "italo@italo.com", password:'123456', name: "Italo Fasanelli")
user2 = User.create!(email: "mari@mari.com", password:'123456', name: "Mariana Santana")

list1 = TaskList.create!(user_id: user1.id, name: 'Tarefas de 20/06', status: 0)
list2 = TaskList.create!(user_id: user1.id, name: 'Tarefas de 22/06', status: 5)

list3 = TaskList.create!(user_id: user2.id, name: 'Livros para ler', status: 5)
list4 = TaskList.create!(user_id: user2.id, name: 'Email para gerência', status: 0)
list5 = TaskList.create!(user_id: user2.id, name: 'Email para clientes', status: 5)

task1 = Task.create!(description: 'Usuário pode fazer Sign-up e Sign-in', status: 5, task_list_id: list1.id)
task2 = Task.create!(description: 'Após logado, o usuário pode criar uma Lista de Tarefas', status: 0, task_list_id: list1.id)
task3 = Task.create!(description: 'No momento da criação de uma Lista já podemos criar várias Tarefas', status: 0, task_list_id: list2.id)
task4 = Task.create!(description: 'Cada lista pode ser "Pública" ou "Privada"', status: 0, task_list_id: list2.id)

task5 = Task.create!(description: 'The RSpec Book', status: 5, task_list_id: list3.id)
task6 = Task.create!(description: 'Design Patterns in Ruby', status: 0, task_list_id: list3.id)
task7 = Task.create!(description: 'steve.jobs@apple.com', status: 5, task_list_id: list4.id)
task8 = Task.create!(description: 'mark.zuckerberg@facebook.com', status: 0, task_list_id: list4.id)
task9 = Task.create!(description: 'axl.rose@gnr.com', status: 5, task_list_id: list5.id)
task10 = Task.create!(description: 'steven.tylerg@aerosmith.com', status: 0, task_list_id: list5.id)

favorite1 = Favorite.create!(user_id: user1.id, task_list_id: list3.id)
favorite2 = Favorite.create!(user_id: user2.id, task_list_id: list2.id)