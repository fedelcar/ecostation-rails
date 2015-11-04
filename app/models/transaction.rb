class Transaction < ActiveRecord::Base
  belongs_to :user
  belongs_to :station
  belongs_to :company

  validates :user, :station, :bottles, :time, presence: true
  validates :bottles, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validate :company_owns_station
  after_create :update_user_bottle_count

  scope :own, -> { where("company_id=?", User.current.company_id) unless User.current.site_admin }

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
    self.company_id = user.company_id
    user.save
  end

end
