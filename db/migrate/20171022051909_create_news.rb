class CreateNews < ActiveRecord::Migration[5.0]
  def change
    create_table :news do |t|
      t.string :title
      t.text :url
      t.text :content
      t.text :thumbnail_url
      t.integer :news_site_id
      t.datetime :news_posted_at
      t.datetime :tweet_posted_at

      t.timestamps
    end
  end
end
