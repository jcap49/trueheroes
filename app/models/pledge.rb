class Pledge < ActiveRecord::Base

  #attrs
  attr_accessible :activity, :date, :first_name, :last_name, :email, :photo

  belongs_to :user

  #validators
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :date, presence: true
  validates :activity, presence: true
  validates :email, presence: true

end
