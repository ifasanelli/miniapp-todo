require 'rails_helper'

feature "User can view public lists" do
  scenario 'successfully' do
    user = create(:user, email: 'it@it.com')
    other_user = create(:user, email: 'x@x.com', name: 'Harvey Dent')
    create(:task_list, name: 'Lista de compras', user: other_user, status: 5)
    create(:task_list, name: 'Lista de pedidos', user: other_user, status: 5)
    create(:task_list, name: 'Pautas da reunião', user: other_user, status: 0)
    login_as(user, scope: :user)

    visit discovery_path

    expect(page).to have_content('Lista de compras')
    expect(page).to have_content('Lista de pedidos')
    expect(page).to_not have_content('Pautas da reunião')
  end
end