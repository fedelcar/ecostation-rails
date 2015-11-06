class Prize < ActiveRecord::Base
  belongs_to :company
  belongs_to :user
  belongs_to :trade

  validates :bottles, :company, :name, :description, presence: true
  validates :bottles, numericality: { only_integer: true, greater_than_or_equal_to: 1 }

  scope :own, -> { where("company_id=?", User.current.company_id) unless User.current.site_admin }
  validate :user_belongs_to_company

  def user_belongs_to_company
    if self.company.present? and User.current.present?
      company = self.company
      station = User.current.company
      if station != company && !User.current.site_admin
        errors.add(:company, "No puede asignarle premios a otra empresa.")
      end
    end
  end

end
