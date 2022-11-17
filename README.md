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

- [x] User shall be able to login
- [x] User shall be able to register
- [x] Login Screen UI
- [x] Home Screen UI
- [ ] Home screen with 20 food items
- [ ] ogs Screen UI
- [ ] Screen with added items with calculated total consumed calories

**Optional Nice-to-have Stories**

- [ ] Food item Search Bar
- [ ] List of 10 recently searched items
- [ ] Nutritions detail screen

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


### Models
| Property     | Type    | Description                    |
| :---         |     :---:      |          :--- |
| calories     | Number   | total calories in kcal returning in decimal                          |
| food_id      | String  | food chosen                    | 
| serving_id  | Number  | food chosen serving size          |
| food_entry_id| String  | food chosen data entry         |
| food_type    | String  | the type of food in database   |


### Networking
   - Login Screen
      - (Read/GET) Query user registered user(s) to login
        ```swift
        let username = usernameField.text!
        let password = passwordField.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (user, error) in
            if user != nil {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }else{
                print("Error: \(error)")
                }
            }
        }
         ```
     - (Create/POST) Create a new user profile.
   - Main Food items screen
      - (Read/GET) Query 20 food items from API
      - (Update/PUT) Update new food items.
   - Logs Screen
      - (Create/POST) Create a new items to logs
      - (Create/POST) Create a new calculate calories.
      - (Update/PUT) Update food items in logs
      - (Update/PUT) Update the calories calculation.
      - (Delete) Delete food items.
