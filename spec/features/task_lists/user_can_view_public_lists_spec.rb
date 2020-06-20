require 'rails_helper'

feature "User can view public lists" do
  scenario 'successfully' do
    user = create(:user, email: 'it@it.com')
    other_user = create(:user, email: 'x@x.com', name: 'Harvey Dent')
    create(:task_list, user: user)
    task_list = create(:task_list, name: 'Mandar prender Oswald Cobblepot', user: other_user, status: 5)
    login_as(user, scope: :user)

    visit task_list_path(task_list)

    expect(current_path).to eq task_list_path(task_list)
  end
end