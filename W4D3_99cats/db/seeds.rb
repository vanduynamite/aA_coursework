# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Cat.destroy_all
CatRentalRequest.destroy_all

u1 = User.create!(username: 'Paul', password: 'starwars')
u2 = User.create!(username: 'Aaron', password: 'starwars')
u3 = User.create!(username: 'John', password: 'starwars')

c1 = Cat.create!(name: 'Rory', birth_date: '2013/07/01', user_id: u1.id,
  color: 'gray', sex: 'M', description: 'A noisy cat')
c2 = Cat.create!(name: 'Heidi', birth_date: '2011/05/01', user_id: u1.id,
  color: 'white', sex: 'F', description: 'A hidden cat')
c3 = Cat.create!(name: 'Momo', birth_date: '2015/07/07', user_id: u2.id,
  color: 'orange', sex: 'M', description: 'A hungry cat')
c4 = Cat.create!(name: 'Lily', birth_date: '2011/04/21', user_id: u3.id,
    color: 'black', sex: 'F', description: 'A spooky cat')

CatRentalRequest.create!(requester_id: u3.id,cat_id: c1.id, start_date: '2018/10/17', end_date: '2018/10/20', status: 'APPROVED')
CatRentalRequest.create!(requester_id: u3.id,cat_id: c2.id, start_date: '2018/10/21', end_date: '2018/10/30', status: 'PENDING')
CatRentalRequest.create!(requester_id: u3.id,cat_id: c3.id, start_date: '2018/10/16', end_date: '2018/10/20', status: 'DENIED')
CatRentalRequest.create!(requester_id: u3.id,cat_id: c1.id, start_date: '2018/10/23', end_date: '2018/10/28', status: 'PENDING')
