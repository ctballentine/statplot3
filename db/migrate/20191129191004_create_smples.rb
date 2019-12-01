class CreateSmples < ActiveRecord::Migration[5.1]
  def change
    create_table :smples do |t|
      t.float :par1
      t.float :par2
      t.string :grp

      t.timestamps
    end
  end
end
