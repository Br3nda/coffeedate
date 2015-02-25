class CreateGroupingSets < ActiveRecord::Migration
  def change
    create_table :grouping_sets do |t|
      t.references :group, index: true
      t.integer :group_size
      t.string :title
      t.string :description
      t.integer :member_count

      t.timestamps
    end
  end
end
