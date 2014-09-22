class AddColumnLinkedInUrl < ActiveRecord::Migration
  def change
    add_column :students, :linked_in_url, :string
  end
end
