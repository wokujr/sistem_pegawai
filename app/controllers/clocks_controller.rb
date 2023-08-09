class ClocksController < ApplicationController

  def clock_in
    user = User.current_user
    clock = user.clocks.create(clock_in: true, event_time: Time.now)
    if clock.persisted?
      redirect_to user_path(user), notice: "Clocked in Successfully"
    else
      redirect_to user_path(user), alert: "Unable to Clock-In"
    end
  end

  def clock_out
    user =User.current_user
    clock = user.clocks.create(clock_in: false , event_time: Time.now)
    if clock.persisted?
      redirect_to root_path, notice: "Clocked Out!"
    else
      redirect_to root_path, alert: "Unable to Clock Out"
    end
  end

end