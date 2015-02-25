class User < ActiveRecord::Base
  has_many :groups, foreign_key: :user_id
end
