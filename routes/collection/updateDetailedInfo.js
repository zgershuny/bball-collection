var express = require('express');
var router = express.Router();
var mysql = require('../dbcon.js');

var detailedInfoQuery = "SELECT\n" +
    "  dim_year.year AS 'Year',\n" +
    "  CONCAT(dim_brand.b_name, ' ', dim_series.s_name) AS 'Product',\n" +
    "  CONCAT(dim_team.location, ' ', dim_team.t_name) AS 'TeamName',\n" +
    "  CONCAT(dim_player.p_fName, ' ', dim_player.p_lName) AS 'FullName',\n" +
    "  fact_card.featureID,\n" +
    "  CONCAT(fact_card.`#d`, '/', fact_card.`out of`) AS 'Numbered',\n" +
    "  CONCAT(dim_parallel.p_name, ' ',  dim_effect.e_name) AS 'Effects',\n" +
    "  dim_grading.`g_name`,\n" +
    "  dim_slab.`slab_number`,\n" +
    "  dim_slab.`Overall Grade` AS 'Overall_Grade',\n" +
    "  dim_slab.`Centering`,\n" +
    "  dim_slab.`Corners`,\n" +
    "  dim_slab.`Edges`,\n" +
    "  dim_slab.`Surface`,\n" +
    "  dim_slab.`Auto`,\n" +
    "  dim_sale.b_price,\n" +
    "  dim_sale.b_fees,\n" +
    "  dim_sale.b_ship,\n" +
    "  dim_sale.s_price,\n" +
    "  dim_sale.s_fees,\n" +
    "  dim_sale.s_ship,\n" +
    "  fact_card.cardID,\n" +
    "  fact_card.note\n" +
    "FROM\n" +
    "  fact_card\n" +
    "  LEFT JOIN dim_series ON fact_card.seriesID = dim_series.seriesID\n" +
    "  LEFT JOIN dim_brand ON dim_series.brandID = dim_brand.brandID\n" +
    "  LEFT JOIN dim_year ON dim_series.yearID = dim_year.yearID\n" +
    "  LEFT JOIN dim_team ON fact_card.teamID = dim_team.teamID\n" +
    "  LEFT JOIN dim_player ON fact_card.playerID = dim_player.playerID\n" +
    "  LEFT JOIN dim_slab ON fact_card.slabID = dim_slab.slabID\n" +
    "  LEFT JOIN dim_grading ON dim_slab.gradingID = dim_grading.gradingID\n" +
    "  LEFT JOIN dim_parallel ON fact_card.parallelID = dim_parallel.parallelID\n" +
    "  LEFT JOIN dim_effect_parallel ON dim_parallel.parallelID = dim_effect_parallel.parallelID\n" +
    "  LEFT JOIN dim_effect ON dim_effect_parallel.effectID = dim_effect.effectID\n" +
    "  LEFT JOIN dim_feature ON fact_card.featureID = dim_feature.featureID\n" +
    "  LEFT JOIN dim_sale ON fact_card.saleID = dim_sale.saleID\n" +
    "WHERE cardID=?";

/* Script to load the page */
router.post('/detailedInfo_update', function(req, res, next){
    var context = {};
    var display = {};

    context.cardID = req.body.cardID;

    mysql.pool.query(detailedInfoQuery,
        [
            req.body.cardID
        ],

        function(err, result){
        if(err){
            next(err);
            return;
        }
        display.card = result;
        res.render('collection/detailedInfo_update', display)
        });
});

/* actions for the page */

// Update the card
/*router.post('/detailedInfo_update', function(req, res, next){
    var context = {}

    context.cardID = req.body.cardID;

    mysql.pool.query(detailedInfoQuery,
        [
            req.body.cardID
        ],

        function(err){
        if(err){
            next(err);
            return;
        }
        //update if user entered values
            if(result.length >= 1{
                var currentValue = result[0];

                var updataeAllQuery= "UPDATE SELECT\n" +
                    "  dim_year.year AS 'Year',\n" +
                    "  CONCAT(dim_brand.b_name, ' ', dim_series.s_name) AS 'Product',\n" +
                    "  CONCAT(dim_team.location, ' ', dim_team.t_name) AS 'TeamName',\n" +
                    "  CONCAT(dim_player.p_fName, ' ', dim_player.p_lName) AS 'FullName',\n" +
                    "  fact_card.featureID,\n" +
                    "  CONCAT(fact_card.`#d`, '/', fact_card.`out of`) AS 'Numbered',\n" +
                    "  CONCAT(dim_parallel.p_name, ' ',  dim_effect.e_name) AS 'Effects',\n" +
                    "  dim_grading.`g_name`,\n" +
                    "  dim_slab.`slab_number`,\n" +
                    "  dim_slab.`Overall Grade` AS 'Overall_Grade',\n" +
                    "  dim_slab.`Centering`,\n" +
                    "  dim_slab.`Corners`,\n" +
                    "  dim_slab.`Edges`,\n" +
                    "  dim_slab.`Surface`,\n" +
                    "  dim_slab.`Auto`,\n" +
                    "  dim_sale.b_price,\n" +
                    "  dim_sale.b_fees,\n" +
                    "  dim_sale.b_ship,\n" +
                    "  dim_sale.s_price,\n" +
                    "  dim_sale.s_fees,\n" +
                    "  dim_sale.s_ship,\n" +
                    "  fact_card.cardID,\n" +
                    "  fact_card.note\n" +
                    "FROM\n" +
                    "  fact_card\n" +
                    "  LEFT JOIN dim_series ON fact_card.seriesID = dim_series.seriesID\n" +
                    "  LEFT JOIN dim_brand ON dim_series.brandID = dim_brand.brandID\n" +
                    "  LEFT JOIN dim_year ON dim_series.yearID = dim_year.yearID\n" +
                    "  LEFT JOIN dim_team ON fact_card.teamID = dim_team.teamID\n" +
                    "  LEFT JOIN dim_player ON fact_card.playerID = dim_player.playerID\n" +
                    "  LEFT JOIN dim_slab ON fact_card.slabID = dim_slab.slabID\n" +
                    "  LEFT JOIN dim_grading ON dim_slab.gradingID = dim_grading.gradingID\n" +
                    "  LEFT JOIN dim_parallel ON fact_card.parallelID = dim_parallel.parallelID\n" +
                    "  LEFT JOIN dim_effect_parallel ON dim_parallel.parallelID = dim_effect_parallel.parallelID\n" +
                    "  LEFT JOIN dim_effect ON dim_effect_parallel.effectID = dim_effect.effectID\n" +
                    "  LEFT JOIN dim_feature ON fact_card.featureID = dim_feature.featureID\n" +
                    "  LEFT JOIN dim_sale ON fact_card.saleID = dim_sale.saleID\n" +
                    "WHERE cardID=?";
            });
        })

})*/

module.exports = router;