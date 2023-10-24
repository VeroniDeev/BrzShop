class WhoVoted < ApplicationRecord
  belongs_to :user
  belongs_to :review

end
