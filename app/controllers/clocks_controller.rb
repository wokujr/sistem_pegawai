class ClockEventsController < ApplicationController

  def clock_in
    user = User.current_user
    clock_event = user.clock_events.create(clock_in: true, event_time: Time.now)
  end

end