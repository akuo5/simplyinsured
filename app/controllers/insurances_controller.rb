class InsurancesController < ApplicationController
  before_action :set_insurance, only: [:show, :edit, :update, :destroy]

  # GET /insurances
  # GET /insurances.json
  def index
    @insurances = Insurance.all

    age = params[:age]
    zip_code = params[:zip_code]
    location = Zip.find_by(zip_code: zip_code)
    region = nil

    if location.present?
      region = location.region
    end

    if region == 0
      region = nil
    end

    @insurances = Insurance.where(age: age, region: region).to_a
  end

  # GET /insurances/1
  # GET /insurances/1.json
  def show
  end

  # GET /insurances/new
  def new
    @insurance = Insurance.new
  end

  # GET /insurances/1/edit
  def edit
  end

  # POST /insurances
  # POST /insurances.json
  def create
    @insurance = Insurance.new(insurance_params)

    respond_to do |format|
      if @insurance.save
        format.html { redirect_to @insurance, notice: 'Insurance was successfully created.' }
        format.json { render :show, status: :created, location: @insurance }
      else
        format.html { render :new }
        format.json { render json: @insurance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /insurances/1
  # PATCH/PUT /insurances/1.json
  def update
    respond_to do |format|
      if @insurance.update(insurance_params)
        format.html { redirect_to @insurance, notice: 'Insurance was successfully updated.' }
        format.json { render :show, status: :ok, location: @insurance }
      else
        format.html { render :edit }
        format.json { render json: @insurance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /insurances/1
  # DELETE /insurances/1.json
  def destroy
    @insurance.destroy
    respond_to do |format|
      format.html { redirect_to insurances_url, notice: 'Insurance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_insurance
      @insurance = Insurance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def insurance_params
      params.require(:insurance).permit(:carrier, :plan, :region, :age, :monthly_premium)
    end
end
