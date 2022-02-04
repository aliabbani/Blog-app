require 'rails_helper'

RSpec.describe 'User Index features', type: :feature do
  before(:each) do
    visit user_session_path
    @alli1 = User.create!(name: 'alli1', bio: 'bio', photo: 'image1',
                          email: 'ally1@mail.com', password: 'asdzxc', posts_counter: 0, confirmed_at: Time.now)

    fill_in 'Email', with: 'ally1@mail.com'
    fill_in 'Password', with: 'asdzxc'
    click_button 'Log in'

    @post1 = @alli1.posts.create!(title: 'Cats and Dogs', text: 'Lorem ipsum dolor sit amet1.', comments_counter: 0,
                                  likes_counter: 0)
    @post2 = @alli1.posts.create!(title: 'Food', text: 'Lorem ipsum dolor sit amet2.', comments_counter: 0,
                                  likes_counter: 0)
    @post3 = @alli1.posts.create!(title: 'Cars', text: 'Lorem ipsum dolor sit amet3.', comments_counter: 0,
                                  likes_counter: 0)

    visit user_path(@alli1)
  end

  describe 'all test' do
    it 'I can see the user\'s profile picture.' do
      expect(page).to have_selector('img[alt="User\'s photo"]')
    end

    it 'I can see the user\'s username.' do
      expect(page).to have_content('alli1')
    end

    it 'I can see the number of posts the user has written.' do
      expect(page).to have_content '3'
    end

    it 'I can see the user\'s bio.' do
      expect(page).to have_content 'bio'
    end

    it 'I can see the user\'s first 3 posts.' do
      expect(page).to have_content 'Cats and Dogs'
      expect(page).to have_content 'Food'
      expect(page).to have_content 'Cars'
    end

    it 'I can see a button that lets me view all of a user\'s posts.' do
      expect(page).to have_content 'See all posts'
    end

    it 'When I click to see all posts, it redirects me to the user\'s post\'s index page.' do
      click_link('See all posts')
      expect(page).to have_current_path user_posts_path(@alli1)
    end
  end
end
