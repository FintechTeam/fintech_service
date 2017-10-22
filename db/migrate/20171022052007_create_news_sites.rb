class CreateNewsSites < ActiveRecord::Migration[5.0]
  def change
    create_table :news_sites do |t|
      t.string :site_name
      t.string :url
      t.string :api_url

      t.timestamps
    end
  end
end
