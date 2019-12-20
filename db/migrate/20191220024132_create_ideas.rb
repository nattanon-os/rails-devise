class CreateIdeas < ActiveRecord::Migration[6.0]
  def change
    create_table :ideas do |t|
      t.string :t1
      t.string :t2

      t.timestamps
    end
  end
end
