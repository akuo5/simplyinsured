# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

CSV.foreach("db/seeds/regions.csv") do |row|
  Zip.create(
      :zip_code => row[0],
      :region => row[1]
  )
end
puts "regions.csv saved"

CSV.foreach("db/seeds/prices.csv") do |row|
  Insurance.create(
      :carrier => row[0],
      :plan => row[1],
      :region => row[2],
      :age => row[3],
      :monthly_premium => row[4]
  )
end
puts "prices.csv saved"