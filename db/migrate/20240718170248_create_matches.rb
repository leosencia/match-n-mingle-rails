class CreateMatches < ActiveRecord::Migration[7.2]
  def change
    create_table :matches do |t|
      t.references :user, null: false, foreign_key: true
      t.references :matched_user, null: false

      t.timestamps
    end

    add_foreign_key :matches, :users, column: :matched_user_id
  end
end
