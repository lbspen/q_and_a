class Qanda < ActiveRecord::Base
  belongs_to :creator, :foreign_key => "created_by", :class_name => "User"
  has_and_belongs_to_many :editors, :class_name => "User"

  attr_accessible :answer, :question

  validates :answer, :question, :presence => true
end
