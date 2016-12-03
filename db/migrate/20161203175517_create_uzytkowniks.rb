class CreateUzytkowniks < ActiveRecord::Migration
  def change
    create_table :uzytkowniks do |t|

      t.timestamps
    end
  end
end
