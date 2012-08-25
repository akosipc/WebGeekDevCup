class Lightbulb < ActiveRecord::Base
  attr_accessible :title,:description, :target_participants, 
  								:current_participants

  has_and_belongs_to_many :categories
  has_and_belongs_to_many :users

  validates :title, :description, :target_participants, :current_participants, :presence => true
  validates :title, :length => 6..50
  validates :description, :length => 6..250
  validates :target_participants, :current_participants, :numericality => true
end
