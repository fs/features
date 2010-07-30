role = Role.create(:name => 'admin')
user = User.create(:full_name => 'Admin', :email => 'admin@example.com', :password => '123456')
user.roles << role