class Transaction < ActiveRecord::Base
  belongs_to :user
  belongs_to :station

  validates :user,:station, presence: true
  validate :company_owns_station
  after_create :update_user_bottle_count

  def company_owns_station
    if self.user.present? and self.station.present?
      company = self.user.company
      station = self.station
      if station.company != company
        errors.add(:station, "Esta estación no es de esta empresa.")
      end
    end
  end

  def update_user_bottle_count
    user = User.find(self.user)
    user.bottles += self.bottles
    user.save
  end

end
