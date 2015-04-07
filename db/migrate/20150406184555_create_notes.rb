class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :topic
      t.text :title
      t.text :snippet
      t.text :snippet_note
      t.string :category

      t.timestamps null: false
    end
  end
end
