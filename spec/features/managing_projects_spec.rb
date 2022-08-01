require 'rails_helper'

describe 'Creating a new project' do
    before :each do
        user = FactoryBot.create(:user)
        login_as user
        visit '/'
    end

    it 'cannot create a new project with no fields filled in' do
        click_on 'New Project'
        click_on 'Create Project'
        expect(page).to have_content 'Enter a project title'
        expect(page).to have_content 'Enter a project description'
        expect(page).to have_content 'Enter a founder'
    end

    it 'can create a new project when required fields are filled in' do
        click_on 'New Project'
        fill_in 'Name', with: 'Test Project'
        fill_in 'Description', with: 'This is a description of a test project'
        fill_in 'Founder', with: 'Joe Bloggs'
        click_on 'Create Project'
        expect(page).to have_content 'Project was successfully created.'

        visit '/'
        expect(page).to have_content 'Test Project'
    end

    it 'back button works from new project page (and does not create a new project)' do
        click_on 'New Project'
        fill_in 'Name', with: 'Test Project'
        click_link 'Back'
        expect(page).to have_content 'My Projects'
        expect(page).not_to have_content 'Test Project'
    end

end

