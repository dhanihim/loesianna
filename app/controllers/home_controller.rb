class HomeController < ApplicationController
  def index
  end

  def calendar
      @client_activity_processlist_late = ClientActivityProcesslist.where("target_start < ? AND status < 2", DateTime.now)
      @client_activity_processlist_upcoming = ClientActivityProcesslist.where("target_start >= ? AND target_start <= ? AND status < 2", DateTime.now, 7.days.from_now) 
  
      @client_birthday = Client.where("cast(strftime('%m', birthdate) as int) = ? AND cast(strftime('%d', birthdate) as int) >= ?", DateTime.now.month, DateTime.now.day)


      @client_activity_certificate = ClientActivity.where("certificate_expired >= ? AND certificate_expired <= ?", DateTime.now, 90.days.from_now)
      @client_activity_activity = ClientActivity.where("activity_expired >= ? AND activity_expired <= ?", DateTime.now, 90.days.from_now)
  end
end
