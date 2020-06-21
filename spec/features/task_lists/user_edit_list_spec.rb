require 'rails_helper'

feature "User edit a list" do
  scenario 'successfully' do
    user = create(:user, email: 'it@it.com')
    task_list = create(:task_list, name: 'Feedback dos colaboradores', user: user)
    login_as(user, scope: :user)

    visit edit_task_list_path(task_list)
    fill_in 'Nome:', with: 'Feedback dos colaboradores internos'
    click_on 'Salvar'

    expect(page).to have_content('Feedback dos colaboradores internos')
  end
end