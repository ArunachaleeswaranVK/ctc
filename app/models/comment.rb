class Comment < ActiveRecord::Base
  belongs_to :link
  belongs_to :user
  
  acts_as_votable
end
