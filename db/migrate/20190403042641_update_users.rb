class UpdateUsers < ActiveRecord::Migration[5.2]
  	def change
 		@user = User.find_by( email: 'admin@barbersonrails.rb' )
		@user.update_attribute :admin, true
 	end
end
