class Lead < ApplicationRecord
  belongs_to :customer
  belongs_to :user, optional: true

  validates :name, presence: true
  validates :email, presence: true, format: { with: /\A.*@.*\.\S*\z/ }
  validates :user, presence: true
  validates :phone, presence: true
  validates :source, presence: true
  validates :html, presence: true
  validates :customer, presence: true
  validates :status, inclusion: { in: ["pending","accepted","settled","lost"], allow_nil: false }

  def self.to_csv
    attributes = %w{name email received_at accepted_at user status source response_time created_at updated_at phone }
    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |lead|
        hash = lead.attributes
        hash["user"] = lead.user.name
        csv << hash.values_at(*attributes)
      end
    end
  end
end
