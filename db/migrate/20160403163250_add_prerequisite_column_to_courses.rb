class AddPrerequisiteColumnToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :Prerequisites, :string, array: true, default: []
  end
end
