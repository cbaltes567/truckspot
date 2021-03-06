class ReservationResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :user_id, :integer
  attribute :garage_id, :integer
  attribute :start_time, :datetime
  attribute :end_time, :datetime

  # Direct associations

  belongs_to :garage

  belongs_to :user

  # Indirect associations
end
