class FlightsController < ApplicationController
  before_action :authorize_access_request!
  before_action :flight_params
  before_action :flight , only: [:check_flight]
  # include CategoryInteractor
  def index
    @flights = Flight.all
    render json: @flights
  end

  

  def check_flight
    @flight = Flight.where(origin: flight["origin"] , dist: flight["dist"]).first
    if(@flight)
      msg = {:status => "ok", :message => "flight Added Succesfully" , flight: @flight}
      render json: msg, status: :ok
    else
      render json: "flight not exist", status: 400
    end
  end

  def create
    @flight = Flight.new(create_flight)
    if @flight.save
      if create_seats
        msg = {:status => "ok", :message => "flight Added Succesfully"}
        render json: msg, status: :created
      end
		else
			render json: @flight.errors, status: :unprocessable_entity
		end
  end

  def create_seats
    @aeroplane = Aeroplane.find(create_flight["aeroplane_id"])
    @categories = @aeroplane.categories
    @seat = Seat.new
    @categories.each { |key , value|
      if(key.name == 'A')
        seats_no = key.rows * key.cols
        seats_no.times {
          pnr = @seat.create_unique_pnr
          seat_config(pnr , key.id , @flight.id , seats_params["a"])
        }
      end
      if(key.name == 'B')
        seats_no = key.rows * key.cols
        seats_no.times {
          pnr = @seat.create_unique_pnr
          seat_config(pnr , key.id , @flight.id , seats_params["b"])
        }
      end
      if(key.name == 'C')
        seats_no = key.rows * key.cols
        seats_no.times {
          pnr = @seat.create_unique_pnr
          seat_config(pnr , key.id , @flight.id , seats_params["c"])
        }
      end
    } 
  end
  def seat_config(pnr , category_id , flight_id , price) 
    Seat.create!(
      pnr: pnr,
      category_id: category_id,
      flight_id: flight_id,
      price: price,
      )
  end

  def destroy
  end

  private
	def flight_params
		params.permit(:flight,:prices)
	end
  def flight
		params.permit(:origin , :dist)
	end
	def create_flight
		params.require(:flight).permit(:origin , :dist , :aeroplane_id)
	end
  def seats_params
    params.require(:prices).permit(:a,:b,:c)
  end
end
