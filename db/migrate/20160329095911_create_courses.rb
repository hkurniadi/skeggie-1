class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
			t.string :department
			t.string :coursenum
			t.string :semesters, array: true, default: []
			t.string :wqb
			
      t.timestamps null: false
    end
  end
end
