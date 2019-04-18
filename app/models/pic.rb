class Pic < ApplicationRecord
  belongs_to :user
  mount_uploader :photo, PhotoUploader
  acts_as_votable
end
