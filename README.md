# KnowledgeBridge
 Knowledge Bridge is a virtual showroom made to promote local projects by students and companies in Skellefteå. This project was made using Visual Studio 2019.
</br>

## To utilize the project:
### 1. Clone or download this repository.
### 2. Open the project using Visual Studio (Version 2019 is known to work), asp net packages have to have been installed.
### 3. Ensure that an appropriate SQL version is installed.
### 4. Launch from the default.aspx page in the solution.

## How it works: 
### General description
This web solution utilizes three web pages (aspx) with linked backend code (aspx.cs). These are made using Visual Studio 2019 and uses some asp.net components for easier development. HTML, CSS, Javascript and C# are used. 
## Default page
This page works as the index, the home page, the first page the user will load into. Functionalities on this page include: 
#### Menu
The menu contains access to several other functionalities. It is displayed on the top left of the page and can be toggled by left clicking. The toggle functionality works through A javacript script that has been sourced into the document. It controls the viewing of the slides and loops.

#### Search
The search function takes a search string and runs through the database, looking for results. By starting a search query using sql, a connection is made to the database and matches are saved.  

#### Login
Login includes user registrations (sign up), and logging in. The login takes the the user inputs and, in the case of logging in, creates a sql query with the input. The registration validates the password and email to ensure they have appropriate length and characters before attempting to input them into the database. If successfully logged in, a session is started that lasts between pages.

#### Swipe
Swiping uses a Javascript script. The functionality handles the amount of content shown.

#### Map
The map uses leaflet and openstreetmap. Markers can be placed on the map by left clicking on a location. Zooming and moving is integrated. Additional markers can be added to the map through the search function, by loading coordinates from the database.

## Model View page
#### Menu
The menu on the model view page includes less options than on the default page. The options that remain work the same as on the default page though.

#### Model showcase
The models are showcased as loaded content similar to the layout on the default page. They are loaded from a folder in the project, and can be adjusted from the backend if desired. 

## Submission Page
#### Submission field
The submission page contains instructions for submitting content. Further down there are several fields that the user can input files and text into for further details. Upon submitting, the inputed data is then attempted to be added to the database, and models should be saved to a folder here. 

#### Menu
The menu here, similar to the model page, has fewer options. The functionality for the options remains the same. 

## Bugs, issues and areas of improvement
* Publishing the solution to an external server still needs to be fully implemented 
* A bug where swiping or clicking on the model view page results in only one model loading in, likely issue with swiping script
* Could definitely be better adapted for both desktop and mobile (changes to css)
* Saving files to a folder needs to be implemented 
* Updating the default content after a search needs to be fully implemented
* Exception handling when uploading content and loading content needs to be implemented
* Account details needs to be implemented after logging in
* Bugs when trying to run the page from IOS have been encountered

## In case of wrong SQL Version, I found this solution to help </br>
sqllocaldb stop projectsv13 </br>
sqllocaldb delete projectsv13 </br>
sqllocaldb stop mssqllocaldb </br>
sqllocaldb delete mssqllocaldb </br>
sqllocaldb create MSSQLLocalDB </br>

Download SQL Express 2019 and run this in your command prompt to get the correct version.
