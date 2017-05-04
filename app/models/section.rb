class Section < ApplicationRecord

  acts_as_list scope: :page

  belongs_to :page
  has_many :section_edits
  has_many :admin_users, through: :section_edits

  # all the basic validations for this new record to be inserted
  validates :filename, presence: true
  validates :file_contents, presence: true
  validates :image_type, presence: true, format: { with: /[image\/]+(svg|png|gif|jpg|jpeg|svg\+xml)/i }
  validate :file_size_under_one_mb

  scope :visible, lambda { where(visible: true) }
  scope :invisible, lambda { where(visible: false) }
  scope :sorted, lambda { order('position ASC') }
  scope :newest_first, lambda { order('created_at DESC') }

  CONTENT_TYPES = %w[text HTML].freeze

  validates :name, presence: true,
                   length: { maximum: 255 }
  validates_inclusion_of :content_type, in: CONTENT_TYPES,
                                        message: "must be one of: #{CONTENT_TYPES.join(', ')}"
  validates_presence_of :content

  # initialize
  # ==================================================
  # Name : Tracy McCormick
  # Date : 11/28/2016
  #
  # Description:
  # Overrides the initizle function in ActiveRecord to gather file information
  # the file information is then stored in various instance name which relate
  # to the database.
  def initialize(params = {})
    @file = params.delete(:file)
    super
    if @file
      self.filename = sanitize_filename(@file.original_filename)
      self.image_type = @file.content_type
      self.file_contents = @file.read
    end
  end

  # update
  # ==================================================
  # Name : Tracy McCormick
  # Date : 11/28/2016
  #
  # Description:
  # Overrides the update function in ActiveRecord to gather file information
  # the file information
  def update(params = {})
    file = params.delete(:file)
    if file
      self.filename = sanitize_filename(file.original_filename)
      self.image_type = file.content_type
      self.file_contents = file.read
    end
    super
  end

  # base 64 encode
  # ==================================================
  # Name : Tracy McCormick
  # Date : 11/28/2016
  #
  # Description:
  # Returns a base 64 encoded string for displaying the images
  def base64_encode
    Base64.encode64(file_contents)
  end

  # file size under one mb
  # ==================================================
  # Name : Tracy McCormick
  # Date : 12/01/2016
  #
  # Description:
  # The File.basename function returns the last component of the filename given
  # in filename, which must be formed using forward slashes ('/') regardless of
  # the separator used on the local file system. If suffix is given and present
  # at the end of filename, it is removed.
  def sanitize_filename(filename)
    File.basename(filename)
  end

  # file size under one mb
  # ==================================================
  # Name : Tracy McCormick
  # Date : 12/01/2016
  #
  # Description:
  # Checks to see if the image file is less than one meg.
  # if it is over 1 mb the function will send a error message stating this
  # Otherwise it will return true if it is less than 1 mb.
  def file_size_under_one_mb
    num_bytes = 1_048_576
    if @file && @file.size.to_f > num_bytes
      errors.add(:file, 'File size cannot be over one megabyte.')
    end
    true
  end
end
