class Company < ActiveRecord::Base
  has_many :users
  has_many :stations
  has_many :prizes

  validates :cuit, :legal_name, uniqueness: true
  validates :cuit, :legal_name, presence: true
end
