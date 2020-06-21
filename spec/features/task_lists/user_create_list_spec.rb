require 'rails_helper'

feature "User create list" do
  scenario 'successfully' do
    user = create(:user, email: 'it@it.com')
    login_as(user, scope: :user)

    visit root_path
    click_on 'Nova Lista'
    fill_in 'Nome:', with: 'Compras - Kalunga'
    click_on 'Salvar'

    expect(page).to have_content('Compras - Kalunga')
  end
end