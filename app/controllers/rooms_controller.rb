class RoomsController < ApplicationController
  def new
    @room = Room.new
    @user = current_user
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to room_path(@room.id)
    else
      render new_room_path
    end
  end

  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(room_params)
      redirect_to room_path(@room.id)
    else
      render :edit
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to rooms_own_path
  end

  def search
    @rooms = Room.search(params[:keyword])
  end

  def own
    @rooms = current_user.rooms
  end

  private
    def room_params
      params.require(:room).permit(:room_name, :memo, :price, :address, :room_image, :user_id)
    end

    def reservation_params
      params.require(:reservation).permit(:check_in, :check_out, :people, :user_id, :room_id)
    end
end
