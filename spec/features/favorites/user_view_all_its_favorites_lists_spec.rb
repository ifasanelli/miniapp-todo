require 'rails_helper'

feature "User view all its favorites lists" do
  scenario 'successfully' do
    user = create(:user, email: 'it@it.com')
    other_user = create(:user, email: 'x@x.com', name: 'Harvey Dent')
    list = create(:task_list, name: 'Lista de compras', user: other_user, status: 5)
    other_list = create(:task_list, name: 'Lista de pedidos', user: other_user, status: 5)
    another_list = create(:task_list, name: 'Pautas da reunião', user: other_user, status: 5)
    create(:favorite, user: user, task_list: list)
    create(:favorite, user: user, task_list: other_list)
    create(:favorite, user: user, task_list: another_list)
    login_as(user, scope: :user)

    visit favorites_path

    expect(page).to have_content('Lista de compras')
    expect(page).to have_content('Lista de pedidos')
    expect(page).to have_content('Pautas da reunião')
  end
end