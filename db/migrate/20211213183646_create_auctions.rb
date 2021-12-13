class CreateAuctions < ActiveRecord::Migration[6.1]
  def change
    create_table :auctions do |t|
      t.datetime :start
      t.datetime :end
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
