class CreateGroupings < ActiveRecord::Migration
  def change
    create_table :groupings do |t|
      t.references :grouping_set, index: true
      t.references :member1, index: true
      t.references :member2, index: true
      t.references :member3, index: true
      t.references :member4, index: true
      t.references :member5, index: true

      t.timestamps
    end
  end
end
