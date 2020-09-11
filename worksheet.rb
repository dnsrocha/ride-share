########################################################
# Step 1: Establish the layers

# In this section of the file, as a series of comments,
# create a list of the layers you identify.
# Which layers are nested in each other?
# Which layers of data "have" within it a different layer?
# Which layers are "next" to each other?

########################################################
# Step 2: Assign a data structure to each layer

# Copy your list from above, and in this section
# determine what data structure each layer should have

########################################################
# Step 3: Make the data structure!

# Setup the entire data structure:
# based off of the notes you have above, create the
# and manually write in data presented in rides.csv
# You should be copying and pasting the literal data
# into this data structure, such as "DR0004"
# and "3rd Feb 2016" and "RD0022"

########################################################
# Step 4: Total Driver's Earnings and Number of Rides

# Use an iteration blocks to print the following answers:
# - the number of rides each driver has given
# - the total amount of money each driver has made
# - the average rating for each driver
# - Which driver made the most money?
# - Which driver has the highest average rating?
#

drivers = {"DR0001": {
    "3rd Feb 2016": [
        {cost: 10, rider_id: "RD0003", rating: 3},
        {cost: 30, rider_id: "RD0015", rating: 4}
    ],
    "5th Feb 2016": [
        {cost: 45, rider_id: "RD0003", rating: 2}
    ]
},
           "DR0002": {
               "3rd Feb 2016": [
                   {cost: 25, rider_id: "RD0073", rating: 5}
               ],
               "4th Feb 2016": [
                   {cost: 15, rider_id: "RD0013", rating: 1}
               ],
               "5th Feb 2016": [
                   {cost: 35, rider_id: "RD0066", rating: 3}
               ]
           },
           "DR0003": {
               "4th Feb 2016": [
                   {cost: 5, rider_id: "RD0066", rating: 5},
               ],
               "5th Feb 2016": [
                   {cost: 50, rider_id: "RD0003", rating: 2}
               ]
           },
           "DR0004": {
               "3rd Feb 2016": [
                   {cost: 5, rider_id: "RD0022", rating: 5}
               ],
               "4th Feb 2016": [
                   {cost: 10, rider_id: "RD0022", rating: 4}
               ],
               "5th Feb 2016": [
                   {cost: 20, rider_id: "RD0073", rating: 5}
               ]
           }
}

#The number of rides each driver has given
def rides(drivers)
  drivers.each do |driver, data|
    puts "\nDriver #{driver} has given:"
    data.each do |key, value|
      day = key
      rides_per_day = value.length
      if rides_per_day == 1
        puts "#{rides_per_day} ride on #{day}."
      else
        puts "#{rides_per_day} rides on #{day}."
      end
    end
  end
end

rides(drivers)

#The total amount of money each driver has made
def total_earnings(drivers)
  drivers.each do |driver, data|
    earnings = []
    print "Total earned by #{driver} was $"
    data.map do |day, rides|
      rides.each do |ride|
        earnings.push ride[:cost]
      end
    end
    print " #{earnings.sum}\n"
  end
end

puts "\n"
total_earnings(drivers)

#The average rating for each driver
def average_rating(drivers)
  drivers.each do |driver, data|
    average = []
    print "Driver #{driver} average rating: "
    data.map do |day, rides|
      rides.each do |ride|
        rates = []
        rates.push ride[:rating]
        average.push rates.sum
      end
    end
    printf("%.1f\n", average.sum.to_f / average.length)

  end
end

puts "\n"
average_rating(drivers)

#Which driver made the most money?
def richest(drivers)
  earnings = []
  drivers.each do |driver, data|
    total = []
    data.map do |day, rides|
      rides.each do |ride|
        total.push ride[:cost]
      end

    end
    earnings.push total.sum

  end
  print earnings.max
end

puts "\n"
richest(drivers)