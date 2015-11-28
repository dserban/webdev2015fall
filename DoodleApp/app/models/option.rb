class Option < ActiveRecord::Base
  has_many :actual_choices
  has_many :participants, :through => :actual_choices
end

