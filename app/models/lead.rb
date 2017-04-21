class Lead < ApplicationRecord
  belongs_to :user, optional: true

  validates :name, presence: true
  validates :email, presence: true, format: { with: /\A.*@.*\.\S*\z/ }
  validates :user, presence: true
  validates :source, presence: true
  validates :status, inclusion: { in: ["pending","accepted","settled","lost"], allow_nil: false }

end
