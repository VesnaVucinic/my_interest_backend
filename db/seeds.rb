# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
vesna = User.create(name: "Vesna", email: "vesna@vesna.com", password: "vv")
vesna_shih_tzu = Board.create(name: "Shih Tzu", user_id: vesna.id)
Pin.create(name: "My Masha", description: "She waits patiently for me to finish the job and pay attention to her.", image_url: "https://www.pinterest.co.uk/pin/690458186616251506/", user_id: vesna.id, board_id: vesna_shih_tzu.id )
