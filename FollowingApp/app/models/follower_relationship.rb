class FollowerRelationship < ActiveRecord::Base
  belongs_to :follower
  belongs_to :followed_person
end

