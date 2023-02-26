-- How can you retrieve all the information from the cd.facilities table?
SELECT * FROM cd.facilities; 

-- How can you produce a list of facilities that charge a fee to members?
SELECT * FROM cd.facilities WHERE membercost > 0;

-- How can you produce a list of facilities that charge a fee to members, and that fee is less than 1/50th of the monthly maintenance cost? Return the facid, facility name, member cost, and monthly maintenance of the facilities in question.
SELECT facid, name, membercost, monthlymaintenance
FROM cd.facilities
WHERE membercost > 0 AND
(membercost < 0.02*monthlymaintenance);

-- How can you produce a list of all facilities with the word 'Tennis' in their name?
SELECT * FROM cd.facilities WHERE name LIKE '%Tennis%';

-- How can you retrieve the details of facilities with ID 1 and 5? Try to do it without using the OR operator.
SELECT * FROM cd.facilities WHERE facid IN (1,5);

-- How can you produce a list of members who joined after the start of September 2012? Return the memid, surname, firstname, and joindate of the members in question.
SELECT memid, surname, firstname, joindate 
FROM cd.members WHERE joindate >= '2012-09-01';

-- How can you produce an ordered list of the first 10 surnames in the members table? The list must not contain duplicates.
SELECT DISTINCT(surname) FROM cd.members
ORDER BY surname 
LIMIT 10;

-- You'd like to get the signup date of your last member. How can you retrieve this information?
SELECT joindate FROM cd.members
ORDER BY joindate DESC
LIMIT 1

-- Produce a count of the number of facilities that have a cost to guests of 10 or more.
SELECT COUNT(*) FROM cd.facilities
WHERE guestcost >= 10;

-- Produce a list of the total number of slots booked per facility in the month of September 2012. Produce an output table consisting of facility id and slots, sorted by the number of slots.
SELECT facid, sum(slots) AS totalslots 
FROM cd.bookings
WHERE starttime >= '2012-09-01' 
AND starttime < '2012-10-01' 
GROUP BY facid 
ORDER BY SUM(slots);

-- Produce a list of facilities with more than 1000 slots booked. Produce an output table consisting of facility id and total slots, sorted by facility id.
SELECT facid, sum(slots) AS totalslots 
FROM cd.bookings 
GROUP BY facid 
HAVING SUM(slots) > 1000 
ORDER BY facid;

-- How can you produce a list of the start times for bookings for tennis courts, for the date '2012-09-21'? Return a list of start time and facility name pairings, ordered by the time.
SELECT cd.bookings.starttime, cd.facilities.name 
FROM cd.facilities 
INNER JOIN cd.bookings
ON cd.facilities.facid = cd.bookings.facid 
WHERE cd.facilities.name  LIKE 'Tennis%'
AND cd.bookings.starttime >= '2012-09-21' 
AND cd.bookings.starttime < '2012-09-22' 
ORDER BY cd.bookings.starttime;

-- How can you produce a list of the start times for bookings by members named 'David Farrell'?
SELECT cd.bookings.starttime 
FROM cd.bookings 
INNER JOIN cd.members 
ON cd.members.memid = cd.bookings.memid 
WHERE cd.members.firstname='David' 
AND cd.members.surname='Farrell';





