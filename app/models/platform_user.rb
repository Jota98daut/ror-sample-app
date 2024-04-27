class PlatformUser < ApplicationRecord
  belongs_to :platform
  belongs_to :user
end
