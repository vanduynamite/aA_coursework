# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Session.destroy_all
Band.destroy_all
Album.destroy_all
Track.destroy_all
Note.destroy_all

# User
u1 = User.create!(email: 'paul', password: 'starwars')
u2 = User.create!(email: 'audrey', password: 'starwars')

# Band
b1 = Band.create!(name: 'Blind Guardian', user: u1)
b2 = Band.create!(name: 'Witherfall', user: u1)
b3 = Band.create!(name: 'Khemmis', user: u1)
b4 = Band.create!(name: 'Dan Cray Trio', user: u2)
b5 = Band.create!(name: 'Nine Inch Nails', user: u2)

# Album
a1 = b1.albums.create!(name: 'Nightfall' , user: u1, year: 1998 , recording_style: 'Studio')
a2 = b1.albums.create!(name: 'At the Edge of Time', user: u2, year: 2010, recording_style: 'Studio')
a3 = b1.albums.create!(name: 'Beyond the Red Mirror', user: u1, year: 2015 , recording_style: 'Studio')
a4 = b2.albums.create!(name: 'Noctures and Requiems', user: u1, year: 2017 , recording_style: 'Studio')
a5 = b3.albums.create!(name: 'Hunted', user: u1, year: 2016, recording_style: 'Studio')
a6 = b3.albums.create!(name: 'Desolation', user: u1, year: 2018, recording_style: 'Studio')
a7 = b4.albums.create!(name: 'Save US', user: u2, year: 2005, recording_style: 'Studio')
a8 = b5.albums.create!(name: 'The Downward Spiral', user: u2, year: 1994, recording_style: 'Studio')
a9 = b5.albums.create!(name: 'And All That Could Have Been', user: u1, year: 2002, recording_style: 'Live')
a10 = b5.albums.create!(name: 'The Fragile', user: u1, year: 1999, recording_style: 'Studio')
albums = [a1, a2, a3, a4, a5, a6, a7, a8, a9, a10]

# Track
lyrics = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
(1..12).each do |i|
  albums.each do |album|
    name = album.name + ", track #{i}"
    type = i < 11 ? "Standard" : "Bonus"
    album.tracks.create!(name: name, track_type: type, lyrics: lyrics, ord: i, user: [u1, u2].sample)
  end
end
# # Note
# note1 = track1.notes.create!(user: fred, content: 'It\'s better that way')
# note2 = track1.notes.create!(user: daniel, content: 'Can you add some spacing here?')
