class FieldsController < ApplicationController
    before_action :set_field, only: [:show, :edit, :update, :destroy] #What does this do? is it needed?

    def new
        est = params[:project_id]
        @field = Field.new
        @field.project_id = est
        @projects = Project.where(id: est)
    end

    def create
        field_params = params.require(:field).permit(:title, :field_type, :evidence, :impactType, 
        :date, :contacts, :comments, :project_id, :files)

        @field = Field.new(field_params)
        @projects = Project.where(id: @field.project_id)

        if @field.save
            num = "/projects/"+@field.project_id.to_s
            redirect_to num, notice: 'Field was created'
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @field.update(field_params)
            num = "/projects/"+@field.project_id.to_s
            redirect_to num, notice: 'Field was created'
        else
          render :edit
        end
    end

    def destroy
        @field.destroy
        num = "/projects/"+@field.project_id.to_s
        redirect_to num, notice: 'Field was created'
    end

    




    private #needed?
    def set_field
        @field = Field.find(params[:id])
      end

      def field_params
        params.require(:field).permit(:title, :field_type, :evidence, :impactType, 
            :date, :contacts, :comments, :project_id, :files)
      end




end