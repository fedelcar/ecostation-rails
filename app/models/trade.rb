class Trade < ActiveRecord::Base
  belongs_to :user
  belongs_to :prize
  belongs_to :company
  after_create :update_company
  validates :user, :prize, :date, presence: true
  validate :trade_belongs_to_company
  scope :own, -> { where("company_id=?", User.current.company_id) unless User.current.site_admin }

  def update_company
    self.company = self.user.company
    self.save
  end

  def trade_belongs_to_company
    if self.company.present? and User.current.present?
      company = self.company
      father = User.current.company
      if father != company && !User.current.site_admin
        errors.add(:company, "No puede crear un canje para otra empresa")
      end
    end
    if self.user.present? and User.current.present?
      company = self.user.company
      father = User.current.company
      if father != company && !User.current.site_admin
        errors.add(:company, "No puede crear un canje para un usuario de otra empresa")
      end
    end
    if self.prize.present? and User.current.present?
      company = self.prize.company
      father = User.current.company
      if father != company && !User.current.site_admin
        errors.add(:company, "No puede crear un canje con premios de otra empresa")
      end
    end

  end
end
