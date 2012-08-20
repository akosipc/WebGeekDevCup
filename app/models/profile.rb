class Profile < ActiveRecord::Base
	belongs_to :user, :dependent => :destroy
  attr_accessible :fname, :gender, :lname

 	validates :fname, :lname, :gender, :presence => true
 	validates :fname, :length => 6..30
 	validates :lname, :length => 2..30
end
