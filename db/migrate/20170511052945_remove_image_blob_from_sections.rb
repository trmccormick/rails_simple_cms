class RemoveImageBlobFromSections < ActiveRecord::Migration[5.0]
  def change
    remove_column 'sections', 'file_contents'
    remove_column 'sections', 'image_type'
    remove_column 'sections', 'filename'
  end
end
