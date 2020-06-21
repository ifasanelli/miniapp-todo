require 'rails_helper'

feature "User changes task status" do
  scenario 'change status from open to closed' do
    user = create(:user, email: 'it@it.com')
    task_list = create(:task_list, name: 'Feedback dos colaboradores', user: user)
    task = create(:task, task_list: task_list, description: 'Elogiar Fulano')
    create(:task, task_list: task_list, description: 'Mostrar pontos a melhorar de Beltrano', status: 5)
    login_as(user, scope: :user)

    visit task_list_path(task_list)
    find("#set-done-#{task.id}").click

    expect(page).to have_content("'#{task.description}' marcada como feita")
  end

  scenario 'change status from closed to open' do
    user = create(:user, email: 'it@it.com')
    task_list = create(:task_list, name: 'Feedback dos colaboradores', user: user)
    task = create(:task, task_list: task_list, description: 'Elogiar Fulano', status: 5)
    create(:task, task_list: task_list, description: 'Mostrar pontos a melhorar de Beltrano')
    login_as(user, scope: :user)

    visit task_list_path(task_list)
    find("#set-undone-#{task.id}").click

    expect(page).to have_content("'#{task.description}' desmarcada como feita")
  end
end
