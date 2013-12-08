class CreateCombatStats < ActiveRecord::Migration
  def up
    create_table :combat_stats do |t|
      t.string :target
      t.string :source
      t.string :outcome
      t.string :duration
      t.string :base
      t.string :total
      t.string :base
      t.string :defense
      t.string :cy
      t.string :df
      t.string :cc
      t.string :rt
      t.string :base_rt
      t.string :infantry_rt
      t.string :vehicle_rt
      t.string :aircraft_rt

      t.timestamps
    end
  end

  def down
    drop_table :combat_stats
  end
end
