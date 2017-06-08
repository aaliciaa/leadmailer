class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :leads
  belongs_to :customer

  validates :name, presence: true, uniqueness: true
  validates :customer, presence: true

end
