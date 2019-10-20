class CreateMoney < ActiveRecord::Migration[6.0]
  def change
    create_table :money do |t|
      t.string :type, null: false
      
      t.timestamps
    end
  end
end
