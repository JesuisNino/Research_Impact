class UsertablesController < ApplicationController
  before_action :set_usertable, only: [:show, :edit, :update, :destroy]

  # GET /usertables
  def index
    users = Usertable.where(email: current_user.email)

    if users.length() == 0 then
      Usertable.create(fname: current_user.givenname, sname: current_user.sn, department: "COM", email: current_user.email, title: "Mr", profilepic: "e")
    end

    @usertables = Usertable.all
  end

  # GET /usertables/1
  def show
  end

  # GET /usertables/new
  def new
    @usertable = Usertable.new
  end

  # GET /usertables/1/edit
  def edit
  end

  # POST /usertables
  def create
    @usertable = Usertable.new(usertable_params)

    if @usertable.save
      redirect_to @usertable, notice: 'Usertable was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /usertables/1
  def update
    if @usertable.update(usertable_params)
      redirect_to usertables_url, notice: 'Your profile has been updated.'
    else
      render :edit
    end
  end

  # DELETE /usertables/1
  def destroy
    @usertable.destroy
    redirect_to usertables_url, notice: 'Usertable was successfully deleted.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usertable
      @usertable = Usertable.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def usertable_params
      params.require(:usertable).permit(:fname, :sname, :department, :email, :title, :profile_image, :profilepic)
    end
end

