class AddAudioToSections < ActiveRecord::Migration[5.0]
  def change
    add_column :sections, :audio, :string
  end
end
