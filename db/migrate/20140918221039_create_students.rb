class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :season
      t.integer :year
      t.string :email
      t.string :avatar
      t.string :current_location
      t.boolean :hireable
      t.string :github_username
      t.text :bio
      t.string :project
      t.string :html_url
    end
  end
end
