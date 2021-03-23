class BookingsController < ApplicationController
  before_action :booking_params
  # after_action  :reserve_seat , only:[:create]
  def create
    @booking = Booking.new(booking_params)
    if @booking.save
			reserve_seat
		else
			render json: @booking.errors, status: :unprocessable_entity
		end
  
  end
  
  def reserve_seat
    @seat = Seat.find(booking_params["seat_id"])
    if @seat.update(booked: 1)
      msg = {seat: @seat , booking: @booking,:message => "Aeroplane Model and Confiqurations Added Succesfully"}
      render json: msg , status: :created
    else
      render json: @seat.errors, status: :unprocessable_entity
    end
  end

  def update
  end

  def destroy
  end
  private
  def booking_params
    params.require(:booking).permit(:fullname , :flight_id , :aeroplane_id , :seat_id , :paid)
  end
  
end
