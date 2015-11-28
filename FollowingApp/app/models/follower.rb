class Follower < User
  has_many :follower_relationships
  has_many :followed_people, :through => :follower_relationships
end

