class ApplicationsController < ApplicationController
  before_action :set_application, only: [:show, :edit, :update, :destroy]
  # before_action :authorize

  # GET /applications
  # GET /applications.json
  def index
    @applications = Application.all
  end

  # GET /applications/1
  # GET /applications/1.json
  def show
    @student_id = session[:user_id]
    @course_id = params[:course_id]    
  end

  # GET /applications/new
  def new
    @application = Application.new
    @student_id = session[:user_id]
    @course_id = params[:course_id]
    # I believe this is redundant because we have a hidden input in the new_form that sets status_id = 2
    # but am keeping it here for now just in case
    # @application.status_id = 2
  end

  # GET /applications/1/edit
  def edit
    @student_id = session[:user_id]
    @course_id = params[:course_id]
  end

  # POST /applications
  # POST /applications.json
  def create
    @application = Application.new(application_params)

    respond_to do |format|
      if @application.save
        UserMailer.welcome_email(@application.student).deliver
        UserMailer.wecome_officer(@application.employee).deliver 
        format.html { redirect_to @application, notice: 'Application was successfully created.' }
        format.json { render :show, status: :created, location: @application }
      else
        format.html { render :new }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /applications/1
  # PATCH/PUT /applications/1.json
  def update
    @student_id = session[:user_id]
    @course_id = params[:course_id]

    respond_to do |format|
      if @application.update(application_params)

        UserMailer.status_email(@application.student).deliver 
        format.html { redirect_to @course_application_path(@application.course, @application), notice: 'Application was successfully updated.' }

        format.json { render :show, status: :ok, location: @application }
      else
        format.html { render :edit }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /applications/1
  # DELETE /applications/1.json
  def destroy
    @application.destroy
    respond_to do |format|
      format.html { redirect_to applications_url, notice: 'Application was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_application
      @application = Application.find(params[:application_id])

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def application_params
      params.require(:application).permit(:notes, :student_id, :course_id, :status_id, :text_file)
    end
end
