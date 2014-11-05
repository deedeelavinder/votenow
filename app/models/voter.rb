require 'securerandom'

class Voter < ActiveRecord::Base

  has_one :vote

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  before_save :add_token

  def as_json(options)
    hash = {id: id,
            name: name,
            email: email,
            party_affil: party_affil,
            location: location,}
    if options[:include_token]
      hash.merge!(token: token)
    end

    {voter: hash}
  end

  private

  def add_token
    self.token ||= SecureRandom.uuid
  end

end
