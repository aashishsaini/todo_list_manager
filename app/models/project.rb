class Project < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_and_belongs_to_many :developers, class_name: 'User', foreign_key: 'user_id'
  has_many :todos

  validates :name, presence: true
end
