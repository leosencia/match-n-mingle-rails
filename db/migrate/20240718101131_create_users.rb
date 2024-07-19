class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :fname
      t.string :lname
      t.string :number
      t.string :email
      t.date :birthdate
      t.string :gender
      t.string :sexual_orientation
      t.string :gender_interest
      t.string :location_country
      t.string :location_region
      t.string :location_city
      t.string :school
      t.text :bio

      t.timestamps
    end
  end
end
