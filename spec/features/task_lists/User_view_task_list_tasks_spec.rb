require 'rails_helper'

feature "User view task list's tasks" do
  scenario 'successfully' do
    user = create(:user, email: 'it@it.com')
    task_list = create(:task_list, name: 'Feedback dos colaboradores', user: user)
    create(:task, task_list: task_list, description: 'Elogiar Fulano')
    create(:task, task_list: task_list, description: 'Mostrar pontos a melhorar de Beltrano')
    login_as(user, scope: :user)

    visit task_list_path(task_list)

    expect(page).to have_content('Feedback dos colaboradores')
    expect(page).to have_content('Elogiar Fulano')
    expect(page).to have_content('Mostrar pontos a melhorar de Beltrano')
  end
end