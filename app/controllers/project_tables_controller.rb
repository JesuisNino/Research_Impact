class ProjectTablesController < ApplicationController
  before_action :set_project_table, only: [:show, :edit, :update, :destroy]

  # GET /project_tables
  def index
    @project_tables = ProjectTable.all
  end

  # GET /project_tables
  def show
  end

  # GET /project_tables/new
  def new
    @project_table = ProjectTable.new
  end

  # GET /project_tables/edit
  def edit
  end

  # POST /project_tables
  def create
    @project_table = ProjectTable.new(project_table_params)

    if @project_table.save
      redirect_to @project_table, notice: 'Project table was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /project_tables
  def update
    if @project_table.update(project_table_params)
      redirect_to @project_table, notice: 'Project table was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /project_tables
  def destroy
    @project_table.destroy
    redirect_to project_tables_url, notice: 'Project table was successfully deleted.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_table
      @project_table = ProjectTable.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def project_table_params
      params.require(:project_table).permit(:projecttitle, :projectdescription, :founder_name, :grant_name, :start_date, :end_date, :is_active)
    end
end
