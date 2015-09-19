class Prize < ActiveRecord::Base
  belongs_to :company
  belongs_to :user
  belongs_to :trade
end
