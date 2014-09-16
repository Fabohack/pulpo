class Task < ActiveRecord::Base
  
  validates :estimated_time, numericality: { greater_than_or_equal_to: 1, only_integer: true }
  validates :completed_time, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  
  
  belongs_to :author, :class_name => "User", :foreign_key => "author_id" 
  belongs_to :assigned, :class_name => "User", :foreign_key => "assigned_to_id"
  has_many :attachments
  accepts_nested_attributes_for :attachments
  
  
end
