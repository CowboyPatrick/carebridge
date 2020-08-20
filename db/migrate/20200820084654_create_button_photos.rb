class CreateButtonPhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :button_photos do |t|

      t.timestamps
    end
  end
end
