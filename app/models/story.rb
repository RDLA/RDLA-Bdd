class Story < ActiveRecord::Base

  attr_accessible :description, :type, :priority, :effort, :status,:category, :user_id

  belongs_to :user

  validates :category, :inclusion => { :in => %w(bug feature draft) }
  validates :status, :inclusion => { :in => %w(waiting running complete) }
  validates :priority, :numericality => true
  validates :effort, :numericality => true

  scope :running, where("status='running'")
  scope :waiting, where("status='waiting'")
  scope :complete, where("status='complete'")

#  scope :feature, where("category='feature'")
#  scope :bug, where("category='bug'")
#  scope :draft, where("category='draft'")
end
