require 'rails_helper'

describe 'Creating a new field' do
    before :each do
        user = FactoryBot.create(:user)
        login_as user
        visit '/'
    end

    it 'cannot create a new field with no fields filled in' do
        click_on 'New Project'
        fill_in 'Name', with: 'Test Project'
        fill_in 'Description', with: 'This is a description of a test project'
        fill_in 'Founder', with: 'Joe Bloggs'
        click_on 'Create Project'

        expect(page).to have_content 'Project was successfully created.'

        visit '/'

        click_link "View Project"
        click_link "Add Progress"

        click_button "Publish Progress"

        expect(page).to have_content "Enter title of this piece of progress"
        expect(page).to have_content "Enter the type of progress"
        expect(page).to have_content "Enter the type of impact"
    end

    it 'can create a new field when required fields are filled in' do
        click_on 'New Project'
        fill_in 'Name', with: 'Test Project'
        fill_in 'Description', with: 'This is a description of a test project'
        fill_in 'Founder', with: 'Joe Bloggs'
        click_on 'Create Project'

        expect(page).to have_content 'Project was successfully created.'

        visit '/'

        click_link "View Project"
        click_link "Add Progress"

        click_button "Publish Progress"

        fill_in "Title", with: "test-title"
        fill_in "Progress Type", with: "test-field-type"
        fill_in "Impact Type", with: "test-impact-type"
        click_button "Publish Progress"

        expect(page).to have_content "Field was created"

 
    end
end

