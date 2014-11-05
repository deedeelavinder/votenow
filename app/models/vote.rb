class Vote < ActiveRecord::Base
  belongs_to :voter
  belongs_to :candidate

  validates_uniqueness_of :vote_id, scope: [ :voter_id, :candidate_id]

end
