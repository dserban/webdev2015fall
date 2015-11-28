class ActualChoice < ActiveRecord::Base
  belongs_to :participant
  belongs_to :option
end

