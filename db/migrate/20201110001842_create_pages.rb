class CreatePages < ActiveRecord::Migration[6.0]
  def change
    create_table :pages do |t|
      t.integer :hits
      t.string :full_url
      t.string :short_url

      t.timestamps
    end
  end
end
