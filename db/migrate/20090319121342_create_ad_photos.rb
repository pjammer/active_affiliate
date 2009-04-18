class CreateAdPhotos < ActiveRecord::Migration
  def self.up
    create_table :ad_photos do |t|
      t.string :name
      t.text :description
      t.integer :user_id
      t.string :content_type
      t.string :filename
      t.integer :size
      t.integer :parent_id
      t.string :thumbnail
      t.integer :width
      t.integer :height

      t.timestamps
    end
  end

  def self.down
    drop_table :ad_photos
  end
end
