class CreateCurrencies < ActiveRecord::Migration
  def change
    create_table :currencies do |t|
      t.string :country
      t.string :code
      t.string :symbol
      t.decimal :value
      t.datetime :last_updated

      t.timestamps
    end
  end
end
