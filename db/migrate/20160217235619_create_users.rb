class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :past_courses, array: true, default: []
      t.string :address
      t.integer :friend_ids, array: true, default: []
      t.string :current_courses, array: true, default: []
      t.string :password

      t.timestamps null: false
    end
  end
end
