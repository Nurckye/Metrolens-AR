# Metrolens AR
![](https://github.com/Nurckye/MetrolensAR/blob/master/gh-assets/logo.png) 

## A visualizer for the world around you - AlgoExpert 2020 Summer-Fall Contest



Metrolens AR is a native IOS application written using SwiftUI and Combine framework that aims to help people travelling or commuting discover their city in an AR environment. 

My goal for this application was to allow the users to easily navigate the city they want to explore, with a simple and intuitive UI/UX experience by harnessing the native power of ARKit.



Map Screen           |  AR Screen       |                Discover Screen
:-------------------------:|:-------------------------: | :-------------------------
![](https://github.com/Nurckye/MetrolensAR/blob/master/gh-assets/IMG_0094.PNG)  |  ![](https://github.com/Nurckye/MetrolensAR/blob/master/gh-assets/IMG_0097.PNG) | ![](https://github.com/Nurckye/MetrolensAR/blob/master/gh-assets/IMG_0095.PNG)

## Backend
<img align="right" width="300" height="532" src="https://github.com/Nurckye/Metrolens-AR/blob/master/gh-assets/metrolens-small.gif" />

The content is served using a Django/ GraphQL API. The repository for the backend infrastructure can be found here: 

https://github.com/Nurckye/MetrolensAR-GraphQL-API

## Requirements
Building the project requires the latest version of XCode as well as the latest IOS or IPadOS version (14 or above) and CocoaPods.

[Imgur](https://imgur.com/5YXkpBV)
## Functionalities & Features

* Full native dark mode / light mode support
* Current location tracking
* Posibility to like, share and view stats for a certain location
* Caching results to reduce data usage (for traveling abroad)
* Intuitive layout based mostly on vertical finger swipes and reachability
* Hardware-oriented (gyroscope, accelerometer, GPS) AR vision tracking for increased precision regardless the lighting conditions 

Statistics Screen (Dark Mode)           |  Location Details Screen (Dark Mode)      | AR Screen
:-------------------------: | :-------------------------: | :-------------------------
![](https://github.com/Nurckye/MetrolensAR/blob/master/gh-assets/IMG_0100.PNG)  |  ![](https://github.com/Nurckye/MetrolensAR/blob/master/gh-assets/IMG_0103.PNG) |  ![](https://github.com/Nurckye/MetrolensAR/blob/master/gh-assets/IMG_0098.PNG) 

