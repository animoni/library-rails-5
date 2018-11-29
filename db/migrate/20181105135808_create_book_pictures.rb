class CreateBookPictures < ActiveRecord::Migration[5.2]
  def change
    create_table :book_pictures do |t|
      t.references :book, foreign_key: true
      t.string :picureone
      t.string :picturetwo
      t.string :picturethree

      t.timestamps
    end
  end
end
