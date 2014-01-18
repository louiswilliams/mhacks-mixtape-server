class AddAnonymousToVote < ActiveRecord::Migration
  def change
    add_column :votes, :anonymous, :string
  end
end
