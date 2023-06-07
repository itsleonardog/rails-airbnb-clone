# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts 'Cleaning database...'
Accommodation.destroy_all

puts 'Creating users...'
user = User.find_or_create_by!(email: 'leonardog9420@gmail.com') do |u|
  u.password = '123456'
  u.first_name = 'Leonardo'
  u.last_name = 'Genzolini'
end

puts 'Creating accommodations...'
DEFAULT_IMAGE_URLS = [
  'https://plus.unsplash.com/premium_photo-1685133855557-312db44ef398?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80',
  'https://images.unsplash.com/photo-1487695652027-48e475bfa86f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=928&q=80',
  'https://images.unsplash.com/photo-1499916078039-922301b0eb9b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1180&q=80',
  'https://images.unsplash.com/photo-1522444195799-478538b28823?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80',
  'https://images.unsplash.com/photo-1590725121839-892b458a74fe?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80',
  'https://images.unsplash.com/photo-1481277542470-605612bd2d61?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1612&q=80',
  'https://images.unsplash.com/photo-1501685532562-aa6846b14a0e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80',
  'https://images.unsplash.com/photo-1611270478701-e5b9e0c91890?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1772&q=80',
  'https://images.unsplash.com/photo-1484101403633-562f891dc89a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1774&q=80',
  'https://images.unsplash.com/photo-1535057091038-4602e2fa7a9e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80',
  'https://images.unsplash.com/photo-1572455825634-2c63e14ecae1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1771&q=80',
  'https://images.unsplash.com/photo-1505691938895-1758d7feb511?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80',
  'https://images.unsplash.com/photo-1499696010180-025ef6e1a8f9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80',
  'https://images.unsplash.com/photo-1560448204-61dc36dc98c8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80',
  'https://images.unsplash.com/photo-1623625433656-76f7e1450acb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1771&q=80',
  'https://images.unsplash.com/photo-1623625433656-76f7e1450acb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1771&q=80',
  'https://images.unsplash.com/photo-1587397070584-40a87629cbd4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2940&q=80',
  'https://plus.unsplash.com/premium_photo-1685133856025-c5b8383c92e3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80',
  'https://images.unsplash.com/photo-1560185127-6ed189bf02f4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80',
  'https://images.unsplash.com/photo-1507392671925-cbcf789b478d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80',
  'https://images.unsplash.com/photo-1626788570296-a6565dbf19b4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1776&q=80',
  'https://images.unsplash.com/photo-1585261818192-d12b279f8fea?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80',
  'https://images.unsplash.com/photo-1618348411563-37c0912c4ef5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80',
  'https://images.unsplash.com/photo-1515362655824-9a74989f318e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80',
  'https://images.unsplash.com/photo-1518108621213-2be030acb267?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80',
  'https://images.unsplash.com/photo-1465301055284-72f355cfd745?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1606&q=80',
  'https://images.unsplash.com/photo-1614447912160-845ac06c70cb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1772&q=80',
  'https://images.unsplash.com/photo-1626788570217-79607ba88bed?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1776&q=80',
  'https://images.unsplash.com/photo-1565776315946-cef8cc94f64f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80',
  'https://images.unsplash.com/photo-1549416878-ceda3534842b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80',
  'https://images.unsplash.com/photo-1505692669090-784ff0594d2e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1554&q=80',
  'https://plus.unsplash.com/premium_photo-1685133856065-a32643cc56d0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80',
  'https://images.unsplash.com/photo-1619992525255-3bed3879b0d6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80',
  'https://images.unsplash.com/photo-1635696860867-238c2fa072bb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80',
  'https://images.unsplash.com/photo-1503278501277-e50457741130?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80',
  'https://images.unsplash.com/photo-1593053272490-e0ed6d6a42c5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80',
  'https://images.unsplash.com/photo-1519643381401-22c77e60520e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1773&q=80',
  'https://images.unsplash.com/photo-1567354443053-78ca1917b020?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1767&q=80',
  'https://images.unsplash.com/photo-1653971858625-9cb23d0dca80?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2064&q=80',
  'https://images.unsplash.com/photo-1634849662801-a00d83441092?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80',
  'https://images.unsplash.com/photo-1643233948547-b0fbb4368089?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1771&q=80',
  'https://images.unsplash.com/photo-1626788570260-31451f5d6982?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1776&q=80',
  'https://images.unsplash.com/photo-1660805298295-e08398558258?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80',
  'https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1560&q=80',
  'https://images.unsplash.com/photo-1533090161767-e6ffed986c88?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1769&q=80',
  'https://images.unsplash.com/photo-1493663284031-b7e3aefcae8e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80',
  'https://images.unsplash.com/photo-1676662231670-083af7a6bace?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1773&q=80',
  'https://images.unsplash.com/photo-1676661647337-1036036e1d5e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1766&q=80',
  'https://images.unsplash.com/photo-1665893986240-54c8a6803de5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80',
  'https://images.unsplash.com/photo-1530734218972-25a9391ccd8b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80'
]

accommodation = Accommodation.create!(
  name: "Accommodation in #{Faker::Address.city}",
  address: "Tokyo",
  rating: rand(1..5),
  default_image_url: DEFAULT_IMAGE_URLS.sample,
  user_id: user.id
)
puts "Accommodation with id: #{accommodation.id} has been created"

accommodation = Accommodation.create!(
  name: "Accommodation in #{Faker::Address.city}",
  address: "Osaka",
  rating: rand(1..5),
  default_image_url: DEFAULT_IMAGE_URLS.sample,
  user_id: user.id
)
puts "Accommodation with id: #{accommodation.id} has been created"

accommodation = Accommodation.create!(
  name: "Accommodation in #{Faker::Address.city}",
  address: "Perugia",
  rating: rand(1..5),
  default_image_url: DEFAULT_IMAGE_URLS.sample,
  user_id: user.id
)
puts "Accommodation with id: #{accommodation.id} has been created"

accommodation = Accommodation.create!(
  name: "Accommodation in #{Faker::Address.city}",
  address: "Lugano",
  rating: rand(1..5),
  default_image_url: DEFAULT_IMAGE_URLS.sample,
  user_id: user.id
)
puts "Accommodation with id: #{accommodation.id} has been created"

accommodation = Accommodation.create!(
  name: "Accommodation in #{Faker::Address.city}",
  address: "Heidelberg",
  rating: rand(1..5),
  default_image_url: DEFAULT_IMAGE_URLS.sample,
  user_id: user.id
)
puts "Accommodation with id: #{accommodation.id} has been created"

accommodation = Accommodation.create!(
  name: "Accommodation in #{Faker::Address.city}",
  address: "Torrette di Fano",
  rating: rand(1..5),
  default_image_url: DEFAULT_IMAGE_URLS.sample,
  user_id: user.id
)
puts "Accommodation with id: #{accommodation.id} has been created"

accommodation = Accommodation.create!(
  name: "Accommodation in #{Faker::Address.city}",
  address: "Tarpon Springs",
  rating: rand(1..5),
  default_image_url: DEFAULT_IMAGE_URLS.sample,
  user_id: user.id
)
puts "Accommodation with id: #{accommodation.id} has been created"

accommodation = Accommodation.create!(
  name: "Accommodation in #{Faker::Address.city}",
  address: "Milwaukee",
  rating: rand(1..5),
  default_image_url: DEFAULT_IMAGE_URLS.sample,
  user_id: user.id
)
puts "Accommodation with id: #{accommodation.id} has been created"

accommodation = Accommodation.create!(
  name: "Accommodation in #{Faker::Address.city}",
  address: "Okinawa",
  rating: rand(1..5),
  default_image_url: DEFAULT_IMAGE_URLS.sample,
  user_id: user.id
)
puts "Accommodation with id: #{accommodation.id} has been created"

accommodation = Accommodation.create!(
  name: "Accommodation in #{Faker::Address.city}",
  address: "Talamone",
  rating: rand(1..5),
  default_image_url: DEFAULT_IMAGE_URLS.sample,
  user_id: user.id
)
puts "Accommodation with id: #{accommodation.id} has been created"

accommodation = Accommodation.create!(
  name: "Accommodation in #{Faker::Address.city}",
  address: "Albinia",
  rating: rand(1..5),
  default_image_url: DEFAULT_IMAGE_URLS.sample,
  user_id: user.id
)
puts "Accommodation with id: #{accommodation.id} has been created"

image_url = DEFAULT_IMAGE_URLS.sample
accommodation.photos.attach(io: URI.open(image_url), filename: File.basename(URI.parse(image_url).path), content_type: 'image/jpeg')

puts 'Finished!'
