namespace :db do
	desc "Fill database with proper data"
	task populate: :environment do
		Role.create!(name: 'Admin')
		Role.create!(name: 'User')
	end
end