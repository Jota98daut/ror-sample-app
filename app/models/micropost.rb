class Micropost < ApplicationRecord
  belongs_to :user
  belongs_to :platform

  has_one_attached :image do |attachable|
    attachable.variant :display, resize_to_limit: [500, 500]
  end

  validates :user_id, presence: true
  validates :platform, presence: true
  validates :content, presence: true,
                      length: { maximum: 140 }
  validates :image,   content_type: { in: %w[image/jpeg image/gif image/png],
                                      message: 'must be a valid image format' },
                      size: { less_than: 5.megabytes,
                              message: 'should be less than 5MB' }

  default_scope -> { order(created_at: :desc) }

  def short_content(length = 50)
    if content.length <= length
      content
    else
      "#{content[0..length - 3]}..."
    end
  end
end
