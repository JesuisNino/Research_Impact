require 'rails_helper'

describe 'Authenticating users' do
    # let(:user) { FactoryBot.create(:user)}

    specify 'User can log in when providing correct username and password' do
        user = FactoryBot.create(:user)
        login_as user
        visit '/'
        expect(page).to have_content 'My Projects'
    end

    specify 'Log in is unsuccessful when wrong username is supplied' do
        visit '/'
        fill_in 'Username', with: 'wrongusername'
        fill_in 'Password', with: 'testpassword'
        click_on 'Log in'
        expect(page).to have_content 'Invalid Username or password.'
    end

    specify 'Log in is unsuccessful when wrong password (but a valid username) is supplied' do
        visit '/'
        fill_in 'Username', with: 'testuser'
        fill_in 'Password', with: 'wrongpassword'
        click_on 'Log in'
        expect(page).to have_content 'Invalid Username or password.'
    end

end