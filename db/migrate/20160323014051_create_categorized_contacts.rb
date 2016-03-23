class CreateCategorizedContacts < ActiveRecord::Migration
  def change
    create_table :categorized_contacts do |t|
      t.integer :category_id
      t.integer :contact_id

      t.timestamps null: false
    end
  end
end
