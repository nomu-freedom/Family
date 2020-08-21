class RemoveRoomFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_reference :users, :room, null: false
  end
end
