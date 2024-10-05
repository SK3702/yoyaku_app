class ReservationsController < ApplicationController
  def index
    @reservations = current_user.reservations
  end

  def confirm
      @reservation = Reservation.new(reservation_params)
      @room = Room.find(params[:reservation][:room_id])
      @days = (@reservation.check_out - @reservation.check_in).to_i
      @total_price = (@room.price * @reservation.people * @days).to_i
    if @reservation.invalid?
      render "rooms/show"
    end
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @room = Room.find(params[:reservation][:room_id])
    if @reservation.save
      redirect_to reservations_path
    else
      render "rooms/show"
    end
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.update(reservation_params)
      redirect_to reservations_path
    else
      render :edit
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to reservations_path
  end

  private
  def reservation_params
    params.require(:reservation).permit(:check_in, :check_out, :people, :user_id, :room_id)
  end
end
