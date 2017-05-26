class Driver1sController < ApplicationController
  before_action :set_driver1, only: [:show, :edit, :update, :destroy]
  skip_before_action :check_ctr_auth, only: [:new, :create], raise: false
  skip_before_filter :require_login, :only => [:new, :create]

  # GET /driver1s
  # GET /driver1s.json
  def index
    @driver1s = Driver1.all
  end

  # GET /driver1s/1
  # GET /driver1s/1.json
  def show
  end

  # GET /driver1s/new
  def new
    @driver1 = Driver1.new
    @driver1.cars.build

  end

  # GET /driver1s/1/edit
  def edit
  end

  # POST /driver1s
  # POST /driver1s.json
  def create
    @driver1 = Driver1.new(driver1_params)

    respond_to do |format|
      if @driver1.save
        format.html { redirect_to @driver1, notice: 'Driver1 was successfully created.' }
        format.json { render :show, status: :created, location: @driver1 }
      else
        format.html { render :new }
        format.json { render json: @driver1.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /driver1s/1
  # PATCH/PUT /driver1s/1.json
  def update
    respond_to do |format|
      if @driver1.update(driver1_params)
        format.html { redirect_to @driver1, notice: 'Driver1 was successfully updated.' }
        format.json { render :show, status: :ok, location: @driver1 }
      else
        format.html { render :edit }
        format.json { render json: @driver1.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /driver1s/1
  # DELETE /driver1s/1.json
  def destroy
    @driver1.destroy
    respond_to do |format|
      format.html { redirect_to driver1s_url, notice: 'Driver1 was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_driver1
      @driver1 = Driver1.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def driver1_params
      params.require(:driver1).permit(:fn, :sn, :ln, :birthday, :inn, :series_p, :number_p, cars_attributes: [:id, :_destroy, :mark, :class_c, :license_plate, :color, :year_of_issue])
    end
  
    def check_ctr_auth()
      case action_name.to_sym
      when :show
        if @current_role_user.try(:is_admin?)
          return true
        end
        if @current_role_user.try(:is_operator?)
          return true
        end
      when :index
        if @current_role_user.try(:is_admin?)
          return true
        end
        if @current_role_user.try(:is_operator?)
          return true
        end
      when :new
        if @current_role_user.try(:is_admin?)
          return true
        end
        if @current_role_user.try(:is_operator?)
          return false
        end
      when :create
        if @current_role_user.try(:is_admin?)
          return true
        end
        if @current_role_user.try(:is_operator?)
          return false
        end
      when :edit
        if @current_role_user.try(:is_operator?)
          return false
        end
        if @current_role_user.try(:is_admin?)
          return true
        end
      when :destroy
        if @current_role_user.try(:is_operator?)
          return false
        end
        if @current_role_user.try(:is_admin?)
          return true
        end
      end
    end 
end
