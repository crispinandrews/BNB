class Request
	include DataMapper::Resource

  belongs_to :space
  belongs_to :user

	property :id, Serial
  property :date, Date
  property :confirmed, Boolean

  def confirm_message
    confirmed ? "Confirmed" : "Not confirmed"
  end

	def self.exists?(user_id: nil, space_id: nil, date: '')
		!Request.first(user_id: user_id, space_id: space_id, date: date).nil?
	end

	def self.no_of_spaces_booked(user)
		self.all(user_id: user.id, confirmed: true).length
	end
end
