require 'rails_helper'

feature "User favorites a public lists" do
  scenario 'successfully' do
    user = create(:user, email: 'it@it.com')
    other_user = create(:user, email: 'x@x.com', name: 'Harvey Dent')
    list = create(:task_list, name: 'Lista de compras', user: other_user, status: 5)
    other_list = create(:task_list, name: 'Lista de pedidos', user: other_user, status: 5)
    another_list = create(:task_list, name: 'Pautas da reunião', user: other_user, status: 5)
    login_as(user, scope: :user)

    visit discovery_path
    click_on 'Lista de compras'
    click_on 'Favoritar'

    expect(page).to have_content('Lista favoritada!')
  end
end