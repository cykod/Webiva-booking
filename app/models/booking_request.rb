class BookingRequest < DomainModel
  validates_presence_of :name, :phone, :request_date, :request_time
  belongs_to :end_user
end