class BookingRequest < DomainModel
  validates_presence_of :name, :phone, :request_date, :request_time
  belongs_to :end_user

  def self.time_select 
    mod_options = Booking::AdminController.module_options
    date = Time.parse('2010/01/01')
    starting = mod_options.starting_hour.to_i * 60 * 60
    ending = mod_options.ending_hour.to_i * 60 * 60
    interval =  mod_options.interval_minutes.to_i * 60
    time = date + starting.seconds
    time_array = []
    while time <= date + ending.seconds
      time_array = time_array + [["#{time.strftime('%l:%M %p')}", (time.seconds_since_midnight/60).to_i]]
      time = time + interval.seconds
    end
    return time_array
  end  
end
