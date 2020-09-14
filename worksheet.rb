########################################################
# Step 1: Establish the layers

# In this section of the file, as a series of comments,
# create a list of the layers you identify.
# Which layers are nested in each other?

  # The driver ids are nested in a Hash. 
  # Trip information is nested in an array for each driver ID. 
  # Each trip is nested within a hash inside of an array for each driver. 

# Which layers of data "have" within it a different layer?

#   The outermost layer, is the drivers hash and within it, the hash has two layers. 
#   ARRAY layer : stores information for each trip.
#   HASH layer:  stores details of those trips; rider id, date, cost and rating. 
    
#   Inner layer, the trip information for each driver is stored in an array and that array has one layer.
#   HASH layer: stores details of individual trips 

#   The innermost layer is the hash layer storing the details of each individual trip.
    
# Which layers are "next" to each other?

#   The outermost drivers layer is a HASH, which is next to the trips ARRAY, which is next to the trip details HASH.


########################################################
# Step 2: Assign a data structure to each layer

# Copy your list from above, and in this section
# determine what data structure each layer should have

# The outermost layer is a HASH. This will store each drivers ID as the key, with trip information as its value.
# Inner layer is an ARRAY. This will store all of the trips that specific driver has made. 
# Innermost layer is a HASH. This will store the details of each trip; rider ID, date, cost, and rating. 

########################################################
# Step 3: Make the data structure!

# Setup the entire data structure:
# based off of the notes you have above, create the
# and manually write in data presented in rides.csv
# You should be copying and pasting the literal data
# into this data structure, such as "DR0004"
# and "3rd Feb 2016" and "RD0022"

drivers = {

    DR0001: [
         {
            rider_id: "RD0003",
            date: "3rd Feb 2016",
            cost: 10,
            rating: 3
        },
        {
            rider_id: "RD0015",
            date: "3rd Feb 2016",
            cost: 30,
            rating: 4
        },
        {
            rider_id: "RD0003",
            date: "5th Feb 2016",
            cost: 45,
            rating: 2
        },

  ],

    DR0002: [
         {
            rider_id: "RD0073",
            date: "3rd Feb 2016",
            cost: 25,
            rating: 5
        },
        {
            rider_id: "RD0003",
            date: "4th Feb 2016",
            cost: 15,
            rating: 1
        },
        {
            rider_id: "RD0003",
            date: "5th Feb 2016",
            cost: 35,
            rating: 3
          },
    ],

    DDR0003: [
        {
            rider_id: "RD0066",
            date: "4th Feb 2016",
            cost: 5,
            rating: 5
        },
        {
            rider_id: "RD0003",
            date: "5th Feb 2016",
            cost: 50,
            rating: 2
        },
    ],

    DR0004: [
        {
            rider_id: "RD0022", 
            date: "3rd Feb 2016",
            cost: 5,
            rating: 5
        },
        {
            rider_id: "RD0022",
            date: "4th Feb 2016",
            cost: 10,
            rating: 4
        },
        {
            rider_id: "RD0073",
            date: "5th Feb 2016",
            cost: 20,
            rating: 5
        }
    ]
  }



########################################################
# Step 4: Total Driver's Earnings and Number of Rides

# Use an iteration blocks to print the following answers:
# - the number of rides each driver has given

drivers.each do |driver, trips|
  puts "#{driver}: #{trips.length}"
end

# - the total amount of money each driver has made

total_earned = []
drivers.each do |driver, trips|
  total_costs = trips.sum do |item| 
      item[:cost]
  end
  total_earned << {driver => total_costs}
end

puts total_earned

# - the average rating for each driver

avg_ratings = []
drivers.each do |driver, trips|
 total_rating = trips.sum do |item|
    item[:rating]  
 end
  avg = total_rating/trips.length
  avg_ratings << {driver => avg}
end

puts avg_ratings

# - Which driver made the most money?

max_money = 0 
max_driver = nil
total_earned.each do |item|
     item.each do |driver, money|
        if money > max_money
          max_money = money
          max_driver = driver
        end
     end
end
puts "\nMost money, #{max_driver}: #{max_money}"

# - Which driver has the highest average rating?

max_rating = 0 
max_driver = nil
avg_ratings.each do |item|
     item.each do |driver, rating|
        if rating > max_rating
          max_rating = rating
          max_driver = driver
        end
     end
end

puts "\nMax Rating, #{max_driver}: #{max_rating}"
