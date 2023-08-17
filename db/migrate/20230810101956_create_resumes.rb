class CreateResumes < ActiveRecord::Migration[7.0]
  def change
    create_table :resumes do |t|
      t.integer :block
      t.string :avatar
      t.text :basic_info
      t.string :social_links
      t.text :summary
      t.text :work_experience
      t.string :skills

      t.timestamps
    end
  end
end
