class Appointment < ApplicationRecord
  belongs_to :customer
  belongs_to :barber

  has_and_belongs_to_many :services
end
