-- CONTENT CONSUMPTION TABLE ANALYSIS :- -- [JOTSTAR]
SELECT COUNT(*)FROM jotstar_db.content_consumption; 
-- 133860
-- 
SELECT device_type, COUNT(*) AS device_count 
FROM jotstar_db.content_consumption 
WHERE device_type IN ('Laptop', 'TV', 'Mobile') 
GROUP BY device_type;
-- 44620 each
-- 
SELECT * FROM jotstar_db.content_consumption; 
-- 
SELECT 
    SUM(CASE WHEN total_watch_time_mins < 1000 THEN 1 ELSE 0 END) AS less_than_1000,
    SUM(CASE WHEN total_watch_time_mins BETWEEN 1000 AND 1999 THEN 1 ELSE 0 END) AS between_1000_and_2000,
    SUM(CASE WHEN total_watch_time_mins BETWEEN 2000 AND 2999 THEN 1 ELSE 0 END) AS between_2000_and_3000,
    SUM(CASE WHEN total_watch_time_mins >= 3000 THEN 1 ELSE 0 END) AS more_than_3000
FROM jotstar_db.content_consumption;
-- less_than_1000=13923|between_1000_and_2000=16752|between_2000_and_3000=13455|more_than_3000=89730|
-- 
SELECT COUNT(*) AS null_count
FROM jotstar_db.content_consumption
WHERE user_id IS  NULL
OR total_watch_time_mins  IS  NULL
OR device_type IS  NULL;
--  NULL= 0
-- 
-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -- 
-- CONTENT TABLE ANALYSIS :- -- [JOTSTAR]
SELECT * FROM jotstar_db.contents;
--
SELECT count(*) FROM jotstar_db.contents;
-- 2360
-- 
SELECT COUNT(distinct language) AS TOTAL_language
FROM jotstar_db.contents;
-- 10 =TOTAL_language
-- 
SELECT distinct language 
FROM jotstar_db.contents;
-- Bengali, English, Gujarati, Hindi, Kannada, Malayalam, Marathi, Punjabi, Tamil, Telugu
-- 
SELECT language, COUNT(*) AS content_count 
FROM jotstar_db.contents 
WHERE language IN ('Bengali', 'English', 'Gujarati', 'Hindi', 'Kannada', 'Malayalam', 
                      'Marathi', 'Punjabi', 'Tamil', 'Telugu') 
GROUP BY language;
-- Bengali = 60 ; English = 800 ; Gujarati = 28 ; Hindi = 637 ; Kannada = 121 ; Malayalam = 118 ;
-- Marathi = 74 ; Punjabi = 27 ; Tamil = 251 ; Telugu = 244 
--   -------------------------------------------------------------- 
SELECT * FROM jotstar_db.contents;
-- 
SELECT count(DISTINCT genre )FROM jotstar_db.contents;
-- genre count =12
-- 
SELECT DISTINCT genre FROM jotstar_db.contents;
-- genre:: Action ; Comedy ; Drama ; Fantasy ; Romance ; Sci-Fi ;
-- Thriller ; Adventure ; Family ; Highlights ; Documentaries ; Live Matches
-- 
SELECT genre , COUNT(*) AS genre_count 
FROM jotstar_db.contents 
WHERE genre IN ('Action', 'Comedy', 'Drama', 'Fantasy', 'Romance', 'Sci-Fi', 'Thriller',
 'Adventure', 'Family', 'Highlights', 'Documentaries', 'Live Matches')
 group by genre;
 -- Action = 398 ; Comedy = 228 ; Drama = 387 ; Fantasy = 211 ; Romance = 204 ; Sci-Fi = 126 ; Thriller = 288 ; Adventure = 154 ;
 -- Family = 10 ; Highlights = 70 ; Documentaries = 35 ; Live Matches = 249
 --   -------------------------------------------------------------- 
SELECT * FROM jotstar_db.contents;
-- 
SELECT count(DISTINCT content_type )FROM jotstar_db.contents;
-- content_type =3
-- 
SELECT DISTINCT content_type FROM jotstar_db.contents;
-- 'Movie', 'Series', 'Sports'
-- 
SELECT 
    SUM(CASE WHEN run_time < 60 THEN 1 ELSE 0 END) AS less_than_1hr,
    SUM(CASE WHEN run_time BETWEEN 60 AND 180 THEN 1 ELSE 0 END) AS between_1hr_and_3hr,
    SUM(CASE WHEN run_time BETWEEN 180 AND 300 THEN 1 ELSE 0 END) AS between_3hr_and_5hr,
    SUM(CASE WHEN run_time >=300  THEN 1 ELSE 0 END) AS more_than_5hr
FROM jotstar_db.contents;
-- less than 1hr = 903, between 1hr and 3hr = 1433, between 3hr and 5hr = 132, more than 5hr = 12
--
SELECT COUNT(*) AS null_count
FROM jotstar_db.contents
WHERE content_id IS  NULL
OR run_time  IS  NULL
OR genre IS  NULL
OR language IS  NULL
OR content_type IS  NULL; 
-- null = 0
-- 
-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -- 
-- SUBSCRIBER TABLE ANALYSIS :- -- [JOTSTAR] 
SELECT * FROM jotstar_db.subscribers;
-- 
SELECT count(*) FROM jotstar_db.subscribers;
-- 44620
SELECT COUNT(DISTINCT user_id) AS unique_users FROM jotstar_db.subscribers;
-- 44620
-- 
SELECT DISTINCT subscription_plan from jotstar_db.subscribers;
-- 'Premium', 'Free', 'VIP'
-- 
SELECT subscription_plan, COUNT(*) AS Subscription_count 
FROM jotstar_db.subscribers 
WHERE subscription_plan IN ('Premium', 'Free', 'VIP') 
GROUP BY subscription_plan;
-- Premium = 13367 ; Free = 12096 ; VIP = 19157
-- ----------------------------------------------------------------------------
SELECT * FROM jotstar_db.subscribers;
SELECT DISTINCT city_tier from jotstar_db.subscribers;
-- 'Tier 1', 'Tier 2', 'Tier 3'
-- 
SELECT city_tier, COUNT(*) AS city_count 
FROM jotstar_db.subscribers 
WHERE city_tier IN ('Tier 1', 'Tier 2', 'Tier 3') 
GROUP BY city_tier;
-- Tier 1 = 25451 ; Tier 2 = 13424 ; Tier 3 = 5745
--
-- ----------------------------------------------------------------------------
SELECT DISTINCT age_group from jotstar_db.subscribers;
SELECT 
    SUM(CASE WHEN age_group < 18 THEN 1 ELSE 0 END) AS less_than_18,
    SUM(CASE WHEN age_group BETWEEN 18 AND 24 THEN 1 ELSE 0 END) AS between_18_and_24,
    SUM(CASE WHEN age_group BETWEEN 25 AND 34 THEN 1 ELSE 0 END) AS between_24_and_34,
    SUM(CASE WHEN age_group BETWEEN 34 AND 44 THEN 1 ELSE 0 END) AS between_34_and_44,
    SUM(CASE WHEN age_group >= 45 THEN 1 ELSE 0 END) AS more_than_45
FROM jotstar_db.subscribers ;
-- less than 18 = 0, between 18 and 24 = 7676, between 25 and 34 = 20069, between 35 and 44 = 11274, more than 45 = 5601
SELECT
    SUM(CASE WHEN MONTH(subscription_date) BETWEEN 4 AND 6 THEN 1 ELSE 0 END) AS SUMMER_SUBSCRIBER,
    SUM(CASE WHEN MONTH(subscription_date) BETWEEN 7 AND 9 THEN 1 ELSE 0 END) AS FALL_SUBSCRIBER,
    SUM(CASE WHEN MONTH(subscription_date) BETWEEN 10 AND 12 THEN 1 ELSE 0 END) AS WINTER_SUBSCRIBER,
    SUM(CASE WHEN MONTH(subscription_date) BETWEEN 1 AND 3 THEN 1 ELSE 0 END) AS SPRING_SUBSCRIBER
FROM jotstar_db.subscribers;
-- |summer subs :12002|fall subs:12333|winter subs:8458|spring subs:11827|
-- -----------------------------------------------------------------------
SELECT * FROM jotstar_db.subscribers;
SELECT COUNT(last_active_date) FROM jotstar_db.subscribers;
-- TOTAL PEOPLE WITH LAST ACTIVE DATE = 6652 ; TOTAL USER WITH UNKNOWN LAST ACTIVE DATE= 37,968 
SELECT COUNT(plan_change_date) FROM jotstar_db.subscribers;
-- TOTAL PEOPLE WITH PLAN CHANGE = '7090' ; TOTAL PEOPLE WITHOUT PLAN CHANGE = 37,530
-- 
SELECT new_subscription_plan, COUNT(*) AS New_Subscription_count 
FROM jotstar_db.subscribers 
WHERE new_subscription_plan IN ('Premium', 'Free', 'VIP',NULL) 
GROUP BY new_subscription_plan;
-- VIP = 1212 ; Free = 2374 ; Premium = 3504 ; NULL = 37,530
-- 
-- WE CAN CHECK WHICH USER IN BULK CHANGE FROM PLAN A TO PLAN B 
SELECT COUNT(subscription_plan),COUNT(new_subscription_plan),COUNT(user_id) FROM jotstar_db.subscribers
WHERE subscription_plan = 'Free'AND new_subscription_plan IS NOT NULL ;
-- USER WHO SWITCHED FROM FREE SUBSCRIOTION = 1527
SELECT COUNT(subscription_plan),COUNT(new_subscription_plan),COUNT(user_id) FROM jotstar_db.subscribers
WHERE subscription_plan = 'VIP'AND new_subscription_plan IS NOT NULL ;
-- USER WHO SWITCHED FROM FREE SUBSCRIOTION = 4970
SELECT COUNT(subscription_plan),COUNT(new_subscription_plan),COUNT(user_id) FROM jotstar_db.subscribers
WHERE subscription_plan = 'Premium'AND new_subscription_plan IS NOT NULL ;
-- USER WHO SWITCHED FROM FREE SUBSCRIPTION = 593
-- 
SELECT COUNT(subscription_plan),COUNT(new_subscription_plan),COUNT(user_id) FROM jotstar_db.subscribers
WHERE subscription_plan = 'Free'AND new_subscription_plan = 'VIP' ;
-- USER WHO SWITCHED FROM FREE TO VIP = 844
SELECT COUNT(subscription_plan),COUNT(new_subscription_plan),COUNT(user_id) FROM jotstar_db.subscribers
WHERE subscription_plan = 'Free'AND new_subscription_plan = 'Premium' ;
-- USER WHO SWITCHED FROM FREE TO VIP = 683
SELECT COUNT(subscription_plan),COUNT(new_subscription_plan),COUNT(user_id) FROM jotstar_db.subscribers
WHERE subscription_plan = 'VIP'AND new_subscription_plan ='Free' ;
-- USER WHO SWITCHED FROM VIP TO FREE = 2149
SELECT COUNT(subscription_plan),COUNT(new_subscription_plan),COUNT(user_id) FROM jotstar_db.subscribers
WHERE subscription_plan = 'VIP'AND new_subscription_plan = 'Premium' ;
-- USER WHO SWITCHED FROM VIP TO Premium = 2821
SELECT COUNT(subscription_plan),COUNT(new_subscription_plan),COUNT(user_id) FROM jotstar_db.subscribers
WHERE subscription_plan = 'Premium'AND new_subscription_plan = 'Free' ;
-- USER WHO SWITCHED FROM Premium TO FREE = 225
SELECT COUNT(subscription_plan),COUNT(new_subscription_plan),COUNT(user_id) FROM jotstar_db.subscribers
WHERE subscription_plan = 'Premium'AND new_subscription_plan = 'VIP' ;
-- USER WHO SWITCHED FROM Premium TO VIP = 368
-- 
SELECT city_tier,count(city_tier), subscription_plan FROM jotstar_db.subscribers
 WHERE city_tier IN ('Tier 1', 'Tier 2', 'Tier 3') 
 AND subscription_plan = 'Free'
 group by city_tier;
-- Tier 1 = 5111 (Free) ; Tier 2 = 4064 (Free) ; Tier 3 = 2921 (Free)
SELECT city_tier,count(city_tier), subscription_plan FROM jotstar_db.subscribers
 WHERE city_tier IN ('Tier 1', 'Tier 2', 'Tier 3') 
 AND subscription_plan = 'VIP'
 group by city_tier;
-- Tier 2 = 6794 (VIP) ; Tier 3 = 2201 (VIP) ; Tier 1 = 10162 (VIP)
SELECT city_tier,count(city_tier), subscription_plan FROM jotstar_db.subscribers
 WHERE city_tier IN ('Tier 1', 'Tier 2', 'Tier 3') 
 AND subscription_plan = 'Premium'
 group by city_tier;
-- Tier 1 = 10178 (Premium) ; Tier 3 = 623 (Premium) ; Tier 2 = 2566 (Premium)
-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -- 
-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -- 
-- CONTENT CONSUMPTION TABLE ANALYSIS -- [LIOCINEMA]
SELECT * FROM liocinema_db.content_consumption;
SELECT COUNT(*)FROM liocinema_db.content_consumption; 
-- '430752'
-- 
SELECT device_type, COUNT(*) AS device_count 
FROM liocinema_db.content_consumption 
WHERE device_type IN ('Laptop', 'TV', 'Mobile') 
GROUP BY device_type;
-- Mobile = 183446 ; TV = 123653 ; Laptop = 123653
-- 
SELECT * FROM liocinema_db.content_consumption; 
-- 
SELECT 
    SUM(CASE WHEN total_watch_time_mins < 1000 THEN 1 ELSE 0 END) AS less_than_1000,
    SUM(CASE WHEN total_watch_time_mins BETWEEN 1000 AND 1999 THEN 1 ELSE 0 END) AS between_1000_and_2000,
    SUM(CASE WHEN total_watch_time_mins BETWEEN 2000 AND 2999 THEN 1 ELSE 0 END) AS between_2000_and_3000,
    SUM(CASE WHEN total_watch_time_mins >= 3000 THEN 1 ELSE 0 END) AS more_than_3000
FROM liocinema_db.content_consumption;
-- less_than_1000=281876|between_1000_and_2000=65080|between_2000_and_3000=26482|more_than_3000=57314|
-- 
SELECT COUNT(*) AS null_count
FROM liocinema_db.content_consumption
WHERE user_id IS  NULL
OR total_watch_time_mins  IS  NULL
OR device_type IS  NULL;
--  NULL= 0
-- 
-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -- 
-- CONTENT TABLE ANALYSIS -- [LIOCINEMA]
SELECT * FROM liocinema_db.contents;
--
SELECT count(*) FROM liocinema_db.contents;
-- 1250
-- 
SELECT COUNT(distinct language) AS TOTAL_language
FROM liocinema_db.contents;
-- 7 =TOTAL_language
-- 
SELECT distinct language 
FROM liocinema_db.contents;
-- 'English', 'Hindi', 'Kannada', 'Malayalam', 'Marathi', 'Tamil', 'Telugu'
-- 
SELECT language, COUNT(*) AS content_count 
FROM liocinema_db.contents 
WHERE language IN ('English', 'Hindi', 'Kannada', 'Malayalam', 'Marathi', 'Tamil', 'Telugu') 
GROUP BY language;
-- English = 56 ; Hindi = 424 ; Kannada = 118 ; Malayalam = 121 ; Marathi = 68 ; Tamil = 221 ; Telugu = 242
--   -------------------------------------------------------------- 
SELECT * FROM liocinema_db.contents;
-- 
SELECT count(DISTINCT genre )FROM liocinema_db.contents;
-- genre count =11
-- 
SELECT DISTINCT genre FROM liocinema_db.contents;
-- genre:: 'Action', 'Comedy', 'Drama', 'Family', 'Horror', 'Romance', 'Thriller',
--  'Crime', 'Documentaries', 'Highlights', 'Live Matches'
-- 
SELECT genre , COUNT(*) AS genre_count 
FROM liocinema_db.contents 
WHERE genre IN ('Action', 'Comedy', 'Drama', 'Family', 'Horror', 'Romance', 'Thriller', 'Crime', 'Documentaries', 'Highlights', 'Live Matches')
 group by genre;
 -- Action = 167 ; Comedy = 210 ; Drama = 395 ; Family = 79 ; Horror = 34 ; Romance = 152 ; Thriller = 125 ;
 -- Crime = 38 ; Documentaries = 5 ; Highlights = 12 ; Live Matches = 33
 --   -------------------------------------------------------------- 
SELECT * FROM liocinema_db.contents;
-- 
SELECT count(DISTINCT content_type )FROM liocinema_db.contents;
-- content_type =3
-- 
SELECT DISTINCT content_type FROM liocinema_db.contents;
-- 'Movie', 'Series', 'Sports'
-- 
SELECT 
    SUM(CASE WHEN run_time < 60 THEN 1 ELSE 0 END) AS less_than_1hr,
    SUM(CASE WHEN run_time BETWEEN 60 AND 180 THEN 1 ELSE 0 END) AS between_1hr_and_3hr,
    SUM(CASE WHEN run_time BETWEEN 180 AND 300 THEN 1 ELSE 0 END) AS between_3hr_and_5hr,
    SUM(CASE WHEN run_time >=300  THEN 1 ELSE 0 END) AS more_than_5hr
FROM liocinema_db.contents;
-- less than 1hr = 313, between 1hr and 3hr = 935, between 3hr and 5hr =53 , more than 5hr = 1
--
SELECT COUNT(*) AS null_count
FROM liocinema_db.contents
WHERE content_id IS  NULL
OR run_time  IS  NULL
OR genre IS  NULL
OR language IS  NULL
OR content_type IS  NULL; 
-- null = 0
-- 
-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -- 
-- SUBSCRIBERS TABLE ANALYSIS -- [LIOCINEMA]
SELECT * FROM liocinema_db.subscribers;
-- 
SELECT count(*) FROM liocinema_db.subscribers;
-- 183446
SELECT COUNT(DISTINCT user_id) AS unique_users FROM liocinema_db.subscribers;
-- 183446
-- 
SELECT DISTINCT subscription_plan from liocinema_db.subscribers;
-- 'Premium', 'Free', 'Basic'
-- 
SELECT subscription_plan, COUNT(*) AS Subscription_count 
FROM liocinema_db.subscribers 
WHERE subscription_plan IN ('Premium', 'Free', 'Basic') 
GROUP BY subscription_plan;
-- Premium = 25092 ; Free = 104992 ; Basic = 53362
-- ----------------------------------------------------------------------------
SELECT * FROM liocinema_db.subscribers;
SELECT DISTINCT city_tier from liocinema_db.subscribers;
-- 'Tier 1', 'Tier 2', 'Tier 3'
-- 
SELECT city_tier, COUNT(*) AS city_count 
FROM liocinema_db.subscribers 
WHERE city_tier IN ('Tier 1', 'Tier 2', 'Tier 3') 
GROUP BY city_tier;
-- Tier 1 = 41011 ; Tier 2 = 63848 ; Tier 3 = 78587
--
-- ----------------------------------------------------------------------------
SELECT DISTINCT age_group from jotstar_db.subscribers;
SELECT 
    SUM(CASE WHEN age_group < 18 THEN 1 ELSE 0 END) AS less_than_18,
    SUM(CASE WHEN age_group BETWEEN 18 AND 24 THEN 1 ELSE 0 END) AS between_18_and_24,
    SUM(CASE WHEN age_group BETWEEN 25 AND 34 THEN 1 ELSE 0 END) AS between_24_and_34,
    SUM(CASE WHEN age_group BETWEEN 34 AND 44 THEN 1 ELSE 0 END) AS between_34_and_44,
    SUM(CASE WHEN age_group >= 45 THEN 1 ELSE 0 END) AS more_than_45
FROM liocinema_db.subscribers ;
-- less than 18 = 0, between 18 and 24 = 79813, between 24 and 34 = 52027, between 34 and 44 = 32560, more than 45 = 19046
SELECT
    SUM(CASE WHEN MONTH(subscription_date) BETWEEN 4 AND 6 THEN 1 ELSE 0 END) AS SUMMER_SUBSCRIBER,
    SUM(CASE WHEN MONTH(subscription_date) BETWEEN 7 AND 9 THEN 1 ELSE 0 END) AS FALL_SUBSCRIBER,
    SUM(CASE WHEN MONTH(subscription_date) BETWEEN 10 AND 12 THEN 1 ELSE 0 END) AS WINTER_SUBSCRIBER,
    SUM(CASE WHEN MONTH(subscription_date) BETWEEN 1 AND 3 THEN 1 ELSE 0 END) AS SPRING_SUBSCRIBER
FROM liocinema_db.subscribers;
-- |summer subs :35504|fall subs:59281|winter subs:66102|spring subs:22559|
-- -----------------------------------------------------------------------
SELECT * FROM liocinema_db.subscribers;
SELECT COUNT(last_active_date) FROM liocinema_db.subscribers;
-- TOTAL PEOPLE WITH LAST ACTIVE DATE = 82305 ; TOTAL USER WITH UNKNOWN LAST ACTIVE DATE= 1,01,141
SELECT COUNT(plan_change_date) FROM liocinema_db.subscribers;
-- TOTAL PEOPLE WITH PLAN CHANGE = '25014' ; TOTAL PEOPLE WITHOUT PLAN CHANGE = 1,58,432
-- 
SELECT new_subscription_plan, COUNT(*) AS New_Subscription_count 
FROM liocinema_db.subscribers 
WHERE new_subscription_plan IN ('Premium', 'Free', 'Basic',NULL) 
GROUP BY new_subscription_plan;
-- Basic = 5189 ; Free = 17748 ; Premium = 2077 ; NULL = 1,58,432 
-- 
-- WE CAN CHECK WHICH USER IN BULK CHANGE FROM PLAN A TO PLAN B 
SELECT COUNT(subscription_plan),COUNT(new_subscription_plan),COUNT(user_id) FROM liocinema_db.subscribers
WHERE subscription_plan = 'Free'AND new_subscription_plan IS NOT NULL ;
-- USER WHO SWITCHED FROM FREE SUBSCRIOTION = 2793
SELECT COUNT(subscription_plan),COUNT(new_subscription_plan),COUNT(user_id) FROM liocinema_db.subscribers
WHERE subscription_plan = 'Basic'AND new_subscription_plan IS NOT NULL ;
-- USER WHO SWITCHED FROM FREE SUBSCRIOTION = 11671
SELECT COUNT(subscription_plan),COUNT(new_subscription_plan),COUNT(user_id) FROM liocinema_db.subscribers
WHERE subscription_plan = 'Premium'AND new_subscription_plan IS NOT NULL ;
-- USER WHO SWITCHED FROM FREE SUBSCRIPTION = 10550
-- 
SELECT COUNT(subscription_plan),COUNT(new_subscription_plan),COUNT(user_id) FROM liocinema_db.subscribers
WHERE subscription_plan = 'Free'AND new_subscription_plan = 'Basic' ;
-- USER WHO SWITCHED FROM FREE TO Basic = 2078
SELECT COUNT(subscription_plan),COUNT(new_subscription_plan),COUNT(user_id) FROM liocinema_db.subscribers
WHERE subscription_plan = 'Free'AND new_subscription_plan = 'Premium' ;
-- USER WHO SWITCHED FROM FREE TO VIP = 715
SELECT COUNT(subscription_plan),COUNT(new_subscription_plan),COUNT(user_id) FROM liocinema_db.subscribers
WHERE subscription_plan = 'Basic'AND new_subscription_plan ='Free' ;
-- USER WHO SWITCHED FROM Basic TO FREE = 10309
SELECT COUNT(subscription_plan),COUNT(new_subscription_plan),COUNT(user_id) FROM liocinema_db.subscribers
WHERE subscription_plan = 'Basic'AND new_subscription_plan = 'Premium' ;
-- USER WHO SWITCHED FROM Basic TO Premium = 1362
SELECT COUNT(subscription_plan),COUNT(new_subscription_plan),COUNT(user_id) FROM liocinema_db.subscribers
WHERE subscription_plan = 'Premium'AND new_subscription_plan = 'Free' ;
-- USER WHO SWITCHED FROM Premium TO FREE = 7439
SELECT COUNT(subscription_plan),COUNT(new_subscription_plan),COUNT(user_id) FROM liocinema_db.subscribers
WHERE subscription_plan = 'Premium'AND new_subscription_plan = 'Basic' ;
-- USER WHO SWITCHED FROM Premium TO Basic = 3111
--
SELECT * FROM liocinema_db.subscribers; 
-- NOW WE CAN CHECK THE TIER WITH HIGHEST DROP OUTS 
SELECT city_tier,count(city_tier), subscription_plan FROM liocinema_db.subscribers
 WHERE city_tier IN ('Tier 1', 'Tier 2', 'Tier 3') 
 AND subscription_plan = 'Free'
 group by city_tier;
-- Tier 3 = 54392 (Free) ; Tier 2 = 32188 (Free) ; Tier 1 = 18412 (Free)
SELECT city_tier,count(city_tier), subscription_plan FROM liocinema_db.subscribers
 WHERE city_tier IN ('Tier 1', 'Tier 2', 'Tier 3') 
 AND subscription_plan = 'Basic'
 group by city_tier;
-- Tier 1 = 12293 (Basic) ; Tier 3 = 18499 (Basic) ; Tier 2 = 22570 (Basic)
SELECT city_tier,count(city_tier), subscription_plan FROM liocinema_db.subscribers
 WHERE city_tier IN ('Tier 1', 'Tier 2', 'Tier 3') 
 AND subscription_plan = 'Premium'
 group by city_tier;
-- Tier 2 = 9090 (Premium) ; Tier 3 = 5696 (Premium) ; Tier 1 = 10306 (Premium)