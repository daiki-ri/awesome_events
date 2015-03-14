class UserEvent < ActiveRecord::Base
  belongs_to :user
  belongs_to :event

  validates :comment, length: { maximum: 20 }, allow_blank: true
end
