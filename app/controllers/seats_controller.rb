class SeatsController < ApplicationController
  # before_action :authorize_access_request!
  before_action :flight_params
  before_action :set_seat,only: [:show, :update, :destroy]
  before_action :search_pnr,only: [:seats_by_pnr]
  before_action :seat_params , on: :update

  def index
    info = flight_params
    @flight = Flight.where(origin: info["origin"]).where(dist: info["dist"]).where(aeroplane_id: info["aeroplane_id"]).first
    @seats = @flight.seats
    @categories = Category.where(aeroplane_id: info["aeroplane_id"])
    msg = {:status => "ok", :seats => @seats , :categories => @categories}
		render json: msg
  end

  def show

  end

  def update_seat
    @seat = Seat.find(params["old_id"]);
    if @seat.update(booked: 0)
      get_seat # to booking the new seat
    end
  end

  def get_seat
    @seat = Seat.find(params["new_id"]);
    if @seat.update(booked: 1)
      render json: @seat , status: :created
    end
  end
  


  def seats_by_pnr
    @seats = Seat.where(flight_id: search_pnr["flight_id"])
    @flight = Flight.find(search_pnr["flight_id"])
    @categories = Flight.find(search_pnr["flight_id"]).aeroplane.categories
    msg = {:status => "ok", :seats => @seats , :categories => @categories , :seat => search_pnr ,:flight => @flight}
		render json: msg
  end

  def create(param_1)
    @aeroplane = Aeroplane.find(param_1)
    # @categories = @aeroplane.categories.group(:name)
    
    render json: @aeroplane
  end

  def update
    
    if @seat.update(seat_params)
      render json: @seat
    else
      render json: @seat.errors, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private
  def flight_params
		params.permit(:origin , :dist , :aeroplane_id)
	end
  def seat_params
    params.permit(:id , :price)
  end
  def set_seat
    @seat = Seat.find(params[:id])
  end
  def search_pnr
   Seat.find_by(pnr: params[:pnr])
  end
end
