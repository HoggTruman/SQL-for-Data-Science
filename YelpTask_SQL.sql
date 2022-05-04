-- PART 1 ----------------------------------------------------------------------
---- Q1
-- i
SELECT COUNT(*) FROM attribute

-- ii
SELECT COUNT(*) FROM business

-- iii
SELECT COUNT(*) FROM category

-- iv
SELECT COUNT(*) FROM checkin

-- v
SELECT COUNT(*) FROM elite_years

-- vi
SELECT COUNT(*) FROM friend

-- vii
SELECT COUNT(*) FROM hours

-- viii
SELECT COUNT(*) FROM photo

-- ix
SELECT COUNT(*) FROM review

-- x
SELECT COUNT(*) FROM tip

-- xi
SELECT COUNT(*) FROM user


---- Q2
-- i
SELECT COUNT(DISTINCT business_id) FROM attribute

-- ii
SELECT COUNT(DISTINCT id) FROM business

-- iii
SELECT COUNT(DISTINCT business_id) FROM category

-- iv
SELECT COUNT(DISTINCT business_id) FROM checkin

-- v
SELECT COUNT(DISTINCT user_id) FROM elite_years

-- vi
SELECT COUNT(DISTINCT user_id) FROM friend

-- vii
SELECT COUNT(DISTINCT business_id) FROM hours

-- viii
SELECT COUNT(DISTINCT id) FROM photo

-- ix
SELECT COUNT(DISTINCT id) FROM review

-- x
SELECT COUNT(DISTINCT user_id) FROM tip

-- xi
SELECT COUNT(DISTINCT id) FROM user


----Q3
SELECT * FROM user
WHERE id ISNULL
OR name ISNULL
OR review_count ISNULL
OR yelping_since ISNULL
OR useful ISNULL
OR funny ISNULL
OR cool ISNULL
OR fans ISNULL
OR average_stars ISNULL
OR compliment_hot ISNULL
OR compliment_more ISNULL
OR compliment_profile ISNULL
OR compliment_cute ISNULL
OR compliment_list ISNULL
OR compliment_note ISNULL
OR compliment_plain ISNULL
OR compliment_cool ISNULL
OR compliment_funny ISNULL
OR compliment_writer ISNULL
OR compliment_photos ISNULL


---- Q4
-- i
SELECT MIN(stars), MAX(stars), AVG(stars) FROM review

-- ii
SELECT MIN(stars), MAX(stars), AVG(stars) FROM business

-- iii
SELECT MIN(likes), MAX(likes), AVG(likes) FROM tip

-- iv
SELECT MIN(count), MAX(count), AVG(count) FROM checkin

-- v
SELECT MIN(review_count), MAX(review_count), AVG(review_count) FROM user

---- Q5
SELECT city, SUM(review_count) AS TotalReviews
FROM business
GROUP BY city
ORDER BY SUM(review_count) DESC
LIMIT 5


---- Q6
-- i
SELECT stars, COUNT(id) AS count
FROM business
WHERE city = "Avon"
GROUP BY stars

-- ii
SELECT stars, COUNT(id) AS count
FROM business
WHERE city = "Beachwood"
GROUP BY stars


---- Q7
SELECT id, name, review_count
FROM user
ORDER BY review_count DESC
LIMIT 3


---- Q8
SELECT CASE
  WHEN review_count < 250 THEN "A <250"
  WHEN review_count < 500 THEN "B 250-499"
  WHEN review_count < 750 THEN "C 500-749"
  WHEN review_count < 1000 THEN "D 750-999"
  WHEN review_count < 1250 THEN "E 1000-1249"
  ELSE "F 1250+"
END AS "review_count_group",
AVG(fans) as average_fans
FROM user
GROUP BY review_count_group


---- Q9
SELECT SUM(CASE WHEN text LIKE '%love%' THEN 1 ELSE 0 END) AS love_reviews,
       SUM(CASE WHEN text LIKE '%hate%' THEN 1 ELSE 0 END) AS hate_reviews
FROM review;


---- Q10
SELECT id, name, fans
FROM user
ORDER BY fans DESC
LIMIT 10


------ PART 2 ------------------------------------------------------------------
---- Q1
-- city: Las Vegas, category: Shopping
SELECT
CASE
  WHEN stars >= 4 THEN "4-5 stars"
  WHEN (stars >=2 AND stars <= 3) THEN "2-3 stars"
  ELSE "other"
END AS star_group

CAST(COUNT(hours) AS FLOAT)/COUNT(DISTINCT id) AS mean_days_open,
AVG(review_count) AS mean_reviews,

FROM business B
  INNER JOIN hours H ON B.id = H.business_id
  INNER JOIN category C on B.id = C.business_id

WHERE city = "Las Vegas" AND category = "Shopping"
GROUP BY star_group

-- look at location
SELECT
CASE
  WHEN stars >= 4 THEN "4-5 stars"
  WHEN (stars >=2 AND stars <= 3) THEN "2-3 stars"
  ELSE "other"
END AS star_group,
neighborhood,
COUNT(*) AS businesses
FROM business B INNER JOIN category C on B.id = C.business_id
WHERE city = "Las Vegas" AND category = "Shopping"
GROUP BY neighborhood


---- Q2
SELECT is_open,
AVG(longitude),
AVG(latitude),
AVG(review_count),
AVG(stars)
FROM business
GROUP BY is_open


---- Q3
SELECT CASE
  WHEN cool = 0 THEN "A not at all cool"
  WHEN cool < 2 THEN "B a tiny bit cool"
  WHEN cool < 4 THEN "C coolish"
  WHEN cool < 6 THEN "D cool"
  WHEN cool < 8 THEN "E very cool"
  WHEN cool < 10 THEN "F soooo cool"
  ELSE "G INSAAAAAAAAAANNNNNEEEEEELY COOL!!"
END AS coolness,
COUNT(friend_id)/CAST(COUNT(DISTINCT id) AS FLOAT) AS mean_friends
FROM user U LEFT JOIN friend F ON U.id = F.user_id
GROUP BY coolness

-- seeing who has friends
SELECT id, name, cool,
COUNT(friend_id) AS friends
FROM user U INNER JOIN friend F ON U.id = F.user_id
GROUP BY id
