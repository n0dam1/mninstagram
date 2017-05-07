class Picture < ActiveRecord::Base
  belongs_to :user
  mount_uploader :photo, PhotoUploader
  validates :photo, presence: true
end
