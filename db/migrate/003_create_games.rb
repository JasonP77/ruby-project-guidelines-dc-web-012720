class CreateGames < ActiveRecord::Migration[5.0]
	def change
		create_table :games do |t|
			t.string :name
			t.float :price
			t.float :rating
			t.string :category
			t.string :company
		end
	end
end