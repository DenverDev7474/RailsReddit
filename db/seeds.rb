require 'csv'

Property.delete_all

csv_text = File.read(Rails.root.join('db', 'properties.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  property = Property.new
  property.sold_date = row['sold_date']
  property.property_type = row['property_type']
  property.address = row['address']
  property.city = row['city']
  property.state = row['state']
  property.zip = row['zip']
  property.price = row['price']
  property.beds = row['beds']
  property.baths = row['baths']
  property.square_feet = row['square_feet']
  property.lot_size = row['lot_size']
  property.year_built = row['year_built']
  property.days_on_market = row['days_on_market']
  property.monthly_hoa = row['monthly_hoa']
  property.mls_number = row['mls_number']
  property.identifier = row['identifier']
  property.latitude = row['latitude']
  property.longitude = row['longitude']
  property.description = row['description']
  property.upvotes_count = row['upvotes_count'] || 0
  property.downvotes_count = row['downvotes_count'] || 0
  property.save!
end

20.times do
  User.create!(
    username: Faker::Internet.unique.username,
    email: Faker::Internet.unique.email
  )
end


property_ids = Property.pluck(:id)

# Fetching all user IDs
user_ids = User.pluck(:id)

# Generate a random number of comments for each property
property_ids.each do |property_id|
  rand(1..5).times do  # Generating 1 to 5 comments per property as an example
    Comment.create!(
      property_id: property_id,
      user_id: user_ids.sample,  # Randomly assign a user to the comment
      content: Faker::Lorem.paragraph(sentence_count: 2),  # Generate a 2-sentence comment
      upvotes_count: rand(0..100),  # Randomly assign upvotes between 0 to 100
      downvotes_count: rand(0..100)  # Randomly assign downvotes between 0 to 100
    )
  end
end

Comment.find_each do |comment|
  # Assigning a random subset of users to vote on this comment
  voters = user_ids.sample(rand(1..user_ids.size)) # Taking a random number of users to vote

  voters.each do |voter_id|
    Vote.create!(
      user_id: voter_id,
      votable_type: "Comment",
      votable_id: comment.id,
      value: [1, -1].sample  # Randomly assign either upvote (1) or downvote (-1)
    )
  end
end



Comment.find_each do |comment|
  # Assigning a random subset of users to vote on this comment
  voters = user_ids.sample(rand(1..user_ids.size)) # Taking a random number of users to vote

  voters.each do |voter_id|
    Vote.create!(
      user_id: voter_id,
      votable_type: "Comment",
      votable_id: comment.id,
      value: [1, -1].sample  # Randomly assign either upvote (1) or downvote (-1)
    )
  end
end



puts "There are now #{Property.count} rows in the properties table"
puts "There are now #{Comment.count} rows in the comments table"
puts "There are now #{Vote.count} rows in the votes table"
puts "There are now #{User.count} rows in the users table"

