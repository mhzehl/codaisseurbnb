# Booking.delete_all
Photo.delete_all
Theme.destroy_all
# Room.delete_all
User.destroy_all

# Themes
modern_and_minimal = Theme.create(name: "Modern and Minimal")
sleek_and_sophisticated = Theme.create(name: "Sleek and Sophisticated")
warm_and_cozy = Theme.create(name: "Warm and Cozy")
room_with_a_view = Theme.create(name: "Room with a View")
elegant_and_ornate = Theme.create(name: "Elegant and Ornate")
a_mans_touch = Theme.create(name: "A Man's Touch")
white_washed = Theme.create(name: "White Washed")
tempting_terrace = Theme.create(name: "Tempting Terrace")

# Users
miriam = User.create(email: "miriam@codaisseurbnb.com", password: "abcd1234")
wouter = User.create(email: "wouter@codaisseurbnb.com", password: "abcd1234")
matt = User.create(email: "matt@codaisseurbnb.com", password: "abcd1234")

# Photos
photo1 = Photo.create(remote_image_url: "http://res.cloudinary.com/dyl4vtost/image/upload/v1484830383/c8d1dafba9abdaba2b90367f4c070222_fxqxoo.jpg")
photo2 = Photo.create(remote_image_url: "http://res.cloudinary.com/dyl4vtost/image/upload/v1484830372/6463e899f8435574715e7c9f0337b118_pagmee.jpg")
photo3 = Photo.create(remote_image_url: "http://res.cloudinary.com/dyl4vtost/image/upload/v1484830355/8e145e968a53725a5862cb39b165e811_noddsf.jpg")

photo4 = Photo.create(remote_image_url: "http://res.cloudinary.com/dyl4vtost/image/upload/v1484829830/251c4d0b7285eaff7979449843b1808c_ydwd0m.jpg")
photo5 = Photo.create(remote_image_url: "http://res.cloudinary.com/dyl4vtost/image/upload/v1484829800/old-doors-and-shutters-are-perfect-objects-to-decorate-in-a-shabby-chic-living-room_peca4j.jpg")
photo6 = Photo.create(remote_image_url: "http://res.cloudinary.com/dyl4vtost/image/upload/v1484829771/colorful-shabby-chic-rooms-are-less-popular-but-looks-good-too_gtc4jz.jpg")

photo7 = Photo.create(remote_image_url: "http://res.cloudinary.com/dyl4vtost/image/upload/v1484829741/c7beb487b2b54736cfcb842d02463724_fnykgv.jpg")
photo8 = Photo.create(remote_image_url: "http://res.cloudinary.com/dyl4vtost/image/upload/v1484829603/20140312104142_803_2_phgchz.jpg")
photo9 = Photo.create(remote_image_url: "http://res.cloudinary.com/dyl4vtost/image/upload/v1484829581/04fe33b11ede8142bb8ee0baed9ffab3_v9lcs4.jpg")

# Rooms
room1 = Room.create(home_type: "House", room_type: "Shared", accommodate: 2, bedroom_count: 2, bathroom_count: 3, listing_name: "You will never forget your stay!", description: "Normcore meh put a bird on it man braid mumblecore, locavore synth swag kogi helvetica ugh health goth twee raw denim readymade.", address: "Colon 58, 1B, 11100 Cadiz (Spain)", has_tv: false, has_kitchen: true, has_airco: false, has_heating: false, has_internet: true, price: 100, active: true, user: miriam, themes: [modern_and_minimal, sleek_and_sophisticated], photos: [photo1, photo2, photo3])

room2 = Room.create(home_type: "House", room_type: "Shared", accommodate: 2, bedroom_count: 2, bathroom_count: 3, listing_name: "A place in the middle of Holland", description: "Freegan yuccie everyday carry tote bag you probably haven't heard of them godard.", address: "Daguerrestraat 23, 1054TG Utrecht (Netherlands)", has_tv: false, has_kitchen: true, has_airco: false, has_heating: false, has_internet: true, price: 100, active: true, user: wouter, themes: [warm_and_cozy, a_mans_touch], photos: [photo4, photo5, photo6])

room3 = Room.create(home_type: "House", room_type: "Shared", accommodate: 2, bedroom_count: 2, bathroom_count: 3, listing_name: "Great for a Weekend", description: "Meditation tattooed lumbersexual street art truffaut pour-over, kale chips pitchfork. Readymade snackwave man bun, photo booth tilde wolf occupy fashion axe VHS authentic PBR&B typewriter. Vape everyday carry meditation try-hard hammock unicorn.", address: "Tottenham Court Road 14, W1T 1JY London (UK)", has_tv: false, has_kitchen: true, has_airco: false, has_heating: false, has_internet: true, price: 100, active: true, user: matt, themes: [elegant_and_ornate, white_washed], photos: [photo7, photo8, photo9])

# Bookings

Booking.create(room: room1, user: wouter, price: 50, total: 100, starts_at: 10.days.from_now, ends_at: 12.days.from_now)
Booking.create(room: room1, user: matt, price: 50, total: 200, starts_at: 20.days.from_now, ends_at: 24.days.from_now)
