class Essay < ActiveRecord::Base
  # has_one :user
  belongs_to :user
  # has_and_belongs_to_many :users
  
end
