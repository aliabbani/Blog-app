require 'rails_helper'

RSpec.feature 'post show page', js: true, type: :feature do
  background do
    visit user_session_path

    @willy = User.create!(name: 'willy', photo: 'image1' , bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', posts_counter: 0, email: 'willy@mail.com', password: 'asdzxc', confirmed_at: Time.now)
    
    fill_in 'Email', with: 'willy@mail.com'
    fill_in 'Password', with: 'asdzxc'
    click_button 'Log in'

    post = @willy.posts.create!(title: 'Cats and Dogs', text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', comments_counter: 0, likes_counter: 0)

    lara = User.create!(name: 'Lara', photo: 'image4', bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', posts_counter: 0,email: 'lara@mail.com', password: 'asdzxc', confirmed_at: Time.now)
    lara.comments.create!(text: 'Wow', post: post)
    lara.comments.create!(text: 'Big like', post: post)
    visit user_post_path(@willy, post)
  end

  it "see the post's title" do
    expect(page).to have_content 'Cats and Dogs'
  end

  it 'can see who wrote the post.' do
    expect(page).to have_content 'willy'
  end

  it 'can see how many comments it has.' do
    expect(page).to have_content 'Comments: 2'
  end

  it 'can see how many likes it has.' do
    expect(page).to have_content 'Likes: 0'
  end

  it 'can see the post body.' do
    expect(page).to have_content 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.'
  end

  it 'can see the username of each commentor.' do
    expect(page).to have_content 'Lara'
  end

  it 'can see the comment each commentor left.' do
    expect(page).to have_content 'Wow'
    expect(page).to have_content 'Big like'
  end
end