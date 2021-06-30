class CreatePostings < ActiveRecord::Migration[6.1]
  def change
    create_table :postings do |t|
      t.string :position
      t.decimal :salary
      t.string :description
      t.string :company

      t.timestamps
    end
  end
end
