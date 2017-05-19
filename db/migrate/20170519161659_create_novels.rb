class CreateNovels < ActiveRecord::Migration
  def change
    create_table :novels do |t|
      t.string :title
      t.references :author, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
