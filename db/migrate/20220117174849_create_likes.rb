class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.timestamps 
      t.references :author, foreign_key: { to_table: 'users' } 
      t.references :post, foreign_key: true
    end  
  end
end
