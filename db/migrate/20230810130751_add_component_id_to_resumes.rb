class AddComponentIdToResumes < ActiveRecord::Migration[7.0]
  def change
    add_column :resumes, :component_serial, :integer
    add_index :resumes, :component_serial, unique: true
  end
end
