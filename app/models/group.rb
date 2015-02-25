class Group < ActiveRecord::Base
  belongs_to :user

  has_many :members, foreign_key: :group_id
end
