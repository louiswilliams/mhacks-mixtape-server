class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :url
      t.references :playlist, index: true

      t.timestamps
    end
  end
end
