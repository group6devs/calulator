# Calulator
# Group 6

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
An app that helps to track nutrition. Calulator can help to reach and maintain weight goals, as it involves tracking how many calories is going into the body.

### App Evaluation
- **Category:** Health & Fitness
- **Mobile:** This app primarily uses for mobile devices due to the quick access to find and calculate calories based on food items. Despite being on mobile devices but it does have room to improve and add more functionality later on. 
- **Story:** A calculator can help to reach and maintain weight goals by allowing users to track calories based on food intake. Users can view the calories of each food item. 
- **Market:** Anyone could choose to use this app to view food items calories and calculate total calories.
- **Habit:** The frequency of use of this app is entirely up to the user, depending on which food items they want to calculate calorie
- **Scope:** At first, we could begin to calculate calories by the choice of food items, then maybe it could evolve into an app that provides predictions of calories for users based on their usage habits. 

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* User shall be able to login and logout
* Main screen with 20 food items
* Screen with added items with calculated total consumed calories

**Optional Nice-to-have Stories**

* Food item Search Bar
* List of 10 recently searched items
* Nutritions detail screen

### 2. Screen Archetypes

* Login screen
    * User can register and login using credentials that a user used to register
* Main Food items screen
    * Scrollable screen with 20 items
    * Add button to add an item to logs
* Logs Screen
    * Display Scrollable list of items added by a user
    * Calories total is calculated and added at the bottom of the screen (sticky ribbon)

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Main Page
* Logs page

**Flow Navigation** (Screen to Screen)

* Login Page
   => Home page (main page with list of items)
* Main Page
   => Logs page (Selected items with calculator at the bottom)
   => Back to login by tapping Home on tab navigation
* Logs page
   => Main page (if needed to return)
   

## Wireframes 
<img src="https://i.imgur.com/gZLIjVX.jpg" width=600>

### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype

## Schema 
[This section will be completed in Unit 9]
### Models
[Add table of models]
### Networking
- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]
