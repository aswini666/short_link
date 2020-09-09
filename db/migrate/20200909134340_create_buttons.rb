class CreateButtons < ActiveRecord::Migration[6.0]
  def change
    create_table :buttons do |t|
      t.integer :clicks
      t.timestamps
    end
  end
end
