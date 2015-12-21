class ApplicationsController < ApplicationController
  before_action :set_application, only: [:show, :edit, :update, :destroy]
  before_action :authorize
  before_action :authenticate_employee, only: [:index]
  before_action :authenticate_student_app, only: [:show, :edit, :update]

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
    @course = Course.find(@course_id)
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
        
        @application.course.officers.each do |instructor|
          UserMailer.welcome_officer(instructor).deliver
        end 
        
        format.html { redirect_to course_application_path(@application.course, @application), notice: 'Application was successfully created.' }
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
        
        if @application.status_id == 1
          UserMailer.rejection_email(@application.student).deliver
        elsif @application.status_id == 8
          UserMailer.acceptance_email(@application.student).deliver
        elsif @application.status_id == 5
          @application.course.instructors.each do |instructor|
            UserMailer.instructor_email(instructor, @application).deliver
          end
        end

            
        format.html { redirect_to course_application_path(@application.course, @application), notice: 'Application was successfully updated.' }

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
    course = Course.find(params[:course_id])

    @application.destroy
    respond_to do |format|
      format.html { redirect_to course_applications_path(course), notice: 'Application was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_application
      @application = Application.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def application_params
      params.require(:application).permit(:notes, :student_id, :course_id, :status_id, :text_file)
    end

    def authenticate_student_app
      redirect_to '/' if @application.student_id != session[:user_id] && current_user.type == "Student"
    end
end
