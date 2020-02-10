class CreateProfiles < ActiveRecord::Migration[5.0]

	def change
		create_table :profiles do |t|
			t.integer :customer_id
			t.integer :game_id
			t.datetime :time
			t.text :review
		end
	end
end