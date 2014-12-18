class Item < ActiveRecord::Base
  belongs_to :user
  scope :alive, ->(){ where('created_at > ?', Time.now - 1.week) }
  scope :dead, ->(){ where('created_at <= ?', Time.now - 1.week) }
end
