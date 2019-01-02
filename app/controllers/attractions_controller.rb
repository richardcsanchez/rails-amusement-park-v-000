class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find_by_id(params[:id])
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)
     if @attraction.save
       redirect_to attraction_path(@attraction)
     else
       render :new
     end
  end

  def edit
    @attraction = Attraction.find_by_id(params[:id])
  end

  def update
    @attraction = Attraction.find_by_id(params[:id])
    if @attraction.update(attraction_params)
      redirect_to attraction_path(@attraction)
    else
      render :edit
    end
  end

  private
    def set_attraction
      @attraction = Attraction.find(params[:id])
    end

    def attraction_params
      params.require(:attraction).permit(
        :name,
        :min_height,
        :tickets,
        :happiness_rating,
        :nausea_rating
      )
    end


end
