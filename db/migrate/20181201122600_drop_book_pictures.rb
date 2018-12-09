class DropBookPictures < ActiveRecord::Migration[5.2]
  def change
    drop_table "book_pictures"
    create_table "book_pictures", force: :cascade do |t|
      t.integer "book_id"
      t.string "picture"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["book_id"], name: "index_book_pictures_on_book_id"
    end
  end
end
