# Blood Glucose Monitoring App

A Flutter mobile app which displays blood glucose level over time in a line chart which are retrieved from a external api.

## Getting Started

Make sure flutter is installed : https://flutter.dev/docs/get-started/install

## Install

    $ git clone https://github.com/mkappworks/bloodglucose_monitoring_flutterapp.git
    $ cd bloodglucose_monitoring_flutterapp
    $ flutter pub get

## Running the project

    $ flutter run 

## Simple build for production

  - For Android :  https://flutter.dev/docs/deployment/android
  - For iOS     :  https://flutter.dev/docs/deployment/ios

## Project Structure

The folder structure of this app is explained below:

| Name               | Description                                              |
| ------------------ | -------------------------------------------------------- |
| **github**   | Contains CI/CD commands                        |
| **lib**            | Contains source code that will be compiled               |
| **test**            | Contains all unit and widget tests            |
| **src/controller** | Contains all GetX controller classes and respective service or utility helper classes                             |
| **src/db**     | Contain database helper class |
| **src/model**      | Contain data access models used by the app |
| **src/utils**      | Contains the general utilities such as constants, route map etc      |
| **src/view**      | Contains all the UI elements. Separate into different screens and within which contains reusable component widgets         |
| **pubspec.yaml**   | Contains pub dependencies as well as     |

## URL Routing

 - To open the app with start and end date parameter using a browser, use the following example url format : customscheme://mkappworks.com/bgm/glevels?start=2021-02-14&end=2021-02-17

 - To run it on iOS simulator : xcrun simctl openurl booted "customscheme://mkappworks.com/bgm/glevels?start=2021-02-14&end=2021-02-17"
 - To run it on Android simulator : adb shell am start -a android.intent.action.VIEW -c android.intent.category.BROWSABLE -d "customscheme://mkappworks.com/bgm/glevels?start=2021-02-14&end=2021-02-17"

 - More reading on Flutter deep linking visit : https://flutter.dev/docs/development/ui/navigation/deep-linking

 ## App Features

 - Long pressing on the Maximum value highlight the corresponding value in the graph with a red triangle

 - Long pressing on the Minimum value highlight the corresponding value in the graph with a green circle

 - Tap on the Pick Start Date or Pick End Date to filter the data in the line graph

 - Tap on the Save Data button to save the data displayed in line graph to a local sqflite database

## App Preview

