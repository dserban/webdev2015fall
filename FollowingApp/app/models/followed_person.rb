class FollowedPerson < User
  has_many :follower_relationships
  has_many :followers, :through => :follower_relationships
end

