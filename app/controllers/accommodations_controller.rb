class AccommodationsController < ApplicationController
  before_action :set_accommodation, only: %i[ show edit update destroy ]

  def top
    authorize Accommodation, :top?
    @accommodations = Accommodation.where(rating: 5)
  end

  # GET /accommodations or /accommodations.json
  def index
    @accommodations = policy_scope(Accommodation).all
    # The `geocoded` scope filters only flats with coordinates
    @markers = @accommodations.geocoded.map do |accommodation|
      {
        lat: accommodation.latitude,
        lng: accommodation.longitude
      }
    end
  end

  # GET /accommodations/1 or /accommodations/1.json
  def show
    authorize @accommodation
  end

  # GET /accommodations/new
  def new
    @accommodation = Accommodation.new
    authorize @accommodation
  end

  # GET /accommodations/1/edit
  def edit
    authorize @accommodation
  end

  # POST /accommodations or /accommodations.json
  def create
    @accommodation = Accommodation.new(accommodation_params)
    @accommodation.user = current_user
    authorize @accommodation

    respond_to do |format|
      if @accommodation.save
        format.html { redirect_to accommodation_url(@accommodation), notice: "Accommodation was successfully created." }
        format.json { render :show, status: :created, location: @accommodation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @accommodation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accommodations/1 or /accommodations/1.json
  def update
    authorize @accommodation
    respond_to do |format|
      if @accommodation.update(accommodation_params)
        format.html { redirect_to accommodation_url(@accommodation), notice: "Accommodation was successfully updated." }
        format.json { render :show, status: :ok, location: @accommodation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @accommodation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accommodations/1 or /accommodations/1.json
  def destroy
    authorize @accommodation
    @accommodation.destroy

    respond_to do |format|
      format.html { redirect_to accommodations_url, notice: "Accommodation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_accommodation
    @accommodation = Accommodation.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def accommodation_params
    params.require(:accommodation).permit(:name, :address, :rating, photos: [])
  end
end
