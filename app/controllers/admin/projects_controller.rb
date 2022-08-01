class Admin::ProjectsController < ApplicationController
    before_action :set_project, only: [:show, :edit, :update, :destroy]
    def index 
        @projects = Project.all
    end
end