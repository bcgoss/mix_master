class CreateArtist < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.string :image_path
      t.timestamps null:false
    end
  end
end
