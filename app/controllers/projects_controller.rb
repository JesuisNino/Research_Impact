class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  def index

    @projects = Project.all

    accessprojects = []
    @projects.each do |proj|

      str = proj.invites
      splitinvites = str.try(:split, " ") || ['empty']
      splitinvites.each do |splitted|
        if splitted == current_user.email
          accessprojects.push(proj.id)
        end
      end

    end

    @projects = Project.where(id: accessprojects)

        
  end
  
  # GET /projects/1
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  def create
    @project = Project.new(project_params)
    # binding.pry

    if @project.save
      Invitation.create(email: current_user.email, projectid: @project.id, projecttitle: "dqls")
      @project.update(invites: current_user.email)
      redirect_to @project, notice: 'Project was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /projects/1
  def update
    if @project.update(project_params)
      proj = Invitation.find_by(projectid: @project.id)
      if proj.present?
        proj.email = proj.email + ' '+ @project.invites
        proj.save
        @project.update(invites: proj.email)
      end
      
      redirect_to @project, notice: 'Project was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /projects/1
  def destroy
    @project.destroy
    redirect_to projects_url, notice: 'Project was successfully deleted.'
  end

  # POST /projects/search
  def search
    @projects = Project.all
    if(params[:name] != "")
      @projects = @projects.where("lower(name) LIKE?", "%#{params[:search][:name].downcase}%")
    end
    render :index
  end

  # GET /projects/1/export
  def export
    @project = Project.find_by(id: params[:id])
    respond_to do |format|
        format.html
        format.pdf do
            # create new PDF and give instance
            pdf = RecordPdf.new(@project)
            
            #Display PDF
            send_data pdf.render,
                filename:    @project.name + ".pdf",
                type:        "application/pdf",
                disposition: "inline"
        end
    end
  end 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def project_params
      #params.require(:project).permit(:name, :description, :founder, :grant, :start, :end, :active, :invites)
      params.require(:project).permit(:name, :description, :founder, :grant, :start, :end, :active, :project_id, :invites) #remove project_id here only?
    end
end
