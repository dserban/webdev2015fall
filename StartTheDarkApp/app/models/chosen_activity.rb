class ChosenActivity < ActiveRecord::Base
  attr_accessor :array_of_participants, :participant_count

  belongs_to :activity_author
  has_many :participants

  def augment
    @array_of_participants = self.participants
    @participant_count = @array_of_participants.length
    self
  end
end

