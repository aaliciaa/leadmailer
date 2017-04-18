class Lead < ApplicationRecord
  belongs_to :user, optional: true

  validates :status, inclusion: { in: ["pending","accepted","settled","lost"], allow_nil: false }
  validates :email, presence: true

end
