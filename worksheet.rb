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

#Q4
def richest(drivers)
  earnings = []
  drivers.each do |driver, data|
    total = []
    data.each do |day, rides|
      rides.each do |ride|
        total.push ride[:cost]
      end
    end
    earnings.push total.sum
    if total.sum == earnings.max
      puts "\nDriver #{driver} made the most money for the period."
    end
  end
end

#Q5
def best_rating(drivers)
  highest_average = []
  which_driver = []
  drivers.each do |driver, data|
    av_rates = []
    data.each do |day, rides|
      rides.each do |ride|
        av_rates.push ride[:rating]
      end
    end
    which_driver.push driver
    highest_average.push av_rates.sum.to_f / av_rates.length
  end
  if highest_average.include?(highest_average.max)
    who = highest_average.index(highest_average.max)
    puts "Driver #{which_driver[who]} has the highest average rating."
  end
end

#All questions answered
def ride_share(drivers)
  drivers.each do |driver, data|
    d1 = drivers[driver] #Q3
    earnings = [] # Q2
    cash = [] #Optional
    which_day = [] #Optional
    rides_num = []# Q1
    puts "\nDriver #{driver} summary:" #Q1

    data.each do |day, rides|
      rides_num.push rides.length
      total = []

      rides.each do |ride|
        earnings.push ride[:cost]
        total.push ride[:cost]
        rates = []
        rates.push ride[:rating]
      end

      cash.push total.sum
      which_day.push day
    end

    puts "*Total rides: #{rides_num.sum}" #Q1
    puts "*Total earnings: $#{earnings.sum}" #Q2

    #Q3
    ratings = d1.map {|k,v| v }.flatten.map {|x| x[:rating]}
    print "*Average rating: "
    printf("%.1f ", ratings.sum.to_f / ratings.length)

    if cash.include?(cash.max) #Optional
      where = cash.index(cash.max)
      puts "\n*Most profitable day: #{which_day[where]}."
    end
  end
  richest(drivers) #Q4
  best_rating(drivers)#Q5
end

ride_share(drivers)