class Item < ActiveRecord::Base
  belongs_to :user

  scope :visible_to, -> (user) { joins(:user).where(user_id: user.id) }

end
