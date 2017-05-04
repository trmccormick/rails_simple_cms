class AddThumbnailImageToSections < ActiveRecord::Migration[5.0]
  def up
    add_column 'sections', 'filename', :string
    add_column 'sections', 'image_type', :string
    # long blob
    add_column 'sections', 'file_contents', :binary, limit: 16_777_215
  end

  def down
    remove_column 'sections', 'file_contents'
    remove_column 'sections', 'image_type'
    remove_column 'sections', 'filename'
  end
end
