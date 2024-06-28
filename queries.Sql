-- Select all activities happening in a specific location
SELECT * FROM Activities
WHERE Location = 'Cinquantenaire';

-- Select all users registered for a specific activity
SELECT u.UserID, u.Name, u.Email
FROM Registrations r
JOIN Users u ON r.UserID = u.UserID
WHERE r.ActivityID = 3;  -- Assuming 3 is the ActivityID of the activity

-- Select all comments for a specific activity
SELECT c.CommentID, u.Name AS UserName, c.CommentText, c.DateCommented
FROM Comments c
JOIN Users u ON c.UserID = u.UserID
WHERE c.ActivityID = 4;  -- Assuming 4 is the ActivityID of the activity

-- Select activities happening within a specific date range
SELECT * FROM Activities
WHERE Date BETWEEN '2024-07-01' AND '2024-07-31';

-- Insert a new registration record for a user and an activity
INSERT INTO Registrations (UserID, ActivityID, DateRegistered)
VALUES (6, 3, CURRENT_DATE);  -- Assuming 6 is the UserID and 3 is the ActivityID

-- Delete a registration record for a user from an activity
DELETE FROM Registrations
WHERE UserID = 10 AND ActivityID = 3;  -- Assuming 10 is the UserID and 3 is the ActivityID

