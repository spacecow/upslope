class AddDateToGlossary < ActiveRecord::Migration
  def change
    add_column :glossaries, :date, :date
  end
end
