class CreateGlossaries < ActiveRecord::Migration
  def change
    create_table :glossaries do |t|
      t.string :en
      t.string :ja
      t.string :explanation_ja
      t.string :example_en
      t.string :example_ja
      t.integer :level

      t.timestamps
    end
  end
end
