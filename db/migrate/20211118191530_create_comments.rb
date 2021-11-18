class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :content
      t.bigint  :parent_id
      t.string  :parent_type

      t.timestamps
    end

    add_index :comments, [:parent_type, :parent_id]
  end
end
