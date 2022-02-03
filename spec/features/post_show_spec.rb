require 'rails_helper'

RSpec.feature 'post show page', js: true, type: :feature do
  background do
    visit user_session_path

    bio = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.
    Fusce risus mi, luctus id ligula nec, malesuada rhoncus tortor.
    Ut egestas mollis erat. Aliquam imperdiet nisi ac porttitor imperdiet.
    Etiam lacus lorem, euismod eu porttitor porttitor, accumsan eget risus.
    Etiam at diam id nunc aliquet interdum ut in sapien. Sed ultrices
    eleifend massa, eget mattis magna sollicitudin fringilla.
    Mauris ac venenatis nisi, ac semper eros. Vivamus in facilisis ipsum.'

    text = 'Lorem ipsum dolor sit amet,
    consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
    Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.'

    @willy = User.create!(name: 'willy', photo: 'image1', bio: bio, posts_counter: 0, email: 'willy@mail.com',
                          password: 'asdzxc', confirmed_at: Time.now)

    fill_in 'Email', with: 'willy@mail.com'
    fill_in 'Password', with: 'asdzxc'
    click_button 'Log in'

    post = @willy.posts.create!(title: 'Cats and Dogs',
                                text: text,
                                comments_counter: 0, likes_counter: 0)

    lara = User.create!(name: 'Lara', photo: 'image4', bio: bio, posts_counter: 0, email: 'lara@mail.com',
                        password: 'asdzxc', confirmed_at: Time.now)
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
    expect(page).to have_content text
  end

  it 'can see the username of each commentor.' do
    expect(page).to have_content 'Lara'
  end

  it 'can see the comment each commentor left.' do
    expect(page).to have_content 'Wow'
    expect(page).to have_content 'Big like'
  end
end
