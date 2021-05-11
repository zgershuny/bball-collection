var express = require('express');
var router = express.Router();
var mysql = require('../dbcon.js');

router.get('/add', function(req, res, next) {
    var context = {};

    // display brand dropdown
    mysql.connection.query("SELECT dim_brand.brandID, dim_brand.b_name\n" +
        "FROM dim_brand\n" +
        "ORDER BY `b_name` ASC", function (err, result) {
        if (err) {
            console.log("error with prepop brands");
            next(err);
            return;
        }
        context.brand = result;

        // display series dropdown
        mysql.connection.query("SELECT dim_series.seriesID, dim_series.s_name, dim_series.yearID\n" +
            "FROM dim_series\n" +
            "ORDER BY `s_name` ASC", function (err, result) {
            if (err) {
                console.log("error with prepop brands");
                next(err);
                return;
            }
            context.series = result;

            // display player dropdown
            mysql.connection.query("SELECT dim_player.playerID, CONCAT(dim_player.p_fName, ' ', dim_player.p_lName) AS 'FullName'\n" +
                "FROM dim_player \n" +
                "ORDER BY `FullName` ASC", function (err, result) {
                if (err) {
                    console.log("error with prepop players");
                    next(err);
                    return;
                }
                context.player = result;

                // display team dropdown
                mysql.connection.query("SELECT dim_team.teamID, CONCAT(dim_team.location, ' ', dim_team.t_name) AS 'TeamName' \n" +
                    "FROM dim_team \n" +
                    "ORDER BY `TeamName` ASC", function (err, result) {
                    if (err) {
                        console.log("error with prepop teams");
                        next(err);
                        return;
                    }
                    context.team = result;

                    // display feature dropdown
                    mysql.connection.query("SELECT *\n" +
                        "FROM dim_feature\n" +
                        "ORDER BY dim_feature.f_name ASC", function (err, result) {
                        if (err) {
                            console.log("error with prepop features");
                            next(err);
                            return;
                        }
                        context.feature = result;

                        // display parallel dropdown
                        mysql.connection.query("SELECT dim_parallel.parallelID, dim_parallel.p_name\n" +
                            "FROM dim_parallel\n" +
                            "ORDER BY `p_name` ASC", function (err, result) {
                            if (err) {
                                console.log("error with prepop parallel");
                                next(err);
                                return;
                            }
                            context.parallel = result;

                            // display effect dropdown
                            mysql.connection.query("SELECT dim_effect.effectID, dim_effect.e_name\n" +
                                "FROM dim_effect \n" +
                                "ORDER BY `e_name` ASC", function (err, result) {
                                if (err) {
                                    console.log("error with prepop effect");
                                    next(err);
                                    return;
                                }
                                context.effect = result;

                                // display grading company dropdown
                                mysql.connection.query("SELECT dim_grading.gradingID, dim_grading.g_name\n" +
                                    "FROM dim_grading \n" +
                                    "ORDER BY `g_name` ASC", function (err, result) {
                                    if (err) {
                                        console.log("error with prepop grading company");
                                        next(err);
                                        return;
                                    }
                                    context.grading = result;
                                    res.render('add/add', context);

                                });// close grading company
                            }); // close effect
                        }); // close parallel
                    }); // close features
                }); // close teams
            }); // close players
        }); // close series
    }); // close brand


});

/* script to add card */
router.post('/add', function(req, res, next){
    var context = {};

    context.year = req.body['year'];
    context.brandID = req.body.brandID;
    context.seriesID = req.body.seriesID;
    context.playerID = req.body.playerID;
    context.teamID = req.body.teamID;
    context.featureID = req.body.featureID;
    context.numbered = req.body['numbered'];
    context.out_of = req.body['out_of'];
    context.parallelID = req.body.parallelID;
    context.effectID = req.body.effectID;
    context.gradingID = req.body.gradingID;
    context.slab_number = req.body['slab_number'];
    context.Overall_Grade = req.body['Overall_Grade'];
    context.Centering = req.body['Centering'];
    context.Corners = req.body['Corners'];
    context.Edges = req.body['Edges'];
    context.Surface = req.body['Surface'];
    context.Auto = req.body['Auto'];
    context.b_date = req.body['b_date'];
    context.b_price = req.body['b_price'];
    context.b_fees = req.body['b_fees'];
    context.b_ship = req.body['b_ship'];
    context.s_date = req.body['s_date'];
    context.s_price = req.body['s_price'];
    context.s_fees = req.body['s_fees'];
    context.s_ship = req.body['s_ship'];
    context.s_fees = req.body['s_fees'];
    context.s_ship = req.body['s_ship'];
    context.note = req.body['note'];


    // utilize Last_insert_ID, but multiple tables to insert into before adding the card
        // year
        // slab
        // sale
    // maybe move year to the fact_card table or use it as a dropdown menu
        /*long term: drop down may get too long after many years (ie having to scroll 10 years)
            makes sense to just enter it as a field in the fact_card and use distinct query
        short term: drop down is the quick fix but may have the issue with long term if one
        collects cards over the years - including vintage cards from the 50s!
        */
    // OR would it be possible to use last_insert_ID one table at a time
    /* add year
    Last insert year and update the card BUT a card can have only one year, and a year can have many cards
        insert card
        add slab
        update card via last insert id
        add sale
        update card via last insert id
    * */
}); // close script to add card

module.exports = router;