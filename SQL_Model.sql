---Create database
CREATE DATABASE final_proj;

-- dropping database if exists
if not exists(select * from sys.databases where name='final_proj')
    create database final_proj
GO

use final_proj
GO

-- Dropping tables if they exist
DROP TABLE IF EXISTS sentiments;
DROP TABLE IF EXISTS feedbacks;
DROP TABLE IF EXISTS purchases;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS product_category;
DROP TABLE IF EXISTS customers;

-- Creating Product_Category Table
CREATE TABLE product_category (
    product_category_id INT IDENTITY PRIMARY KEY,
    product_category VARCHAR(255) NOT NULL UNIQUE
);

-- Creating Products Table
CREATE TABLE products (
    product_id INT IDENTITY PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL UNIQUE,
    product_category_id INT NOT NULL,
    product_cost DECIMAL(10, 2) NOT NULL,  -- New field for product cost
    FOREIGN KEY (product_category_id) REFERENCES product_category(product_category_id)
);

-- Creating Customers Table
CREATE TABLE customers (
    customer_id INT IDENTITY PRIMARY KEY,
    customer_firstname VARCHAR(255) NOT NULL,
    customer_lastname VARCHAR(255) NOT NULL,
    customer_gender VARCHAR(255) NOT NULL,
    customer_email_id VARCHAR(255) NOT NULL UNIQUE,
    customer_phone_no VARCHAR(20) NOT NULL UNIQUE,
    customer_street VARCHAR(255) NOT NULL,
    customer_city VARCHAR(255) NOT NULL,
    customer_state VARCHAR(50) NOT NULL,
    customer_zip_code VARCHAR(20) NOT NULL,
    customer_country VARCHAR(50) NOT NULL
);

-- Creating Purchases Table
CREATE TABLE purchases (
    purchase_id INT IDENTITY PRIMARY KEY,
    customer_id INT NOT NULL,
    product_id INT NOT NULL,
    purchase_cost DECIMAL(10, 2) NOT NULL,
    purchase_quantity INT NOT NULL,
    purchase_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Creating Sentiments Table
CREATE TABLE sentiments (
    sentiment_id INT IDENTITY PRIMARY KEY,
    sentiment_type VARCHAR(255) NOT NULL UNIQUE
);

-- Creating Feedbacks Table
CREATE TABLE feedbacks (
    feedback_id INT IDENTITY PRIMARY KEY,
    customer_id INT,
    product_id INT,
    sentiment_id INT ,
    feedback_rating INT ,
    feedback_comments VARCHAR(1024),
    feedback_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (sentiment_id) REFERENCES sentiments(sentiment_id),
    UNIQUE(customer_id, product_id, feedback_date)
);

-- Insert values into product_category
INSERT INTO product_category (product_category)
VALUES
('Hair'),
('Body'),
('Face');

-- Insert values into products
INSERT INTO products (product_name, product_category_id, product_cost)
VALUES
('Hydrating Shampoo', 1, 50),
('Strengthening Conditioner', 1, 40),
('Curl Defining Cream', 1, 30),
('Shine Serum', 1, 20),
('Exfoliating Body Scrub', 2, 35),
('Moisturizing Body Wash', 2, 70),
('Body Lotion', 2, 85),
('Rejuvenating Face Wash', 3, 30),
('Daily Facial Moisturizer', 3, 30),
('Anti-Aging Cream', 3, 50),
('Night Repair Serum', 3, 35),
('Pore Refining Toner', 3, 45);

-- Insert values into customers, purchases, sentiments, and feedbacks accordingly.

---INSERT into Customers (customer_firstname,customer_lastname,customer_email_id,customer_phone_no,customer_street,customer_city,customer_state,customer_zip_code,customer_country) VALUES
INSERT INTO Customers (customer_firstname, customer_lastname, customer_gender, customer_email_id, customer_phone_no, customer_street, customer_city, customer_state, customer_zip_code, customer_country) 
VALUES
('Rutherford','Beard','Female','rbeard0@pagesperso-orange.fr','(515) 2730391','37335 Marcy Park','Des Moines','Iowa',50310,'United States'),
('Berna','Badham','Female','bbadham1@ow.ly','(502) 2429186','3865 Debs Lane','Louisville','Kentucky',40266,'United States'),
('Nonna','O'' Mullan','Female','nomullan2@nbcnews.com','(804) 8022160','2783 Lakewood Crossing','Richmond','Virginia',23285,'United States'),
('Inger','Klageman','Female','iklageman3@newsvine.com','(774) 1899051','666 Montana Road','Worcester','Massachusetts',1610,'United States'),
('Gayla','Filtness','Female','gfiltness4@ebay.com','(303) 7893375','24256 Lake View Drive','Denver','Colorado',80279,'United States'),
('Frances','Collelton','Female','fcollelton5@moonfruit.com','(480) 6971531','36539 Lillian Lane','Phoenix','Arizona',85040,'United States'),
('Nanine','Lohden','Female','nlohden6@weibo.com','(850) 9698521','697 Bartelt Lane','Pensacola','Florida',32590,'United States'),
('Robbyn','Antoniottii','Female','rantoniottii7@1und1.de','(503) 3897319','8 Maple Drive','Portland','Oregon',97211,'United States'),
('Clarice','Brightey','Female','cbrightey8@homestead.com','(316) 3204569','19 Kipling Park','Wichita','Kansas',67236,'United States'),
('Berne','Upcott','Female','bupcott9@japanpost.jp','(719) 5045437','91362 Sutteridge Avenue','Colorado Springs','Colorado',80935,'United States'),
('Mala','Unwin','Female','munwina@mtv.com','(904) 3671005','60892 Loomis Plaza','Jacksonville','Florida',32215,'United States'),
('Rutter','Boal','Female','rboalb@skyrock.com','(212) 6902598','212 Havey Circle','New York City','New York',10024,'United States'),
('Cindy','Chaperlin','Female','cchaperlinc@google.co.uk','(505) 9696388','3696 Green Ridge Center','Albuquerque','New Mexico',87105,'United States'),
('Hatti','Stocky','Female','hstockyd@sun.com','(601) 5492076','57 Fordem Place','Jackson','Mississippi',39210,'United States'),
('Patrick','Loy','Female','ploye@seattletimes.com','(214) 4823826','89 Gerald Court','Dallas','Texas',75260,'United States'),
('Ynez','Goodanew','Female','ygoodanewf@shop-pro.jp','(903) 4110764','3398 Morrow Street','Tyler','Texas',75705,'United States'),
('Cordell','Cestard','Female','ccestardg@myspace.com','(305) 9675831','2873 Dakota Crossing','Homestead','Florida',33034,'United States'),
('Cirilo','Fernanando','Female','cfernanandoh@mtv.com','(225) 8255651','9444 Northfield Lane','Baton Rouge','Louisiana',70883,'United States'),
('Meryl','Cawthorne','Female','mcawthornei@a8.net','(915) 6587332','726 Mendota Crossing','El Paso','Texas',88558,'United States'),
('Raye','Backshaw','Female','rbackshawj@eepurl.com','(423) 8792727','254 Mosinee Junction','Kingsport','Tennessee',37665,'United States'),
('Wallis','Sheekey','Female','wsheekeyk@jalbum.net','(404) 2207129','605 Fisk Pass','Atlanta','Georgia',30392,'United States'),
('Olimpia','Litchmore','Female','olitchmorel@gnu.org','(469) 4961720','69836 American Ash Point','Dallas','Texas',75205,'United States'),
('Brant','Sitwell','Female','bsitwellm@phpbb.com','(916) 4365935','31431 Hovde Court','Sacramento','California',95865,'United States'),
('Melisandra','Terrey','Female','mterreyn@xinhuanet.com','(414) 9070133','5847 Melby Place','Milwaukee','Wisconsin',53215,'United States'),
('Margaretha','Gregr','Female','mgregro@imdb.com','(513) 9677848','2 Gina Avenue','Cincinnati','Ohio',45264,'United States'),
('Ive','Thow','Female','ithowp@opensource.org','(561) 8799658','09575 3rd Place','Delray Beach','Florida',33448,'United States'),
('Madeleine','Barth','Female','mbarthq@naver.com','(202) 4856354','39229 David Road','Washington','District of Columbia',20436,'United States'),
('Andris','Rigby','Female','arigbyr@virginia.edu','(317) 2050736','23942 Mosinee Road','Indianapolis','Indiana',46231,'United States'),
('Reynolds','Rosie','Female','rrosies@facebook.com','(413) 8006801','7894 Springview Road','Springfield','Massachusetts',1105,'United States'),
('Alene','Tomashov','Female','atomashovt@hhs.gov','(734) 8833159','2652 Fremont Lane','Detroit','Michigan',48242,'United States'),
('Eleanore','Godfery','Female','egodferyu@chronoengine.com','(205) 6603523','505 Welch Junction','Birmingham','Alabama',35242,'United States'),
('Devan','Yusupov','Female','dyusupovv@zimbio.com','(202) 5610388','4 Bartillon Trail','Washington','District of Columbia',20067,'United States'),
('Lorette','Heaford','Female','lheafordw@jalbum.net','(410) 3681453','92 Straubel Trail','Laurel','Maryland',20709,'United States'),
('Gasper','Olensby','Female','golensbyx@answers.com','(972) 9328328','08482 Springview Plaza','Dallas','Texas',75236,'United States'),
('Angelina','Koschek','Female','akoscheky@naver.com','(915) 8670688','6 Union Drive','El Paso','Texas',88541,'United States'),
('Ennis','Moffet','Male','emoffetz@ameblo.jp','(225) 7260030','1594 Forster Point','Baton Rouge','Louisiana',70815,'United States'),
('Timofei','Rau','Male','trau10@parallels.com','(205) 9324021','4599 Eagle Crest Road','Birmingham','Alabama',35236,'United States'),
('Mella','Bertin','Male','mbertin11@ucoz.com','(239) 5977929','13 David Park','Naples','Florida',33963,'United States'),
('Jeanna','Maffey','Male','jmaffey12@networkadvertising.org','(304) 6408264','7 Fuller Trail','Huntington','West Virginia',25716,'United States'),
('Therese','Darnell','Male','tdarnell13@who.int','(858) 7107809','3415 Sheridan Drive','San Francisco','California',94121,'United States'),
('Bone','Spickett','Male','bspickett14@gravatar.com','(402) 9063365','646 Monica Way','Lincoln','Nebraska',68531,'United States'),
('Emanuele','Moogan','Male','emoogan15@un.org','(919) 7532239','8 Kim Pass','Raleigh','North Carolina',27635,'United States'),
('Townsend','Antonazzi','Male','tantonazzi16@earthlink.net','(205) 9544121','2 Kinsman Place','Birmingham','Alabama',35290,'United States'),
('Maximilianus','Di Maria','Male','mdimaria17@newsvine.com','(215) 2382836','3 Mariners Cove Road','Philadelphia','Pennsylvania',19093,'United States'),
('Kerwinn','Kohrt','Male','kkohrt18@angelfire.com','(440) 4223344','40 Cambridge Road','Cleveland','Ohio',44177,'United States'),
('Felice','Cyster','Male','fcyster19@sciencedaily.com','(727) 6937216','3943 Swallow Point','Saint Petersburg','Florida',33731,'United States'),
('Jamesy','Kornas','Male','jkornas1a@wikia.com','(713) 6389825','3964 Waywood Junction','Houston','Texas',77090,'United States'),
('Kimmi','Flips','Male','kflips1b@marriott.com','(212) 7725554','8917 Green Crossing','New York City','New York',10120,'United States'),
('Wallie','Zanazzi','Male','wzanazzi1c@mtv.com','(502) 9925492','38 Sherman Junction','Louisville','Kentucky',40293,'United States'),
('Marijo','Audry','Male','maudry1d@privacy.gov.au','(305) 5119000','445 Clarendon Road','Naples','Florida',33961,'United States');




---insert purchases values
INSERT INTO purchases (customer_id, product_id, purchase_cost, purchase_quantity ,purchase_date )
VALUES
(1,10,50,1,'01/31/23'),
(1,7,85,1,'02/13/23'),
(3,6,70,1,'02/28/23'),
(3,5,35,1,'02/28/23'),
(5,2,40,1,'03/15/23'),
(6,4,20,1,'03/23/23'),
(6,7,85,1,'03/23/23'),
(6,12,45,1,'03/23/23'),
(9,8,30,1,'03/31/23'),
(9,11,35,1,'04/20/23'),
(11,2,40,1,'05/30/23'),
(11,3,30,1,'05/30/23'),
(13,1,50,1,'06/14/23'),
(13,7,85,1,'06/14/23'),
(13,8,30,1,'06/14/23'),
(16,1,50,1,'06/20/23'),
(16,1,50,1,'06/20/23'),
(18,1,50,1,'06/28/23'),
(18,7,85,1,'06/28/23'),
(18,10,50,1,'06/30/23'),
(18,7,85,1,'06/30/23'),
(22,7,85,1,'07/02/23'),
(22,1,50,1,'07/02/23'),
(24,8,30,1,'07/09/23'),
(25,5,35,1,'07/11/23'),
(26,1,50,1,'07/15/23'),
(27,7,85,1,'08/07/23'),
(28,7,85,1,'08/10/23'),
(29,3,30,1,'08/10/23'),
(30,2,40,1,'08/12/23'),
(30,4,20,1,'08/12/23'),
(32,8,30,1,'08/17/23'),
(33,9,30,1,'08/19/23'),
(34,8,30,1,'08/24/23'),
(35,9,30,1,'09/11/23'),
(36,1,50,1,'09/20/23'),
(37,2,40,1,'09/26/23'),
(37,1,50,1,'09/26/23'),
(38,2,40,1,'09/28/23'),
(40,5,35,1,'10/06/23'),
(40,6,70,1,'10/06/23'),
(42,5,35,1,'10/20/23'),
(43,6,70,1,'10/22/23'),
(44,10,50,1,'10/25/23'),
(45,10,50,1,'11/09/23'),
(45,1,50,1,'11/09/23'),
(47,5,35,1,'11/26/23'),
(48,6,70,1,'12/15/23'),
(49,9,30,1,'12/24/23'),
(49,10,50,1,'12/24/23');




select * from purchases
select * from products




 
---insert sentiments values

INSERT INTO  sentiments (sentiment_type)
VALUES
('Positive'),
('Neutral'),
('Negative');

SELECT * from sentiments



---insert feedbacks values
INSERT INTO feedbacks (customer_id, product_id, sentiment_id, feedback_rating, feedback_comments, feedback_date)
VALUES
(1,1,1,4,'I am in awe of the ''Shine Serum'' from AllKind Naturals—my hair is glistening with health!','06/10/23'),
(2,1,1,4,'After trying the ''Daily Facial Moisturizer,'' my skin feels nourished all day. Truly a game-changer for my skincare routine!','3/19/2024'),
(3,1,1,4,'The ''Rejuvenating Face Wash'' leaves my skin feeling invigorated and pure every morning. Couldn''t start my day without it!','12/05/23'),
(3,1,1,4,'AllKind Naturals'' ''Hydrating Shampoo'' has been a revelation for my dry hair. It’s like a deep drink of moisture!','3/25/2024'),
(4,1,1,4,'Ever since I discovered ''Body Lotion'' by AllKind Naturals, my skin has felt so supple and hydrated.','3/24/2024'),
(2,2,1,4,'The ''Curl Defining Cream'' has brought life back to my curls—definition without the usual stickiness.','11/06/23'),
(12,12,1,4,'Finding ''Exfoliating Body Scrub'' has been a blessing. It''s gentle yet effective, leaving my skin smooth and renewed.','12/14/2023'),
(14,11,1,4,'The ''Moisturizing Body Wash'' has transformed my shower experience into a hydrating retreat.','4/27/2023'),
(5,4,1,4,'AllKind Naturals'' ''Anti-Aging Cream'' is magic in a jar—my skin looks more youthful and radiant.','2/22/2023'),
(5,5,1,4,'I''ve used the ''Night Repair Serum'' for weeks, and the difference in my skin''s texture and tone is remarkable.','12/02/23'),
(1,6,1,4,'The ''Pore Refining Toner'' has become an essential part of my evening skincare—my pores look visibly reduced.','05/10/23'),
(1,7,1,4,'Back to the ''Hydrating Shampoo'' because nothing else leaves my hair feeling so moisturized and cared for.','10/27/2023'),
(9,9,1,4,'I get so many compliments on how vibrant my hair looks, all thanks to the ''Shine Serum''!','03/02/24'),
(8,2,1,4,'The ''Daily Facial Moisturizer'' doesn''t just hydrate—it rejuvenates. My skin is thankful for this product every day!','7/24/2023'),
(6,2,1,4,'I never knew what I was missing until I tried the ''Body Lotion.'' It’s the ultimate skin comfort after each shower.','05/04/23'),
(15,2,1,4,'The Hydrating Shampoo makes my hair feel so silky and rejuvenated!','07/08/23'),
(18,5,1,4,'Love the natural feel of the Daily Facial Moisturizer – it''s pure nourishment!','3/19/2023'),
(19,6,1,4,'Rejuvenating Face Wash is a morning ritual that leaves my skin glowing and fresh!','10/18/2023'),
(22,7,1,4,'Curl Defining Cream gives my curls life without any frizz – it''s fantastic!','11/22/2023'),
(22,8,1,4,'Shine Serum has brought a radiant sparkle to my hair – obsessed!','01/08/23'),
(15,9,1,4,'Exfoliating Body Scrub from AllKind Naturals is a gentle miracle for smooth skin.','11/18/2023'),
(8,10,1,4,'Moisturizing Body Wash is the ultimate hydration my skin craves.','05/07/23'),
(10,12,1,4,'The Body Lotion is so lush, my skin stays soft all day.','9/23/2023'),
(1,11,1,4,'Anti-Aging Cream has visibly reduced my fine lines – it''s like youth in a bottle!','6/22/2023'),
(2,1,1,4,'Night Repair Serum is my secret to waking up with a flawless complexion.','01/12/24'),
(3,2,1,5,'"A dab of ''Shine Serum'' and my hair is glossy and smooth for days."','01/12/23'),
(3,3,1,5,'"The ''Exfoliating Body Scrub'' has been my go-to for soft, exfoliated skin."','05/01/23'),
(4,4,1,5,'"I adore the ''Moisturizing Body Wash''—it''s my little secret for silky, hydrated skin."','1/21/2023'),
(5,5,1,5,'"The ''Body Lotion'' from AllKind is pure skin bliss, deeply moisturizing without being heavy."','6/30/2023'),
(6,6,1,5,'"Using the ''Rejuvenating Face Wash'' has made my mornings refreshing and my skin clear."','1/19/2024'),
(7,7,1,5,'"The ''Daily Facial Moisturizer'' keeps my face feeling soft and hydrated all day long."','1/21/2023'),
(8,4,1,5,'"I''m amazed at how the ''Anti-Aging Cream'' has visibly reduced my wrinkles."','1/25/2024'),
(9,4,1,5,'"''Night Repair Serum'' is like an overnight miracle for my facial skin."','01/02/24'),
(10,8,1,5,'"The ''Pore Refining Toner'' has become my favorite for a refined, smooth complexion."','11/22/2023'),
(22,8,1,5,'"The ''Hydrating Shampoo'' from AllKind Naturals is my must-have for soft, luscious locks."','04/04/24'),
(11,8,1,5,'"I trust the ''Strengthening Conditioner'' to keep my hair healthy and vibrant."','03/12/24'),
(15,8,1,5,'"''Curl Defining Cream'' keeps my curls looking their best, soft, and full of life."','7/16/2023'),
(16,8,1,5,'"Just a touch of ''Shine Serum'' and my hair shines like never before."','04/06/24'),
(20,8,1,5,'"AllKind''s ''Exfoliating Body Scrub'' is my weekly ritual for radiant, smooth skin."','7/18/2023'),
(10,4,1,5,'"The ''Moisturizing Body Wash'' is the ultimate in skin comfort and moisture."','11/23/2023'),
(45,3,2,3,'"The ''Hydrating Shampoo'' cleans well, though it doesn''t significantly enhance the softness of my hair."','8/23/2023'),
(42,2,2,3,'"Using the ''Moisturizing Body Wash'' is okay; it does the job but doesn''t leave my skin feeling particularly hydrated or dry."','5/14/2023'),
(47,1,2,3,'"The ''Strengthening Conditioner'' is decent. It conditions the hair but doesn''t seem to prevent breakage as much as I hoped."','05/01/23'),
(46,1,2,3,'"I found the ''Rejuvenating Face Wash'' to be fairly average—it cleans without causing breakouts, yet it isn''t particularly refreshing."','04/09/23'),
(44,2,2,3,'"The ''Body Lotion'' absorbs well, though the scent is neither pleasant nor unpleasant, just there."','11/02/23'),
(42,3,2,3,'"Applying the ''Curl Defining Cream'' gives some definition but does not completely control frizz or add shine."','5/30/2023'),
(41,4,2,3,'"The ''Shine Serum'' is fine; it adds a bit of gloss, though it''s not particularly noticeable or long-lasting."','11/12/23'),
(47,5,2,3,'"The ''Exfoliating Body Scrub'' works adequately, though it could be a bit more gentle on the skin."','6/21/2023'),
(48,6,2,3,'"The ''Daily Facial Moisturizer'' moisturizes without feeling too heavy or too light, quite balanced."','6/19/2023'),
(49,7,2,3,'"Using the ''Anti-Aging Cream'' hasn’t shown dramatic results, but it does moisturize the skin adequately."','3/13/2024'),
(41,8,2,3,'"The ''Night Repair Serum'' feels nice when applied, though I haven''t noticed any major changes in my skin’s appearance."','3/14/2023'),
(38,9,2,3,'"The ''Pore Refining Toner'' seems to cleanse the pores well, but I haven''t seen significant pore size reduction."','8/24/2023'),
(37,6,3,1,'"The ''Pore Refining Toner'' felt more like a harsh astringent, it was too drying and made my skin feel irritated."','1/21/2024'),
(36,3,3,1,'"I was excited about the ''Hydrating Shampoo'', but it ended up making my hair more tangled and difficult to manage."','03/06/23'),
(35,4,3,1,'"The ''Strengthening Conditioner'' didn’t seem to penetrate my thick hair; it just sat on the surface without any benefits."','3/27/2023'),
(34,1,3,1,'"I used the ''Curl Defining Cream'' for a few weeks and saw no improvement in the frizz or management of my curls."','6/21/2023'),
(33,2,3,1,'"This ''Hydrating Shampoo'' left my hair feeling more tangled than before; it''s quite drying and not at all what I was promised."','2/23/2023'),
(32,9,3,1,'"The ''Strengthening Conditioner'' feels heavy on my hair, as if it''s just sitting on the surface without really absorbing."','9/20/2023'),
(31,8,3,1,'"I tried the ''Curl Defining Cream'' hoping for defined curls, but instead, they were limp and the product felt greasy."','2/17/2024'),
(30,7,3,2,'"The ''Moisturizing Body Wash'' promised hydration but left my skin feeling tight and dry afterwards."','3/17/2024'),
(20,4,3,2,'"I dislike the strong scent of the ''Body Lotion''; it’s overwhelming and lingers too long on the skin."','4/24/2023'),
(21,5,3,2,'"The ''Rejuvenating Face Wash'' strips my face of moisture, making it feel tight and uncomfortable."','1/16/2023'),
(21,11,3,2,'"There were no noticeable effects from using the ''Daily Facial Moisturizer,'' it''s just too basic for my needs."','03/02/24'),
(21,12,3,2,'"Using the ''Anti-Aging Cream'' led to breakouts, which is frustrating given its claims to enhance skin quality."','03/07/24'),
(25,12,3,2,'"The ''Night Repair Serum'' has not brought any noticeable renewal to my skin; it still looks the same."','2/20/2023'),
(23,6,3,2,'"I had high hopes for the ''Pore Refining Toner,'' but it''s too drying and causes irritation every time I use it."','7/28/2023'),
(21,5,3,2,'"The ''Hydrating Shampoo'' doesn''t help with my hair''s manageability—it just becomes more tangled."','2/24/2024'),
(27,8,3,2,'"Despite using the ''Strengthening Conditioner,'' my hair feels heavy and coated, not soft and resilient."','08/11/23'),
(26,7,3,2,'"The ''Curl Defining Cream'' left my curls limp and lifeless instead of bouncy and radiant."','02/05/23'),
(25,2,3,2,'"After applying the ''Shine Serum,'' I was left with an oily sheen that felt greasy, not glossy."','12/22/2023'),
(24,8,3,2,'"The ''Exfoliating Body Scrub'' was disappointingly harsh, causing my skin to become irritated and red."','5/25/2023'),
(23,7,3,2,'"Despite promises of deep hydration, the ''Moisturizing Body Wash'' left my skin feeling dry and stripped."','07/12/23'),
(22,3,3,2,'The ''Hydrating Shampoo'' actually left my hair frizzier than before—it just didn''t work for me."','04/06/23'),
(21,4,3,2,'"After using the ''Moisturizing Body Wash'', my skin still felt dry and tight, not the hydration I was hoping for."','6/24/2023'),
(33,5,3,2,'"The ''Strengthening Conditioner'' seems to tangle my hair more, making it difficult to brush through."','7/24/2023');


--details of positive feedbacks related to products where the feedback comments contain the word "rejuvenating"

SELECT f.feedback_id, f.customer_id, f.product_id, s.sentiment_type, f.feedback_rating, f.feedback_comments, f.feedback_date
FROM feedbacks f
JOIN sentiments s ON f.sentiment_id = s.sentiment_id
JOIN products p ON f.product_id = p.product_id
WHERE f.feedback_comments LIKE '%rejuvenating%' 
AND s.sentiment_type = 'positive';



--feedback details where comments include "disappoint," joining feedbacks with sentiments and products tables based on related IDs

SELECT f.feedback_id, f.customer_id, f.product_id, s.sentiment_type, f.feedback_rating, f.feedback_comments, f.feedback_date
FROM feedbacks f
JOIN sentiments s ON f.sentiment_id = s.sentiment_id
JOIN products p ON f.product_id = p.product_id
WHERE f.feedback_comments LIKE '%disappoint%' 


--details of neutral feedback where comments include "adequate," using joins across feedbacks, sentiments, and products tables

SELECT f.feedback_id, f.customer_id, f.product_id, s.sentiment_type, f.feedback_rating, f.feedback_comments, f.feedback_date
FROM feedbacks f
JOIN sentiments s ON f.sentiment_id = s.sentiment_id
JOIN products p ON f.product_id = p.product_id
WHERE f.feedback_comments LIKE '%adequate%' 
AND s.sentiment_type = 'neutral';


--details of feedbacks with a "negative" sentiment type, joining feedbacks, sentiments, and products tables

SELECT f.feedback_id, f.customer_id, f.product_id, s.sentiment_type, f.feedback_rating, f.feedback_comments, f.feedback_date
FROM feedbacks f
JOIN sentiments s ON f.sentiment_id = s.sentiment_id
JOIN products p ON f.product_id = p.product_id
WHERE s.sentiment_type = 'negative';



--Retrieve all products purchased by a specific customer:

SELECT p.product_name
FROM purchases pu
JOIN products p ON pu.product_id = p.product_id
WHERE pu.customer_id = 6;

select*from customers
select*from purchases
select*from products



--

--Total purchase cost for each product
SELECT p.product_name, SUM(pu.purchase_cost) AS total_cost
FROM purchases pu
JOIN products p ON pu.product_id = p.product_id
GROUP BY p.product_name;



--Count the number of feedbacks for each product category:

SELECT pc.product_category, COUNT(f.feedback_id) AS num_feedbacks
FROM product_category pc
LEFT JOIN products p ON pc.product_category_id = p.product_category_id
LEFT JOIN feedbacks f ON p.product_id = f.product_id
GROUP BY pc.product_category;

--indexing

--Suppose you want to improve the performance of a query that frequently searches for products by name. You can create an index 
--on the product_name column in the products table to speed up these searches.

--drop index idx_product_name ON products;

-- Creating an index on product_name column in the products table

CREATE INDEX idx_product_name ON products (product_name);

-- Query using the indexed column
SELECT *
FROM products
WHERE product_name = 'Body Lotion';


--Suppose you want to maintain a history of purchases made by customers in a separate table purchases_history whenever
-- a new purchase is inserted into the purchases table.

-- Creating a trigger to insert purchase history

CREATE TRIGGER trg_insert_purchase_history
ON purchases
AFTER INSERT
AS
BEGIN
    INSERT INTO purchases_history (customer_id, product_id, purchase_cost, purchase_quantity, purchase_date)
    SELECT customer_id, product_id, purchase_cost, purchase_quantity, purchase_date
    FROM inserted;
END;

--This trigger will automatically insert a new record into the purchases_history table whenever a new purchase is added to the purchases table.







