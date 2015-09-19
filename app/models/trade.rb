class Trade < ActiveRecord::Base
  belongs_to :user
  has_many :prizes
end
