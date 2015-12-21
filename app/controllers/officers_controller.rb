class OfficersController < EmployeesController
  before_action :set_officer, only: [:show, :edit, :update, :destroy]
  # before_action :authorize, except: [:create, :new]

  # GET /officers
  # GET /officers.json
  def index
    @officers = officer.all
  end

  # GET /officers/1
  # GET /officers/1.json
  def show
  end

  # GET /officers/new
  def new
    @officer = officer.new
  end

  # GET /officers/1/edit
  def edit
  end

  # POST /officers
  # POST /officers.json
  def create
    @officer = officer.new(officer_params)

    respond_to do |format|
      if @officer.save
        format.html { redirect_to @officer, notice: 'officer was successfully created.' }
        format.json { render :show, status: :created, location: @officer }
      else
        format.html { render :new }
        format.json { render json: @officer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /officers/1
  # PATCH/PUT /officers/1.json
  def update
    respond_to do |format|
      if @officer.update(officer_params)
        format.html { redirect_to @officer, notice: 'officer was successfully updated.' }
        format.json { render :show, status: :ok, location: @officer }
      else
        format.html { render :edit }
        format.json { render json: @officer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /officers/1
  # DELETE /officers/1.json
  def destroy
    @officer.destroy
    respond_to do |format|
      format.html { redirect_to officers_url, notice: 'officer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_officer
      @officer = officer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def officer_params
      params.require(:officer).permit(:first_name, :last_name, :type, :email, :password_digest)
    end
end
