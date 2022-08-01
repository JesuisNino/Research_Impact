require 'rails_helper'

describe ProjectsController do
  describe 'Get #index' do
    before do
      @user = create(:user)
    end
    it 'unauthen' do
      get :index
      expect(response).to redirect_to '/users/sign_in'
    end

    it "authen" do
      sign_in @user
      get :index
      expect(response).to have_http_status "200"
    end
  end

  context "as an authenticated manage project " do
    before do
      @user = create(:user)
      sign_in @user
    end


    describe 'Get #new' do
      it "assigns a new project" do
        get :new
        expect(assigns(:project)).to be_a_new(Project)
      end
      
      it "renders the :new template" do
        get :new
        expect(response).to render_template :new
      end
    end

    describe 'Get #show' do
        it "assigns the requsted project to @projecttable" do
          project = create(:project)
          get :show, params: { id: project.id }
          expect(assigns(:project)).to eq project
        end
        it "renders the :show template" do
          project = create(:project)
          get :show, params: { id: project.id }
          expect(response).to render_template :show
        end
    end
    
    describe 'Get #edit' do
      it "assigns the requsted project" do
        project = create(:project)
        get :edit, params: { id: project.id }
        expect(assigns(:project)).to eq project
      end
      it "renders the :edit template" do
        project = create(:project)
        get :edit, params: { id: project.id }
        expect(response).to render_template :edit
      end
    end

    describe 'Patch #update' do
      it "update the project in the database" do
        @project = create(:project)
        project_params = attributes_for(:project, name: 'modify project name')
        patch :update, params: {id: @project.id, project: project_params}
        expect(@project.reload.name).to eq('modify project name')
      end

      context "invalid attributes" do
        it "does not update the project" do
          @project = create(:project)
          project_params = attributes_for(:project, name: '')
          patch :update, params: {id: @project.id, project: project_params}
          expect(response).to render_template :edit
        end
      end
    end

    describe '#create' do
      it "create a project" do
        project_params = attributes_for(:project)
        post :create, params: {project: project_params}
        expect(response).to_not render_template :new
      end

      context "invalid attributes" do
        it "does not create a project" do
          project_params = attributes_for(:project, name: '')
          post :create, params: {project: project_params}
          expect(response).to render_template :new
        end
      end
    end

  end
end