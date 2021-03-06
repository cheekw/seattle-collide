
# Project Proposal

### What is the overarching purpose of your research project, and why is it an important undertaking?

Victor: The overarching purpose of our research project is to predict the number of occurrences of collisions in Seattle at specific regions. Collisions are an important issue for both the Seattle population and government. Within the past 10 years approximately $2.6 billion of costs have accumulated due to collisions (9.4% fatality, 4.7% serious injury, 59.3% injury, 17.5% property damage, 8.8% possible injury). Exploring through the data can give insight on high traffic areas that do or do not have collisions and how they are affected by the weather, lighting, road conditions and city infrastructure. With information on potential time and regions of collisions, urban engineers can consider the cost/benefit of city planning, road repairs, and the the resource allocation for specific regions of a city. We are hoping this research will be useful in reducing costs and the number of collisions that occur in Seattle. 

### How does your research fit into the broader problem domain? You should cite at least 3 papers that help contextualize your research. 

Chad: Collisions are a large cause of not only fatality, but traffic backups as well as inconvenient repairs to auto or public property. As such, many ways of creatively leveraging existing data to predict around this issue have been attempted. 

Our team will focus on predicting counts of collisions, but other research teams have attempted to predict the [probability of accident occuring](http://urbcomp.ist.psu.edu/2017/papers/Predicting.pdf). A study by researchers from the University of Iowa aimed to predict whether an accident would occur or not, in a given hour for a given road segment. They fused many datasets on road, weather, traffic, and human factors as their features to predict on, and also incorporated the spatial structure of the road network. 

[Another venture in Las Vegas](https://apolitical.co/solution_article/las-vegas-forging-big-data-partnership-predict-traffic-accidents/) has taken this notion even further, by generating predictions for certain ‘high-risk areas’ prone to traffic accidents, and actually beginning to direct responders to these risk areas to make prevention and response more efficient. A pilot program of this approach was initiated by the the Israeli company, Waycare, has been shown to predict traffic accidents in advance with 70% accuracy. The team will pilot this approach in Las Vegas on two highways: the I-15 and US-95. These are two differing types of roadway, the former being a big (tourist) interstate, and the latter a commuter route.

Both of these studies have utilized historical data based on crash type, as well as other factors such as environmental or human. These types of data, while they can be real-time, do lack important other features that could also prove to be impactful in predictive analyses. A project close to home, as a [partnership between Microsoft, the UW and the City of Bellevue](https://bellevuewa.gov/UserFiles/Servers/Server_4779004/File/Transportation/Publications/video-analytics-toward-vision-zero-ITE-Journal-article-March-2017.pdf), aims to tackle the issue of more insightful data. They argue that predicting areas prone to traffic collisions based off of crash data, is missing a huge factor of detecting zones that can also lead to near-misses. There are many close calls that occur that will not be represented in logs of crash data, so they are employing a video-digitization mechanism to extract that data. Using streetlight and traffic cam data, they can create a picture of an intersection that tracks speed, direction and behaviour of various vehicle types (cars, buses, bicycles) in order to analyze this granular data encoding near-misses, starts & stops, as well as pedestrian behaviour. 

Doing our background research on what is going on in this field of predictive analytics excites us to a future where we may be able to understand traffic and accidents and hopefully make everyone's commute a bit safer and easier.

Sources:
- http://urbcomp.ist.psu.edu/2017/papers/Predicting.pdf
- https://apolitical.co/solution_article/las-vegas-forging-big-data-partnership-predict-traffic-accidents/
- https://bellevuewa.gov/UserFiles/Servers/Server_4779004/File/Transportation/Publications/video-analytics-toward-vision-zero-ITE-Journal-article-March-2017.pdf


### What specific hypothesis (hypotheses) are you going to test?

Chad: Can the number of collisions in a given location be predicted by the environmental and driver conditions surrounding that location?

### What are the datasets you'll be working with to answer this question? Please include relevant background describing the datasets you identify.

Victor: We will be working with data provided by the [Seattle Department of Transportation (SDOT)](https://www.seattle.gov/transportation). They host open data on the number of collisions incidents in Seattle since 2004, with different columns of data that are relevant to the incident such as location, longitude and latitude, road condition, collision type etc. There are about 203,190 rows and 40 columns of data at the time of writing. The summary of the data columns can be readily [found in a pdf from their website](https://www.seattle.gov/Documents/Departments/SDOT/GIS/Collisions_OD.pdf). The dataset is updated weekly so the number of rows may change throughout the course of the research.

### What statistical and machine learning methods do you plan on using to test your hypothesis?

Victor: We are not sure about the statistical and machine learning methods we plan on using to test our hypothesis yet. We may try to experiment and do more research on the methods that others have attempted before making any assumptions on the type of methods that would work best. One previous study on creating collision prediction models (CPM) seemed to categorize based on the different types of road intersections, in which the collision occurred. They state that: 

“historically, many researchers developed CPMs using conventional linear regression, but more recently it has been demonstrated that conventional linear regression models lack the distributional property to adequately describe collisions. This inadequacy is due to the random, discrete, non-negative, and typically sporadic nature that characterize the occurrence of a traffic collision.” 

The generalized linear regression modeling (GLM) has offered “the most appropriate and sound approach for developing collision prediction models.” They focused on the expectation of collisions, and the identification of collision prone zones. Due to the non-normal distribution error structure of the data, the approach chosen is usually Poisson or negative binomial. In their model they use the length of the segment (L in km) and the traffic volume (V given in AADT) as their independent variables, and expected collision frequency (per year or number of years) as their dependent variable.

Another research paper on macro-level CPM in Vancouver discusses that high collision zones were associated with higher vehicle kilometers travelled, estimating a nonlinear Poisson relationship for fatal and injury collisions. Other works similar to the first study, have discussed the number of intersections. The study in Vancouver also decided to use a negative binomial GLM, categorizing collisions into regions. This study had several categorized variables. Exposure: vehicle kilometers travelled, total km lanes, avg congestion lane, avg speed, total area. Sociodemographic: avg zonal family size, home density, zonal residents, population density, residents working in tourism, retail, government, and construction, workers per resident, umemployed workers in total labour force. Other categories included transportation demand management (TDM): describing characteristics of the demand for mobility–travel and network: describing the road network in each neighbourhood (traffic zone).

Another research paper decided to use a Poisson-lognormal model to predict the collision counts. There seems to be a good amount of literature in CPM, where these papers all often discuss based on the categories of property damage only (PDO) and injury and fatal (I + F). These incidents are possibly categorized and modeled seperateley because of the nature of how these incidents occur.

We may decide to train a GLM, but would also like to explore other predictive methods such as neural networks. According to one study, some researchers have suggested the use of Back-Propagation Neural Networks (BPNN) for CPM. The study seems to agree that a Bayesian Neural Network (BNN) can be appropriate for the prediction, outperforming the BPNN model. Explanatory variables includede were Length (mile), ADT (vpd), Right shoulder width (ft), and Lane width (ft).

Sources:
- http://www.th.gov.bc.ca/publications/eng_publications/safety/cpms_for_bc_2008.pdf
- http://www.nrcresearchpress.com/doi/pdf/10.1139/l06-013
- https://www.sciencedirect.com/science/article/pii/S0001457509000827
- https://www.sciencedirect.com/science/article/pii/S0001457507000073

### Who is your target audience for the resource you will build? Depending on the domain of your data, there may be a variety of audiences interested in using the dataset. You should hone in on one of these audiences.

Chad: As we will be predicting the number of collisions for locations, we believe our target audience will be those interested in understanding what areas lead to the most collisions. We think that this tool will be most useful for city planners to use as an exploratory tool to determine where they should focus their efforts. 

### What should your audience learn from your resource? Consider specific questions they may want to answer.

Chad: As we intend to allow the user to select different conditions (weather, light, road) that will affect the predicted collisions at a given location, we also believe this will give these planners strength to prioritize the many traffic projects these planners no doubt already have on their plate. If certain locations lead to more collisions during rain, they can know where to focus efforts before the rainy season occurs. If certain collisions happen more where the roads are in poor condition, they can know where to focus repaving projects.

### What will be the format of your final web resource (Shiny app, HTML page or slideshow compiled with KnitR, etc.)?

Chad: We intend to create a PowerBI visual dashboard that allows users to explore existing features of the dataset, as well as a map highlighting our predicted number of collisions. The dashboard will allow users to modify the predictions by selecting different road conditions, which will affect the heatmap.

Victor: Our formal report will be compiled into an HTML document. This will mostly be done on jupyter notebook.

### Do you anticipate any specific data collection / data management challenges?

Chad: Our starting dataset comes downloaded directly from the Seattle Department of Transportation, and includes data on weather, road and light conditions, as well as certain human factors such as speed and alcohol. We may want to bolster our analysis by adding on other features such as traffic surge or special event (football games, president in town, roadwork, etc.). We will have to develop ways to merge these together.

### What new technical skills will need to learn in order to complete your project?

Chad: Brainstorming here. New ML algorithms? PowerBI will be new to me, I’d like to learn from Zoshua.

### How will you conduct you analysis? Please include a detailed description of your intended modeling approach. 

Arsalan: One of the approach we will consider in our model is to start by placing labels (accident/no accident) to the hourly data which would help us simplify the dataframe. In order to predict the accident, there are several factors to consider such as temperature, hour of day, population density, wind speed etc. We will look at our data visualization to see the trends, and how well they correlate with the road accidents. Based on the observations, these factors will be used as input to the modeling technique we choose. For the model, the data will be divided into training set using pandas and some other python libraries.

Our first modelling approach will be creating Generalized Linear Model to predict the outcomes by adding the relevant variables in the model. We can also do forward/backward selection to find the most consistent variables for prediction.

The second modeling approach will utilize machine learning algorithms. Currently there two machine learning algorithms that we can use to predict the accidents:
First is Decision Trees which generates a decision tree from the training data to determine the best attribute in the dataset. Then recursively generates new trees by using the subset of the dataset until it reaches the point where data cannot be further classified.

The second algorithm is Deep Neural Networks that is designed to recognize patterns. Neural networks help us cluster and classify the data according to similarities contained in the input variables.

After successfully generating results of both the algorithms, we will validate the results on our validation data to check the accuracy of each algorithm. This will also help us pick the algorithm that predicts the best results based on the given data.

### What major challenges do you anticipate? 

Chad: Heterogeneity of locations seems to be the largest issue that we will face. In the University of Iowa study cited above, they describe this issue: “factors causing traffic accidents in large cities with dense population and lower speed limits might be very different from those in rural areas with low population density but high speed limit”. The main point of this is that factors such as weather, road and light conditions may not be sufficient enough to predict all of the variation of rare events such as collisions. We will likely need to develop other ways of adding metadata to our features, by merging in datasets such as neighborhood, streetlight, pedestrian data, etc. 
