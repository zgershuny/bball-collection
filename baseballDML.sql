/* SQL queries to be used for the project */

/*
READ QUERIES TO DISPLAY RESULTS
*/

-- display from oldest to newest cards by year
SELECT dim_year.year AS 'Year',
	CONCAT(dim_brand.b_name, ' ', dim_series.s_name) AS 'Product',
	CONCAT(dim_team.location, ' ', dim_team.t_name) AS 'TeamName',
	CONCAT(dim_player.p_fName, ' ', dim_player.p_lName) AS 'FullName',
 	dim_slab.`Overall Grade`
  FROM fact_card
  LEFT JOIN dim_series ON fact_card.seriesID=dim_series.seriesID
  LEFT JOIN dim_brand ON dim_series.brandID=dim_brand.brandID
  LEFT JOIN dim_year ON dim_series.yearID=dim_year.yearID
  LEFT JOIN dim_team ON fact_card.teamID=dim_team.teamID
  LEFT JOIN dim_player ON fact_card.playerID=dim_player.playerID
  LEFT JOIN dim_slab ON fact_card.slabID=dim_slab.slabID
  ORDER BY `Year` ASC

-- display from newest to oldest cards by year

SELECT dim_year.year AS 'Year',
	CONCAT(dim_brand.b_name, ' ', dim_series.s_name) AS 'Product',
	CONCAT(dim_team.location, ' ', dim_team.t_name) AS 'TeamName',
	CONCAT(dim_player.p_fName, ' ', dim_player.p_lName) AS 'FullName',
    dim_slab.`Overall Grade`
    FROM fact_card
    LEFT JOIN dim_series ON fact_card.seriesID=dim_series.seriesID
    LEFT JOIN dim_brand ON dim_series.brandID=dim_brand.brandID
    LEFT JOIN dim_year ON dim_series.yearID=dim_year.yearID
    LEFT JOIN dim_team ON fact_card.teamID=dim_team.teamID
    LEFT JOIN dim_player ON fact_card.playerID=dim_player.playerID
    LEFT JOIN dim_slab ON fact_card.slabID=dim_slab.slabID
    ORDER BY `Year` DESC


-- display from Z to A team names

SELECT dim_year.year AS 'Year',
	CONCAT(dim_brand.b_name, ' ', dim_series.s_name) AS 'Product',
	CONCAT(dim_team.location, ' ', dim_team.t_name) AS 'TeamName',
	CONCAT(dim_player.p_fName, ' ', dim_player.p_lName) AS 'FullName',
    dim_slab.`Overall Grade`
    FROM fact_card
    LEFT JOIN dim_series ON fact_card.seriesID=dim_series.seriesID
    LEFT JOIN dim_brand ON dim_series.brandID=dim_brand.brandID
    LEFT JOIN dim_year ON dim_series.yearID=dim_year.yearID
    LEFT JOIN dim_team ON fact_card.teamID=dim_team.teamID
    LEFT JOIN dim_player ON fact_card.playerID=dim_player.playerID
    LEFT JOIN dim_slab ON fact_card.slabID=dim_slab.slabID
    ORDER BY `TeamName` DESC

-- display from A to Z team names

SELECT dim_year.year AS 'Year',
	CONCAT(dim_brand.b_name, ' ', dim_series.s_name) AS 'Product',
	CONCAT(dim_team.location, ' ', dim_team.t_name) AS 'TeamName',
	CONCAT(dim_player.p_fName, ' ', dim_player.p_lName) AS 'FullName',
    dim_slab.`Overall Grade`
    FROM fact_card
    LEFT JOIN dim_series ON fact_card.seriesID=dim_series.seriesID
    LEFT JOIN dim_brand ON dim_series.brandID=dim_brand.brandID
    LEFT JOIN dim_year ON dim_series.yearID=dim_year.yearID
    LEFT JOIN dim_team ON fact_card.teamID=dim_team.teamID
    LEFT JOIN dim_player ON fact_card.playerID=dim_player.playerID
    LEFT JOIN dim_slab ON fact_card.slabID=dim_slab.slabID
    ORDER BY `TeamName` ASC


-- display from A to Z players
SELECT dim_year.year AS 'Year',
	CONCAT(dim_brand.b_name, ' ', dim_series.s_name) AS 'Product',
	CONCAT(dim_team.location, ' ', dim_team.t_name) AS 'TeamName',
	CONCAT(dim_player.p_fName, ' ', dim_player.p_lName) AS 'FullName',
    dim_slab.`Overall Grade`
    FROM fact_card
    LEFT JOIN dim_series ON fact_card.seriesID=dim_series.seriesID
    LEFT JOIN dim_brand ON dim_series.brandID=dim_brand.brandID
    LEFT JOIN dim_year ON dim_series.yearID=dim_year.yearID
    LEFT JOIN dim_team ON fact_card.teamID=dim_team.teamID
    LEFT JOIN dim_player ON fact_card.playerID=dim_player.playerID
    LEFT JOIN dim_slab ON fact_card.slabID=dim_slab.slabID
    ORDER BY `FullName` DESC

-- display from Z to A players
SELECT dim_year.year AS 'Year',
	CONCAT(dim_brand.b_name, ' ', dim_series.s_name) AS 'Product',
	CONCAT(dim_team.location, ' ', dim_team.t_name) AS 'TeamName',
	CONCAT(dim_player.p_fName, ' ', dim_player.p_lName) AS 'FullName',
    dim_slab.`Overall Grade`
    FROM fact_card
    LEFT JOIN dim_series ON fact_card.seriesID=dim_series.seriesID
    LEFT JOIN dim_brand ON dim_series.brandID=dim_brand.brandID
    LEFT JOIN dim_year ON dim_series.yearID=dim_year.yearID
    LEFT JOIN dim_team ON fact_card.teamID=dim_team.teamID
    LEFT JOIN dim_player ON fact_card.playerID=dim_player.playerID
    LEFT JOIN dim_slab ON fact_card.slabID=dim_slab.slabID
    ORDER BY `FullName` ASC

-- display from highest to lowest grade (not slabbed cards)
SELECT dim_year.year AS 'Year',
	CONCAT(dim_brand.b_name, ' ', dim_series.s_name) AS 'Product',
	CONCAT(dim_team.location, ' ', dim_team.t_name) AS 'TeamName',
	CONCAT(dim_player.p_fName, ' ', dim_player.p_lName) AS 'FullName',
    dim_slab.`Overall Grade`
    FROM fact_card
    LEFT JOIN dim_series ON fact_card.seriesID=dim_series.seriesID
    LEFT JOIN dim_brand ON dim_series.brandID=dim_brand.brandID
    LEFT JOIN dim_year ON dim_series.yearID=dim_year.yearID
    LEFT JOIN dim_team ON fact_card.teamID=dim_team.teamID
    LEFT JOIN dim_player ON fact_card.playerID=dim_player.playerID
    LEFT JOIN dim_slab ON fact_card.slabID=dim_slab.slabID
    ORDER BY `Overall Grade` DESC

-- display from not slabbed cards to highest grade
SELECT dim_year.year AS 'Year',
	CONCAT(dim_brand.b_name, ' ', dim_series.s_name) AS 'Product',
	CONCAT(dim_team.location, ' ', dim_team.t_name) AS 'TeamName',
	CONCAT(dim_player.p_fName, ' ', dim_player.p_lName) AS 'FullName',
    dim_slab.`Overall Grade`
    FROM fact_card
    LEFT JOIN dim_series ON fact_card.seriesID=dim_series.seriesID
    LEFT JOIN dim_brand ON dim_series.brandID=dim_brand.brandID
    LEFT JOIN dim_year ON dim_series.yearID=dim_year.yearID
    LEFT JOIN dim_team ON fact_card.teamID=dim_team.teamID
    LEFT JOIN dim_player ON fact_card.playerID=dim_player.playerID
    LEFT JOIN dim_slab ON fact_card.slabID=dim_slab.slabID
    ORDER BY `Overall Grade` ASC

-- display specific details about the card

SELECT
  dim_year.year AS 'Year',
  CONCAT(dim_brand.b_name, ' ', dim_series.s_name) AS 'Product',
  CONCAT(dim_team.location, ' ', dim_team.t_name) AS 'TeamName',
  CONCAT(dim_player.p_fName, ' ', dim_player.p_lName) AS 'FullName',
  fact_card.featureID,
  fact_card.`#d`, fact_card.`out of`,
  CONCAT(dim_parallel.p_name, ' ', dim_effect.e_name) AS 'Effects',
  dim_grading.`g_name`,
  dim_slab.`slab_number`,
  dim_slab.`Overall Grade`,
  dim_slab.`Centering`,
  dim_slab.`Corners`,
  dim_slab.`Edges`,
  dim_slab.`Surface`,
  dim_slab.`Auto`,
  dim_sale.b_price,
  dim_sale.b_fees,
  dim_sale.b_ship,
  dim_sale.s_price,
  dim_sale.s_fees,
  dim_sale.s_ship,
  fact_card.note
FROM
  fact_card
  LEFT JOIN dim_series ON fact_card.seriesID = dim_series.seriesID
  LEFT JOIN dim_brand ON dim_series.brandID = dim_brand.brandID
  LEFT JOIN dim_year ON dim_series.yearID = dim_year.yearID
  LEFT JOIN dim_team ON fact_card.teamID = dim_team.teamID
  LEFT JOIN dim_player ON fact_card.playerID = dim_player.playerID
  LEFT JOIN dim_slab ON fact_card.slabID = dim_slab.slabID
  LEFT JOIN dim_grading ON dim_slab.gradingID = dim_grading.gradingID
  LEFT JOIN dim_parallel ON fact_card.parallelID = dim_parallel.parallelID
  LEFT JOIN dim_effect ON dim_parallel.effectID = dim_effect.effectID
  LEFT JOIN dim_feature ON fact_card.featureID = dim_feature.featureID
  LEFT JOIN dim_sale ON fact_card.saleID = dim_sale.saleID

  
/*SEARCH QUERIES TO FIND SOMETHING SPECIFIC*/

-- Find grades by grade
SELECT dim_slab.gradingID, 
	dim_slab.slab_number, 
	dim_slab.`Overall Grade`
FROM dim_slab
Where dim_slab.`Overall Grade`=:input_Overall_Grade
ORDER BY dim_slab.`Overall Grade` ASC

-- Find Teams by Location Only
SELECT dim_team.teamID, dim_team.location, dim_team.t_name
FROM dim_team
WHERE dim_team.location=:input_location
ORDER BY dim_team.t_name ASC

-- Find Teams by Name only
SELECT dim_team.teamID, dim_team.location, dim_team.t_name
FROM dim_team
WHERE dim_team.t_name=:input_t_name
ORDER BY dim_team.t_name ASC

-- Find Teams by Location and Name
SELECT dim_team.teamID, dim_team.location, dim_team.t_name 
FROM dim_team
WHERE dim_team.location=:input_location AND dim_team.t_name=input_t_name
ORDER BY dim_team.location ASC

-- Find Players by First Name
SELECT dim_player.playerID, dim_player.p_fName, dim_player.p_lName 
FROM dim_player
WHERE dim_player.p_fName=:input_p_fName
ORDER BY dim_player.p_fName ASC

-- Find Players by Last Name
SELECT dim_player.playerID, dim_player.p_fName, dim_player.p_lName 
FROM dim_player
WHERE dim_player.p_lName=:input_p_lName
ORDER BY dim_player.p_lName ASC

-- Find Players by First and Last Name
SELECT dim_player.p_fName, dim_player.p_lName
FROM Players
WHERE dim_player.p_fName=:input_p_fName AND dim_player.p_lName=:input_p_lName
ORDER BY dim_player.p_lName ASC

-- Find all the teams the player played for
SELECT CONCAT(dim_team.location, ' ', dim_team.t_name) AS 'TeamName'
FROM fact_card
LEFT JOIN dim_player ON fact_card.playerID=dim_player.playerID
LEFT JOIN dim_team ON fact_card.teamID=dim_team.teamID
WHERE dim_player.playerID=:input_playerID
ORDER BY 'TeamName' ASC

-- Find all the players were on the team
CONCAT(dim_player.p_f_name, ' ', dim_player.l_name) AS 'FullName'
FROM fact_card
LEFT JOIN dim_player ON fact_card.playerID=dim_player.playerID
LEFT JOIN dim_team ON fact_card.teamID=dim_team.teamID
WHERE dim_team.teamID=:input_teamID
ORDER BY 'FullName' ASC

/* QUERIES FOR DYNAMIC DROPDOWN MENUS*/

-- prepopulated teams
SELECT dim_team.teamID, CONCAT(dim_team.location, ' ', dim_team.t_name) AS 'TeamName' 
FROM dim_team 
ORDER BY `TeamName` ASC

-- prepopulated players
SELECT dim_player.playerID, CONCAT(dim_player.p_fName, ' ', dim_player.p_lName) AS 'FullName'
FROM dim_player 
ORDER BY `FullName` ASC

-- prepopulate years
SELECT dim_year.yearID, dim_year.year
FROM dim_year 
ORDER BY `Year` ASC

-- prepopulate rarest to most common #ds
SELECT fact_card.cardID, fact_card.`#d`, fact_card.`out of` 
FROM fact_card 
ORDER BY `out of` ASC

-- prepopulate effects
SELECT dim_effect.effectID, dim_effect.e_name
FROM dim_effect 
ORDER BY `e_name` ASC

-- prepopulate colors
SELECT dim_parallel.parallelID, dim_parallel.p_name
FROM dim_parallel
ORDER BY `p_name` ASC

-- Prepopulate colors and effects
SELECT dim_parallel.parallelID,
dim_parallel.p_name, dim_effect.effectID, dim_effect.e_name
FROM dim_parallel
LEFT JOIN dim_effect ON dim_parallel.effectID=dim_effect.effectID
ORDER BY `p_name` ASC

-- prepopulate grading companies
SELECT dim_grading.gradingID, dim_grading.g_name
FROM dim_grading 
ORDER BY `g_name` ASC

-- prepopulate overall grades
SELECT dim_slab.gradingID, dim_slab.`Overall Grade` 
FROM dim_slab 
ORDER BY `Overall Grade` ASC

-- prepopulate Centering Grade
SELECT dim_slab.gradingID, dim_slab.`Centering`
FROM dim_slab 
ORDER BY `Centering` ASC

--prepopulate Corners grade
SELECT dim_slab.gradingID, dim_slab.`Corners`
FROM dim_slab 
ORDER BY `Corners` ASC

--prepopulate Edges grade
SELECT dim_slab.gradingID, dim_slab.`Edges`
FROM dim_slab 
ORDER BY `Edges` ASC

-- prepopulate surface grade
SELECT dim_slab.gradingID, dim_slab.`Surface`
FROM dim_slab 
ORDER BY `Surface` ASC

-- prepopulate auto grade grade
SELECT dim_slab.gradingID, dim_slab.`Auto`
FROM dim_slab 
ORDER BY `Auto` ASC

-- prepopulate brands
SELECT dim_brand.brandID, dim_brand.b_name
FROM dim_brand
ORDER BY `b_name` ASC

-- prepopulate series
SELECT dim_series.seriesID, dim_series.s_name, dim_series.yearID
FROM dim_series
ORDER BY `s_name` ASC

-- prepopulate brands and series
SELECT dim_brand.brandID, dim_brand.b_name,
dim_series.seriesID, dim_series.s_name, dim_series.yearID
FROM dim_series
LEFT JOIN dim_brand ON dim_series.brandID=dim_brand.brandID
ORDER BY `b_name` ASC

-- prepopulate the identified features in the database
SELECT *
FROM dim_feature
WHERE EXISTS 
	(SELECT fact_card.featureID
    FROM fact_card
    WHERE dim_feature.featureID=fact_card.featureID)
ORDER BY dim_feature.f_name ASC


/* QUERIES TO DISPLAY THE SALES */

-- display the total purchase price
SELECT SUM(dim_sale.b_fees + dim_sale.b_price + dim_sale.b_ship) AS 'Purchased Totals'
FROM dim_sale

-- display total b_price
SELECT SUM(dim_sale.b_price) AS 'Total Bought Price'
FROM dim_sale

-- display total b_ship
SELECT SUM(dim_sale.b_ship) AS 'Total Shipping Costs'
FROM dim_sale

-- display total fees spent 
SELECT SUM(dim_sale.b_fees) AS 'Total Fees Cost'
FROM dim_sale

-- display the total sold price
SELECT SUM(dim_sale.s_price) - SUM(dim_sale.s_fees + dim_sale.s_ship) AS 'Sold Totals'
FROM dim_sale

-- display the total gains/loss
SELECT SUM(dim_sale.s_price) - SUM(dim_sale.b_price + dim_sale.b_fees + dim_sale.b_ship + dim_sale.s_fees + dim_sale.s_ship) AS 'Total Gains/Loss'
FROM dim_sale

-- display total b_price
SELECT SUM(dim_sale.s_price) AS 'Total Sold Price'
FROM dim_sale

-- display total b_ship
SELECT SUM(dim_sale.s_ship) AS 'Total Shipping Costs'
FROM dim_sale

-- display total fees spent 
SELECT SUM(dim_sale.s_fees) AS 'Total Fees Cost'
FROM dim_sale

-- display total b_price for one card
SELECT dim_sale.b_price AS 'Purchase Price'
FROM fact_card
LEFT JOIN dim_sale ON fact_card.saleID=dim_sale.saleID
WHERE fact_card.saleID=:input_saleID

-- display total b_ship for one card
SELECT dim_sale.b_ship AS 'Shipping Cost'
FROM fact_card
LEFT JOIN dim_sale ON fact_card.saleID=dim_sale.saleID
WHERE fact_card.saleID=:input_saleID

-- display total fees spent for one card
SELECT dim_sale.b_fees AS 'Fees Cost'
FROM fact_card
LEFT JOIN dim_sale ON fact_card.saleID=dim_sale.saleID
WHERE fact_card.saleID=:input_saleID

-- display total s_price for one card
SELECT dim_sale.s_price AS 'Sold Price'
FROM fact_card
LEFT JOIN dim_sale ON fact_card.saleID=dim_sale.saleID
WHERE fact_card.saleID=:input_saleID

-- display total s_ship for one card
SELECT dim_sale.s_ship AS 'Shipping Cost'
FROM fact_card
LEFT JOIN dim_sale ON fact_card.saleID=dim_sale.saleID
WHERE fact_card.saleID=:input_saleID

-- display total fees spent for one card
SELECT dim_sale.s_fees AS 'Fees Cost'
FROM fact_card
LEFT JOIN dim_sale ON fact_card.saleID=dim_sale.saleID
WHERE fact_card.saleID=:input_saleID

-- display the gains/loss three months ago 
SELECT SUM(dim_sale.s_price) - SUM(dim_sale.b_price + dim_sale.b_fees + dim_sale.b_ship + dim_sale.s_fees + dim_sale.s_ship) AS 'Gains/Loss'
FROM dim_sale
WHERE MONTH(dim_sale.s_date) = MONTH(CURRENT_DATE()) - 3

-- display the gains/loss last month
SELECT SUM(dim_sale.s_price) - SUM(dim_sale.b_price + dim_sale.b_fees + dim_sale.b_ship + dim_sale.s_fees + dim_sale.s_ship) AS 'Gains/Loss'
FROM dim_sale
WHERE MONTH(dim_sale.s_date) = MONTH(CURRENT_DATE()) - 1

-- display the gains/loss current month
SELECT SUM(dim_sale.s_price) - SUM(dim_sale.b_price + dim_sale.b_fees + dim_sale.b_ship + dim_sale.s_fees + dim_sale.s_ship) AS 'Gains/Loss'
FROM dim_sale
WHERE MONTH(dim_sale.s_date) = MONTH(CURRENT_DATE())

-- display the gains/loss last year
SELECT SUM(dim_sale.s_price) - SUM(dim_sale.b_price + dim_sale.b_fees + dim_sale.b_ship + dim_sale.s_fees + dim_sale.s_ship) AS 'Gains/Loss'
FROM dim_sale
WHERE YEAR(dim_sale.s_date) = YEAR(CURRENT_DATE()) - 1

-- display the gains/loss current year
SELECT SUM(dim_sale.s_price) - SUM(dim_sale.b_price + dim_sale.b_fees + dim_sale.b_ship + dim_sale.s_fees + dim_sale.s_ship) AS 'Gains/Loss'
FROM dim_sale
WHERE YEAR(dim_sale.s_date) = YEAR(CURRENT_DATE())

-- display the gains/loss last seven days week
SELECT SUM(dim_sale.s_price) - SUM(dim_sale.b_price + dim_sale.b_fees + dim_sale.b_ship + dim_sale.s_fees + dim_sale.s_ship) AS 'Gains/Loss'
FROM dim_sale
WHERE DAY(dim_sale.s_date) >= DAY(CURRENT_DATE()) - 7

-- display the gaians/loss in a custom date inputted by the user
SELECT SUM(dim_sale.s_price) - SUM(dim_sale.b_price + dim_sale.b_fees + dim_sale.b_ship + dim_sale.s_fees + dim_sale.s_ship) AS 'Gains/Loss' 
FROM dim_sale 
WHERE dim_sale.s_date >=:input_start_date
	AND dim_sale.s_date <=:input_end_date

-- display the gaians/loss for a specific date
SELECT SUM(dim_sale.s_price) - SUM(dim_sale.b_price + dim_sale.b_fees + dim_sale.b_ship + dim_sale.s_fees + dim_sale.s_ship) AS 'Gains/Loss' 
FROM dim_sale 
WHERE dim_sale.s_date =:input_date

/*UPDATE QUERIES to edit the information 
--- CANNOT edit features on the front end because the features are always the same across various cards */

-- Edit Players first AND last name
UPDATE `dim_player` SET `p_fName`=:input_p_fName,`p_lName`=:input_p_lName WHERE dim_player.playerID=:input_playerID

-- Edit Players first name
UPDATE `dim_player` SET `p_fName`=:input_p_fName WHERE dim_player.playerID=:input_playerID

-- Edit Players last name
UPDATE `dim_player` SET `p_lName`=:input_p_lName WHERE dim_player.playerID=:input_playerID

-- Edit Teams Info location AND name
UPDATE `dim_team` SET `location`=:input_location, `t_name`=:input_t_name WHERE dim_team.teamID=:input_teamID

-- Edit Teams Info location 
UPDATE `dim_team` SET `location`=:input_location WHERE dim_team.teamID=:input_teamID

-- Edit Teams Info name
UPDATE `dim_team` SET `t_name`=:input_t_name WHERE dim_team.teamID=:input_teamID

-- Edit Series -- the user will be able update the field individually
		-- change brandID
UPDATE `dim_series` SET `brandID`=:input_brandID WHERE dim_series.brandID=:input_brandID
		
		-- change the series name
UPDATE `dim_series` SET `s_name`=:input_s_name WHERE dim_series.brandID=:input_brandID

		-- change the year
UPDATE `dim_series` SET `year`=:input_year WHERE dim_series.brandID=:input_brandID

-- Edit Sales -- a form will be rendered with prepopulated fields to update the sales
UPDATE `dim_sale` 
SET `b_date`=:input_b_date,`b_price`=:input_b_price,`b_fees`=:input_b_fees,
	`b_ship`=:input_b_ship, `s_date`=:input_s_date,`s_price`=:input_s_price,
	`s_fees`=:input_s_fees,`s_ship`=:input_s_ship 
WHERE dim_sale.saleID=:input_saleID

-- Edit Slabs -- a form will be rendered with prepopulated fields to update the slab info
UPDATE `dim_slab` SET `gradingID`=:input_gradingID,`slab_number`=:input_slab_number,
	`Overall_Grade`=:input_Overall_Grade, `Centering`=:input_Centering,
	`Corners`=:input_Corners,`Edges`=:input_Edges,
	`Surface`=:input_Surface,`Auto`=:input_Auto 
WHERE dim_slab.slabID=:input_slabID

-- Edit Grading
UPDATE `dim_grading` SET `g_name`=:input_g_name WHERE dim_grading.gradingID=:input_gradingID
-- Edit Parallel -- the user will be able update the field individually 

-- Edit Effect
UPDATE `dim_effect` SET `e_name`=:input_e_name WHERE dim_brand.effectID=:input_effectID

-- Edit Brand
UPDATE `dim_brand` SET `b_name`=:input_b_name WHERE dim_brand.brandID=:input_brandID

-- Edit Year
UPDATE `dim_year` SET `year`=:input_year WHERE dim_year.yearID=:input_yearID

-- Edit Card -- the user will be able update the field individually 
-- except for sale and slabID because they are one to one relationships
-- sale and slab entities can be updated separately in a batch in one form
UPDATE `fact_card` SET `seriesID`=:input_seriesID,`teamID`=:input_teamID,
	`playerID`=:input_playerID,`featureID`=:input_featureID,`parallelID`=:input_parallelID,
	`#d`=:input_parallelID,`out of`=:input_out_of,`note`=:input_note 
WHERE fact_card.cardID=:input_cardID

/*CREATE QUERIES to add new information for each entity*/

-- add new brand
INSERT INTO `dim_brand`(`brandID`, `b_name`)
VALUES(:input_brandID, :input_b_name)

-- add new effect
INSERT INTO `dim_effect`(`effectID`, `e_name`)
VALUES (:input_effectID,:input_e_name)

-- add new feature -- will need a code/logic to calculate the next bit
INSERT INTO `dim_feature`(`featureID`, `f_name`) 
VALUES (:input_featureID, :input_f_name)

-- add new grading
INSERT INTO `dim_grading`(`gradingID`, `g_name`) 
VALUES (:input_gradingID, :input_g_name)

-- add new parallel. effectID can be plural.
INSERT INTO `dim_parallel`(`parallelID`, `p_name`, `effectID`) 
VALUES (:input_parallelID, :input_p_name, :input_effectID)

-- add new player
INSERT INTO `dim_player`(`playerID`, `p_fName`, `p_lName`) 
VALUES (:input_playerID, :input_pfName, :input_p_lName)

-- add new sale
INSERT INTO `dim_sale`(`saleID`, `b_date`, `b_price`, `b_fees`, 
	`b_ship`, `s_date`, `s_price`, `s_fees`, `s_ship`) 
VALUES (:input_saleID, :input_b_date, :input_b_price, :input_b_fees, 
	:input_b_ship, :input_s_date, :input_s_price, :input_s_ship)

-- add new series
INSERT INTO `dim_series`(`seriesID`, `brandID`, `s_name`, `yearID`) 
VALUES (:input_seriesID, :input_brandID, :input_s_name, :input_yearID)

-- add new slab
INSERT INTO `dim_slab`(`slabID`, `gradingID`, `slab_number`, 
	`Overall Grade`, `Centering`, `Corners`, `Edges`, `Surface`, `Auto`)
VALUES (:input_slabID, input_gradingID, input_slab_number,
	:input_Overall_Grade, :input_Centering, :input_Corners, 
	:input_Edges, :input_Surface, :input_Auto)

-- add new team
INSERT INTO `dim_team`(`teamID`, `location`, `t_name`) 
VALUES (:input_teamID, :input_location, :input_t_name)

-- add new year
INSERT INTO `dim_year`(`yearID`, `year`) 
VALUES (:input_yearID, :input_year)

-- add new card. will also need to do another sql batch associate the card with other entities
INSERT INTO `fact_card`(`cardID`, `saleID`, `seriesID`, `teamID`, 
	`playerID`, `featureID`, `parallelID`, `slabID`, `#d`, `out of`, `note`) 
VALUES (:input_cardID, :input_saleID, input_seriesID, input_teamID,
	:input_playerID, :input_featureID, :input_parallelID, 
	:input_slabID, :input_numbered, :input_outof, :input_note)

/*DELETE QUERIES for each entity 
(as if the user entered as a mistake
otherwise it should not be used) */

-- delete brand
DELETE FROM `dim_brand` WHERE dim_brand.brandID=:input_dim_brand

-- delete feature
DELETE FROM `dim_feature` WHERE dim_feature.featureID=:input_dim_feature

-- delete grading
DELETE FROM `dim_grading` WHERE dim_grading.gradingID=:input_dim_grading

-- delete slab
DELETE FROM `dim_slab` WHERE dim_slab.slabID=:input_slabID

-- delete the card and its slab and sale if associated
DELETE FROM `fact_card`, `dim_sale`, `dim_slab`
USING `fact_card`
LEFT JOIN `dim_sale` ON fact_card.saleID = dim_sale.saleID
LEFT JOIN `dim_slab` ON fact_card.slabID = dim_slab.slabID
WHERE fact_card.cardID=:input_cardID

-- delete parallel
DELETE FROM `dim_parallel` WHERE dim_parallel.parallelID=:input_parallelID

-- delete effect
DELETE FROM `dim_effect` WHERE dim_effect.effectID=:input_effectID

-- delete the parallel effect association
DELETE FROM `dim_effect_parallel` WHERE dim_effect_parallel.joinID=:input_joinID

-- delete player
DELETE FROM `dim_player` WHERE dim_player.playerID=:input_playerID

-- delete team
DELETE FROM `dim_team` WHERE dim_team.teamID=:input_teamID

-- delete year
DELETE FROM `dim_year` WHERE dim_year.yearID=:input_yeardID