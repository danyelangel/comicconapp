class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :subtitle
      t.attachment :photo
      t.text :content
      t.string :link
      t.datetime :date

      t.timestamps null: false
    end
  end
end
