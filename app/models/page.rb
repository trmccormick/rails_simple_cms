class Page < ApplicationRecord

  acts_as_list scope: :subject

  belongs_to :subject, optional: false
  has_many :sections
  has_and_belongs_to_many :admin_users

  scope :visible, lambda { where(visible: true) }
  scope :invisible, lambda { where(visible: false) }
  scope :sorted, lambda { order('position ASC') }
  scope :newest_first, lambda { order('created_at DESC') }

  validates :name, presence: true,
                   length: { maximum: 255 }
  validates :permalink, presence: true,
                        length: { within: 3..255 },
                        uniqueness: true

  validate :image_size_validation

  mount_uploader :image, ImageUploader

  private

  def image_size_validation
    errors[:image] << 'should be less than 500KB' if image.size > 0.5.megabytes
  end

end
