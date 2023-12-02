# Party Explorer App

## Overview

This app allows users to browse through a list of party cards, each displaying essential details such as the party's name, images, prices,
 and dates. It has ability to generate new, random party entries.

## Features

- **Browse Parties**: Users can scroll through a list of party cards. Each card displays the party's name, a banner image, price, the number of attendees, and dates.
  
- **Search Functionality**: Users can filter the party list by searching by name, making it easier to find parties of interest.
  
- **Random Party Generation**: A feature to randomly generate new parties, complete with randomly-selected names and images from a predefined array. Each generated party includes a price and a start date, with an optional end date.

- **Initial Party Feed**: When the app is launched, at least 3 randomly-generated parties are already present in the feed.

## App Demo

![Demo GIF](./Demo/demo.gif)

## Technical Details

- **Party Data Object**: Includes properties like name (string), banner image (URL), price (double), start date (date), and an optional end date (date).

## Setup and Running Instructions

1. **Prerequisites**: Ensure you have Xcode installed on your Mac.
   
2. **Clone the Repository**: Clone the project repository to your local machine.

```
git clone https://github.com/VineethKanaparthi/PartyExplorer.git
```

3. **Open the Project**: Open the `.xcodeproj` file in Xcode.

4. **Run the App**: Choose an iOS simulator and run the app. You can also run the app on a connected iOS device.
