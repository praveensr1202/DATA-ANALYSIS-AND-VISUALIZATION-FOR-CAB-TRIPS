# DATA-ANALYSIS-AND-VISUALIZATION-FOR-CAB-TRIPS
data analysis and visualization done on Uber NYC dataset. Found the best coordinates at which Uber can locate its bases in NYC which can reduce the waiting time of its customers.


The demand for cabs at any time of the day in any month is huge. The base stations may not have enough number of drivers which can lead to cancellation of rides or delay in cabs reaching or dropping customers. This happens especially during the peak hours. The surge in cab demands also happens to ask for more number of cabs or the cabs to reach quicker to the one hiring it. Thus, it becomes important to station cab stations at such areas which maximise the avavilability and minimise the time to get a cab.
Target Identification: 
Our target audience are the cities’ traffic police and officers in charge of keeping the city pollution level low. We visualize for them how the most used service in the city -cab, is causing congestion at traffic signals. We provide them with visualized comparisons after comparing data of 6 months like: 
1. Number of cab trips everyday 
2. Number of cab trips per month 
3. Number of cab trips every hour in each month 
We intend to help the officers make decisions wise for the city and the world by analyzing and visualizing cab trip frequency that can be related to air pollution, which will impact all of us in the long run.


Visualization Tasks:
1. To plot cab trip usage by using different visualization techniques on an hourly, weekly 
and monthly basis. 
2. To determine the peaking hours of availed cabs in a day. 
3. To find the month with maximum cab utilization between April-September.


WHAT DO WE DERIVE USING K-MEANS ALGORITHM IN OUR DATASET:
Attributes involved in implementing K-MEANS CLUSTERING:
● Latitude of the pickup location
● Longitude of the pickup location
Uber can use the centroids of the clusters we have derived as their new base stations. Whenever Uber gets a new ride request from the customer, they can check the closeness of the pickup location (in terms of the location’s latitude and longitude values) against each centroids (denotes new base station) we obtained using K-MEANS CLUSTERING algorithm. Whichever base station is nearer, Uber can direct the vehicle from that particular base station to the customer location.
Uber has many drivers and offers services in many locations. If Uber knows the base station, and if they are getting a lot of ride requests from one particular base station in comparison with the other base stations, then uber can strategically place their drivers in better locations wherein their probability of receiving a ride request is higher. This will help Uber to serve their customers faster as vehicles are placed closer to the pickup location and also help to grow their business.
