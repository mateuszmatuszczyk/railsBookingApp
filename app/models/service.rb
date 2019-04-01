class Service < ApplicationRecord
  belongs_to :appointment

  has_and_belongs_to_many :appointments
end
