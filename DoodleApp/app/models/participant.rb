class Participant < ActiveRecord::Base
  has_many :actual_choices
  has_many :options, :through => :actual_choices
end

