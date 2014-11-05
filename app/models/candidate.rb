class Candidate < ActiveRecord::Base

  has_many :votes

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :party_affil, presence: true
  validates :district, presence: true

end
