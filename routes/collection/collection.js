/* script to display */

var express = require('express');
var router = express.Router();
var mysql = require('../dbcon.js');

/* script to load the page */
router.get('/collection', function(req, res, next){
    var context = {};

    mysql.pool.query("SELECT dim_year.year AS 'year',\n" +
        "\tdim_brand.b_name AS 'product',\n" +
        "dim_series.s_name AS 'series',\n" +
        "dim_player.p_fName AS 'firstName',\n" +
        "dim_player.p_lName AS 'lastName',\n" +
        "dim_team.location, dim_team.t_name AS 'teamName',\n" +
        "IF(fact_card.slabID IS NULL, 'No', 'Yes') AS 'slab',\n" +
        "fact_card.cardID\n" +
        "FROM fact_card\n" +
        "LEFT JOIN dim_series ON fact_card.seriesID=dim_series.seriesID\n" +
        "LEFT JOIN dim_brand ON dim_series.brandID=dim_brand.brandID\n" +
        "LEFT JOIN dim_year ON dim_series.yearID=dim_year.yearID\n" +
        "LEFT JOIN dim_team ON fact_card.teamID=dim_team.teamID\n" +
        "LEFT JOIN dim_player ON fact_card.playerID=dim_player.playerID\n" +
        "LEFT JOIN dim_slab ON fact_card.slabID=dim_slab.slabID", function(err, result){
        if(err){
            next(err);
            return;
        }
        context.cards = result;
        res.render('collection/collection', context);
    });
});

module.exports = router;