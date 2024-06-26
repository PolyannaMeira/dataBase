# Design Document - "Interact"

By YOUR PolyannaMeira

## Scope

On average, people spend 4 to 5 hours a day using their cell phone.Excessive use of smartphones can reduce the 
quality of personal interactions and negatively affect mental health. 
We need a platform that promotes in-person social activities, encouraging people to disconnect from their devices 
and connect with each other.

Goals:
Promote in-person activities: Organize events, meetings and group activities.
Foster interpersonal communication: Encourage face-to-face conversations and interactions.
Create a sense of community: Bring together people with common interests.

The database for the Interact includes all entities necessary to facilitate the people to find people with similar 
interests and do activities together. As such, included in the database's scope is:

* Users, including basic identifying information and area of ​​interest;
* Activities, including area of ​​interest, dates, location;
* Registration, including data e places;
* Comments from the user about the activities.

## Functional Requirements

This database will support:

1- Register and Manage Profile:
  * Create a user account with basic information (name, email, password);
  * Update profile information (name, photo, interests).
    
2-  Search and View Activities:
  * Search for activities based on location, date, or interests;
  * View details of activities, including descriptions, times, locations, and organizers.

3- Sign Up for Activities:
  * Register to participate in activities;
  * Receive confirmations and reminders about registrations.
    
4- Create and Manage Activities:
  * Create new activities, providing details such as name, description, date, location, and capacity;
  * Edit or cancel activities they have created.

 5- Interact with Other Users:
  * Conect with other users;
  * Leave comments on activities;
  * View and respond to comments from other users;
  * Rate activities after participation.


### Entities and Relationships

In this section you should include your entity relationship diagram and describe the relationships between the entities in your database.

User:
A user can connect with other users (many-to-many with itself through Connections).
A user can create multiple activities (one-to-many relationship with Activities);
A user can register for multiple activities (many-to-many relationship with Activities through Registrations);
A user can comment on multiple activities (one-to-many relationship with Comments).

Activities:
An activity is organized by one user (many-to-one relationship with Users);
An activity can have many registrations (many-to-many relationship with Users through Registrations);
An activity can have many comments (one-to-many relationship with Comments);

Registrations:
A registration links a user to an activity (many-to-one relationship with Users and Activities).

Comments:
A comment is made by one user (many-to-one relationship with Users).
A comment is associated with one activity (many-to-one relationship with Activities).

Connections:
Links two users (many-to-many with Users).

## Representation

### Entities

In this section you should answer the following questions:

* Which entities will you choose to represent in your database?
* What attributes will those entities have?
* Why did you choose the types you did?
* Why did you choose the constraints you did?

  Users
  UserID, Name, Email, Password, DateRegistered

Activities:
  ActivityID, Name, Description, Date, Location, OrganizerID

Registrations:
  RegistrationID, UserID, ActivityID, DateRegistered

Comments:
  CommentID, ActivityID, UserID, CommentText, DateCommented

Connections:
  ConnectionID, UserID1, UserID2, Status, DateConnected

## Optimizations

In this section you should answer the following questions:

* Which optimizations (e.g., indexes, views) did you create? Why?
    * Strive to have at least one index and one view

## Limitations

In this section you should answer the following questions:

* What are the limitations of your design?
* What might your database not be able to represent very well?
