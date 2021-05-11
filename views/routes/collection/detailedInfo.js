var express = require('express');
var router = express.Router();
var mysql = require('../dbcon.js');

/* display the card's specific info*/
router.post('/detailedInfo', function(req, res, next){
    var context = {};
    var display = {};

    context.cardID = req.body.cardID;

    var detailedInfoQuery = "SELECT\n" +
        "  dim_year.year AS year,\n" +
        "  dim_brand.b_name,\n" +
        "  dim_series.s_name,\n" +
        "  dim_team.location, dim_team.t_name,\n" +
        "  dim_player.p_fName, dim_player.p_lName,\n" +
        "  fact_card.featureID,\n" +
        "  fact_card.numbered, fact_card.out_of,\n" +
        "  dim_parallel.p_name, dim_effect.e_name,\n" +
        "  dim_feature.f_name,\n" +
        "  dim_grading.`g_name`,\n" +
        "  dim_slab.`slab_number`,\n" +
        "  dim_slab.`Overall_Grade` AS 'Overall_Grade',\n" +
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
        "  dim_sale.saleID,\n" +
        "  dim_series.seriesID,\n" +
        "  dim_brand.brandID,\n" +
        "  dim_grading.gradingID,\n" +
        "  dim_year.yearID,\n" +
        "  dim_team.teamID,\n" +
        "  dim_slab.slabID,\n" +
        "  dim_player.playerID,\n" +
        "  dim_feature.featureID,\n" +
        "  dim_parallel.parallelID,\n" +
        "  dim_effect.effectID,\n" +
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

    mysql.connection.query(detailedInfoQuery,
        [
            req.body.cardID
        ],

        function(err, result){
        if(err){
            next(err);
            return;
        }
        display.card = result;
        res.render('collection/detailedInfo_view', display)
        });
});




module.exports = router;