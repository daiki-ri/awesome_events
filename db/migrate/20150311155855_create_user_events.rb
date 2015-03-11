class CreateUserEvents < ActiveRecord::Migration
  def change
    create_table :user_events do |t|
      t.references :user, index: true
      t.references :event, index: true, null: false
      t.string :comment

      t.timestamps
    end
  end
end