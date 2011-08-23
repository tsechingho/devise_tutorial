# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

Page.create!([
  { :title => 'Welcome' }, # site root
  { :title => 'Dashboard' }, # user root
  { :title => 'Management' }, # manager root
  { :title => 'About' },
  { :title => 'Help' },
  { :title => 'Privacy' },
  { :title => 'Copyright' },
  { :title => 'Terms of Service' }
])
