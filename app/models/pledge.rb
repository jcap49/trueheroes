class Pledge < ActiveRecord::Base

  #attrs
  attr_accessible :activity, :date, :name, :email, :photo

  belongs_to :user

  #validators
  validates :name, presence: true
  validates :date, presence: true
  validates :activity, presence: true
  validates :email, presence: true

end
