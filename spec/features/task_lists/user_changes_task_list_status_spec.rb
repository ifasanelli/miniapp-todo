require 'rails_helper'

feature "User changes task list status" do
  scenario 'change status from private to public' do
    user = create(:user, email: 'it@it.com')
    task_list = create(:task_list, name: 'Feedback dos colaboradores', user: user)
    login_as(user, scope: :user)

    visit task_list_path(task_list)
    click_on 'tornar pública'

    expect(page).to have_content('tornar privada')
    expect(page).to_not have_content('tornar pública')
  end

  scenario 'change status from public to private' do
    user = create(:user, email: 'it@it.com')
    task_list = create(:task_list, name: 'Feedback dos colaboradores', user: user, status: 5)
    login_as(user, scope: :user)

    visit task_list_path(task_list)
    click_on 'tornar privada'

    expect(page).to have_content('tornar pública')
    expect(page).to_not have_content('tornar privada')
  end
end
