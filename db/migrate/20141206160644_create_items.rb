class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.text :name
      t.boolean :completed, default: false

      t.timestamps
    end
  end
end
