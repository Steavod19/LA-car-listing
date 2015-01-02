class Manufacturer < ActiveRecord::Base
  has_many :cars
  validates :name,
  presence: true,
  uniqueness: { scope: :name }
  validates :country,
  presence: true
end
