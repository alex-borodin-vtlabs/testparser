class CreatePages < ActiveRecord::Migration[5.0]
  def change
    create_table :pages do |t|
      t.string :page_url
      t.string :page_content

      t.timestamps
    end
  end
end
