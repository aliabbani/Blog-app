require 'rails_helper'

RSpec.describe 'Login features', js: true do
  it 'Test username & password inputs and the "Submit" button.' do
    visit('/users/sign_in')
    expect(page).to have_field('Email', type: 'email')
    expect(page).to have_field('Password', type: 'password')
    expect(page).to have_button('Log in', type: 'submit')
  end

  it 'Get error when I click the submit button without filling in the username and the password' do
    visit('/users/sign_in')
    fill_in('Email', with: '')
    fill_in('Password', with: '')
    click_button('Log in')
    expect(page).to have_content('Invalid Email or password.')
  end

  it 'Get error when I click the submit button after filling in the username and the password with incorrect data' do
    visit('/users/sign_in')
    fill_in('Email', with: 'melodie@mail.com')
    fill_in('Password', with: 'qwertyasdf')
    click_button('Log in')
    expect(page).to have_content('Invalid Email or password.')
  end

  it 'Should redirected to the root page when clicking submit button with correct data' do
    visit('/users/sign_in')
    fill_in('Email', with: 'mel@mail.com')
    fill_in('Password', with: 'r89eudhbgvb')
    click_button('Log in')
    expect(current_path).to have_content('/users')
  end
end
