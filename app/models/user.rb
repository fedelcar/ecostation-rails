class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # to do: que sea el default en la db
  validate :user_belongs_to_company
  before_validation(on: :create) do
    self.bottles = 0
    self.title = "#{self.first_name} #{self.last_name}"
  end

  scope :own, -> { where("company_id=?", self.current.company_id) unless self.current.site_admin }

  def self.current
    Thread.current[:user]
  end

  def self.current=(user)
    Thread.current[:user] = user
  end

  def user_belongs_to_company
    if self.company.present? and User.current.present?
      company = self.company
      father = User.current.company
      if father != company
        errors.add(:company, "No puede crear un usuario para otra empresa")
      end
    end
  end

  has_many :transactions
  has_many :trades
  belongs_to :company

  validates :email, presence: true
  validates :email, uniqueness: true
  validates_uniqueness_of :rfid, allow_blank: true
end
