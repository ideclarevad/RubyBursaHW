class Vote < ActiveRecord::Base

  belongs_to :petition
  belongs_to :user

  validates_presence_of :user_id, :petition_id
  validates_uniqueness_of :user_id, :scope => [:petition_id]

end
