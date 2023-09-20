require 'csv'

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

puts "#{Property.count} properties were saved."