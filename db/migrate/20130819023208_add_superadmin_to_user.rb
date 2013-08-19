class AddSuperadminToUser < ActiveRecord::Migration
  def up
    add_column :users, :superadmin, :boolean, 
                                    :null => false, 
                                    :default => false 
    User.create! do |r|
      r.email      = 'caribebr@hotmail.com'
      r.password   = 'password'
      r.superadmin = true
    end
    User.create! do |r|
      r.email      = 'browne_kevin@hotmail.com'
      r.password   = 'password'
      r.superadmin = true
    end
	end

  def down
    remove_column :users, :superadmin
    User.find_by_email('caribebr@hotmail.com').try(:delete)
    User.find_by_email('browne_kevin@hotmail.com').try(:delete)
  end
end
