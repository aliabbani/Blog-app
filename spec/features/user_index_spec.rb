require 'rails_helper'

RSpec.describe 'User Index features', js: true do
    before(:each) do
        @amine = User.create(name: 'Amine', photo: 'image1', email: 'amine@mail.com', password: 'asdzxc', posts_counter: 0)
        @ali = User.create(name: 'Ali', photo: 'image2', email: 'ali@mail.com', password: 'asdzxc', posts_counter: 0)
        @henry = User.create(name: 'Henry', photo: 'image3', email: 'henry@mail.com', password: 'asdzxc', posts_counter: 0)
        @lara = User.create(name: 'Lara', photo: 'image4', email: 'lara@mail.com', password: 'asdzxc', posts_counter: 0)

        visit user_session_path
        fill_in 'Email', with: 'amine@mail.com'
        fill_in 'Password', with: 'asdzxc'
        click_button 'Log in'
        visit users_path
    end

    it 'I can see the username of all other users.' do
        expect(page).to have_content('Amine')
        expect(page).to have_content('Ali')
        expect(page).to have_content('Henry')
        expect(page).to have_content('Lara')
    end

    it 'I can see the profile picture for each user.' do
        expect(page).to have_selector('img[alt="User\'s photo"]')
    end

    it 'I can see the number of posts each user has written.' do
      expect(page).to have_content "0"
    end

    it 'When I click on a user, I am redirected to that user\'s show page.' do
      click_link('Amine')
      expect(page).to have_current_path user_path('1')
    end
end