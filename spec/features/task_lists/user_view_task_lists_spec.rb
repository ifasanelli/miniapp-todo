require 'rails_helper'

feature 'User view task lists' do
  scenario 'successfully' do
    user = create(:user, email: 'it@it.com')
    other_user = create(:user, email: 'x@x.com', name: 'Harvey Dent')
    create(:task_list, user: user)
    create(:task_list, name: 'Bebidas do happy hour', user: user)
    create(:task_list, name: 'Feedback dos colaboradores', user: user)
    create(:task_list, name: 'Mandar prender Oswald Cobblepot', user: other_user)
    login_as(user, scope: :user)

    visit task_lists_path

    expect(page).to have_content('Materiais para o escritório')
    expect(page).to have_content('Bebidas do happy hour')
    expect(page).to_not have_content('Mandar prender Oswald Cobblepot')
    expect(page).to have_content('Feedback dos colaboradores')
  end

  scenario 'without sign in' do
    user = create(:user, email: 'it@it.com')
    create(:task_list, user: user)

    visit task_lists_path

    expect(current_path).to eq new_user_session_path
  end
end
