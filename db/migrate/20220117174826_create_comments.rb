class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :text

      t.timestamps 
      t.references :author, foreign_key: { to_table: 'users' } 
      t.references :post, foreign_key: true 
    end
  
  end
end
