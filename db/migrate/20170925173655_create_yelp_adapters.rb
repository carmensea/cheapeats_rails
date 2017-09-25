class CreateYelpAdapters < ActiveRecord::Migration[5.1]
  def change
    create_table :yelp_adapters do |t|

      t.timestamps
    end
  end
end
