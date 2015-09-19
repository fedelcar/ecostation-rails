class Station < ActiveRecord::Base
  has_many :positions
  belongs_to :company
end
