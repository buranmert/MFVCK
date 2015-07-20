# MFVCK
Yet another interpretation of MVVM in iOS

This is a demo project for that new architecture/mindset

###Units
1. View Controllers:
  * Responsible for creating and managing the layout of that particular page
  * Creates views, view models and data controllers
  * Acts like a hub between different view models in the page
2. View Models:
  * Only responsible for view logic
  * For example, in a form page, a single view model is responsible for view logic of input fields
    - validation
    - different states of input field
  * In fact, view controller should only know very limited amount of user interaction
  * Delegation is used here, blocks can be employed though
3. Data Controllers:
  * Responsible for fetching, manipulating and storing the data
  * Non-UI logic should be placed here
    
##Summary:
a typical iOS/frontend application has several similar functions:

1. fetch data
2. manipulate data
3. display data
4. provide a interactive/nice interface for retrieving user input
5. take input
6. send request to server

- 1, 2: Data controllers handles them
- 3: View controller connects data and view model so that view model takes responsibility and displays data
- 4, 5 : View models handles them, view controller shouldn't know almost anything
- 6: first 5 steps in a reverse way
  * view model->view controller->data controller
