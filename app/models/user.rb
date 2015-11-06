class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # to do: que sea el default en la db
  validate :user_belongs_to_company
  before_save :update_title

  before_validation(on: :create) do
    self.bottles = 0
    self.title = "#{self.first_name} #{self.last_name}"
  end

  scope :own, -> { where("company_id=?", self.current.company_id) unless self.current.site_admin }

  def update_title
    if bottles < 0
    end
      errors.add(:bottles, "No puede ser menor a 0")
    self.title = "#{self.first_name} #{self.last_name}"
  end

  def self.current
    Thread.current[:user]
  end

  def self.current=(user)
    Thread.current[:user] = user
  end

  def user_belongs_to_company
    if self.company.present? && User.current.present?
      company = self.company
      father = User.current.company
      if father != company && (!User.current.site_admin)
        errors.add(:company, "No puede crear un usuario para otra empresa")
      end
    end
  end

  has_many :transactions
  has_many :trades
  belongs_to :company

  validates_uniqueness_of :email, allow_blank: false
  validates_numericality_of :bottles, greater_than_or_equal_to: 0
  validates_numericality_of :dni, less_than_or_equal_to: 100000000
  validates_uniqueness_of :rfid, allow_blank: true
end
