class CreateSwipes < ActiveRecord::Migration[7.2]
  def change
    create_table :swipes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :swiped_user, null: false
      t.boolean :liked_back

      t.timestamps
    end

    add_foreign_key :swipes, :users, column: :swiped_user_id
  end
end
