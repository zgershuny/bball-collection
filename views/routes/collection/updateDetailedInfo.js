var express = require('express');
var router = express.Router();
var mysql = require('../dbcon.js');

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

var selectUpdateQuery = "SELECT dim_brand.brandID, dim_effect.effectID, dim_feature.featureID, dim_grading.gradingID, \n" +
    "dim_parallel.parallelID, dim_player.playerID, dim_sale.saleID, dim_series.seriesID, \n" +
    "dim_slab.slabID, dim_team.teamID, dim_year.yearID, fact_card.cardID\n" +
    "FROM fact_card\n" +
    "LEFT JOIN dim_series ON fact_card.seriesID = dim_series.seriesID\n" +
    "LEFT JOIN dim_brand ON dim_series.brandID = dim_brand.brandID\n" +
    "LEFT JOIN dim_year ON dim_series.yearID = dim_year.yearID\n" +
    "LEFT JOIN dim_team ON fact_card.teamID = dim_team.teamID\n" +
    "LEFT JOIN dim_player ON fact_card.playerID = dim_player.playerID\n" +
    "LEFT JOIN dim_slab ON fact_card.slabID = dim_slab.slabID\n" +
    "LEFT JOIN dim_grading ON dim_slab.gradingID = dim_grading.gradingID\n" +
    "LEFT JOIN dim_parallel ON fact_card.parallelID = dim_parallel.parallelID\n" +
    "LEFT JOIN dim_effect_parallel ON dim_parallel.parallelID = dim_effect_parallel.parallelID\n" +
    "LEFT JOIN dim_effect ON dim_effect_parallel.effectID = dim_effect.effectID\n" +
    "LEFT JOIN dim_feature ON fact_card.featureID = dim_feature.featureID\n" +
    "LEFT JOIN dim_sale ON fact_card.saleID = dim_sale.saleID\n" +
    "WHERE cardID=?";

/* Script to load the page */
router.post('/detailedInfo_update', function(req, res, next){
    var context = {};
    var display = {};

    context.cardID = req.body.cardID;
    context.saleID = req.body.saleID;
    context.seriesID = req.body.seriesID;
    context.brandID = req.body.brandID;
    context.effectID = req.body.effectID;
    context.parallelID = req.body.parallelID;
    context.featureID = req.body.featureID;
    context.playerID = req.body.playerID;
    context.slabID = req.body.slabID;
    context.teamID = req.body.teamID;
    context.yearID = req.body.yearID;
    context.gradingID = req.body.gradingID;

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
        res.render('collection/detailedInfo_update', display)
        });
});

/* actions for the page */
router.post('/detailedInfo_change', function(req, res, next){
    var context = {}

    // test to see if the values are passed to the query correctly
    console.log("check to see if the correct values are passed: ", req.body);

    context.cardID = req.body.cardID;
    context.saleID = req.body.saleID;
    context.seriesID = req.body.seriesID;
    context.brandID = req.body.brandID;
    context.effectID = req.body.effectID;
    context.parallelID = req.body.parallelID;
    context.featureID = req.body.featureID;
    context.playerID = req.body.playerID;
    context.slabID = req.body.slabID;
    context.teamID = req.body.teamID;
    context.yearID = req.body.yearID;
    context.yearID = req.body.s_price;

    // update year

    mysql.connection.query(selectUpdateQuery, [req.body.cardID], function(err, result){
        if(err){
            next(err);
            return;
        }
        console.log(1)
        if(result.length >= 1){
            var currentValue_year = result[0];

            mysql.connection.query("UPDATE dim_year SET year=? WHERE yearID=?",
                [
                    req.body['year'] || currentValue_year.year,
                    req.body.yearID
                ],

                function(err, result) {
                    if (err){
                        next(err);
                        return;
                    }
                });
        }

    });

    // update brand
    console.log("attempting to update brand");
    mysql.connection.query(selectUpdateQuery, [req.body.cardID], function(err, result){
        if(err){
            next(err);
            return;
        }
        console.log(2)
        if(result.length >= 1){
            var currentValue_brand = result[0];

            mysql.connection.query("UPDATE dim_brand SET b_name=? WHERE brandID=?",
                [
                    req.body['b_name'] || currentValue_brand.b_name,
                    req.body.brandID
                ],

                function (err, result) {
                    if (err) {
                        next(err);
                        return;
                    }
                    console.log("completed brand");
                });
        }
    });

    // update series
    console.log("attempting to update series");
    mysql.connection.query(selectUpdateQuery, [req.body.cardID], function(err, result){
        if(err){
            next(err);
            return;
        }
        if(result.length >= 1){
            var currentValue_series = result[0];

            mysql.connection.query("UPDATE dim_series SET s_name=? WHERE seriesID=?;",
                [
                    req.body['s_name'] || currentValue_series.s_name,
                    req.body.seriesID
                ],

                function (err, result) {
                    if (err) {
                        next(err);
                        return;
                    }
                    console.log("completed series");
                    console.log("after the query successfully implemented: ", req.body);

                });
        }
    });

    // update players
    console.log(3)
    console.log("attempting to update players");
    mysql.connection.query(selectUpdateQuery, [req.body.cardID], function(err, result) {
        if (err) {
            next(err);
            return;
        }
        if (result.length >= 1) {
            var currentValue_feature = result[0];

            var updateSaleQuery = "UPDATE dim_player SET p_fName=?, p_lName=? WHERE playerID=?;";

            mysql.connection.query(updateSaleQuery,
                [
                    req.body['p_fName'] || currentValue_feature.p_fName,
                    req.body['p_lName'] || currentValue_feature.p_lName,
                    req.body.playerID
                ],

                function (err, result) {
                    if (err) {
                        next(err);
                        return;
                    }
                    console.log("after the query successfully implemented: ", req.body);
                });
        }
    });


    // update teams
    console.log("attempting to update teams");
    mysql.connection.query(selectUpdateQuery, [req.body.cardID], function(err, result) {
        if (err) {
            next(err);
            return;
        }
        console.log(4)
        if (result.length >= 1) {
            var currentValue_feature = result[0];

            var updateSaleQuery = "UPDATE dim_team\n" +
                "SET location=?, t_name=?\n" +
                "WHERE teamID=?;\n";

            mysql.connection.query(updateSaleQuery,
                [
                    req.body['location'] || currentValue_feature.location,
                    req.body['t_name'] || currentValue_feature.t_name,
                    req.body.teamID
                ],

                function (err, result) {
                    if (err) {
                        next(err);
                        return;
                    }
                    console.log("after the query successfully implemented: ", req.body);
                });
        }
    });


    // update feature
    console.log("attempting to update feature");
    mysql.connection.query(selectUpdateQuery, [req.body.cardID], function(err, result) {
        if (err) {
            next(err);
            return;
        }
        console.log(5)
        if (result.length >= 1) {
            var currentValue_feature = result[0];

            var updateSaleQuery = "UPDATE dim_feature\n" +
                "SET f_name=?\n" +
                "WHERE featureID=?;\n";

            mysql.connection.query(updateSaleQuery,
                [
                    req.body['f_name'] || currentValue_feature.f_name,
                    req.body.featureID
                ],

                function (err, result) {
                    if (err) {
                        next(err);
                        return;
                    }
                    console.log("after the query successfully implemented: ", req.body);
                });
        }
    });


    // update card
    console.log("attempting to update card");
    mysql.connection.query(selectUpdateQuery, [req.body.cardID], function(err, result) {
        if (err) {
            next(err);
            return;
        }
        console.log(6)
        if (result.length >= 1) {
            var currentValue_card = result[0];
            currentValue_card.note = context.cardID;

            var updateSaleQuery = "UPDATE fact_card\n" +
                "SET numbered=?, out_of=?, note=?\n" +
                "WHERE cardID=?;\n";

            mysql.connection.query(updateSaleQuery,
                [
                    req.body['numbered'] || currentValue_card.numbered,
                    req.body['out_of'] || currentValue_card.out_of,
                    req.body['note'] || currentValue_card.note,
                    req.body.cardID
                ],

                function (err, result) {
                    if (err) {
                        next(err);
                        return;
                    }
                    console.log("after the query successfully implemented: ", req.body);
                });
        }
    });


    // update parallel
    console.log("attempting to update parallel");
    mysql.connection.query(selectUpdateQuery, [req.body.cardID], function(err, result) {
        if (err) {
            next(err);
            return;
        }
        console.log(7)
        if (result.length >= 1) {
            var currentValue_parallel = result[0];

            var updateSaleQuery = "UPDATE dim_parallel\n" +
                "SET p_name=?\n" +
                "WHERE parallelID=?;\n";

            mysql.connection.query(updateSaleQuery,
                [
                    req.body['p_name'] || currentValue_parallel.p_name,
                    req.body.parallelID
                ],

                function (err, result) {
                    if (err) {
                        next(err);
                        return;
                    }
                    console.log("after the query successfully implemented: ", req.body);
                });
        }
    });

    // update effect
    console.log("attempting to update effect");
    mysql.connection.query(selectUpdateQuery, [req.body.cardID], function(err, result) {
        if (err) {
            next(err);
            return;
        }
        console.log(8)
        if (result.length >= 1) {
            var currentValue_effect = result[0];

            var updateSaleQuery = "UPDATE dim_effect\n" +
                "SET e_name=?\n" +
                "WHERE effectID=?;"

            mysql.connection.query(updateSaleQuery,
                [
                    req.body['e_name'] || currentValue_effect.e_name,
                    req.body.effectID
                ],

                function (err, result) {
                    if (err) {
                        next(err);
                        return;
                    }
                    console.log("after the query successfully implemented: ", req.body);
                });
        }
    });

    // update grading company
    console.log("attempting to update grading company");
    mysql.connection.query(selectUpdateQuery, [req.body.cardID], function(err, result) {
        if (err) {
            next(err);
            return;
        }
        console.log(9)
        if (result.length >= 1) {
            var currentValue_grading = result[0];

            var updateSaleQuery = "UPDATE dim_grading\n" +
                "SET g_name=?\n" +
                "WHERE g_name=?;\n";

            console.log(3)
            mysql.connection.query(updateSaleQuery,
                [
                    req.body['g_name'] || currentValue_grading.g_name,
                    req.body.gradingID
                ],

                function (err, result) {
                    if (err) {
                        next(err);
                        return;
                    }
                    console.log("after the query successfully implemented: ", req.body);
                });
        }
    });


    // update slab
    console.log("attempting to update slabs");
    mysql.connection.query(selectUpdateQuery, [req.body.cardID], function(err, result) {
        if (err) {
            next(err);
            return;
        }
        console.log(10)
        if (result.length >= 1) {
            var currentValue_slabs = result[0];

            var updateSaleQuery = "UPDATE dim_slab\n" +
                "SET slab_number=?, Overall_Grade=?, Centering=?, Corners=?, Edges=?, Surface=?, Auto=?\n" +
                "WHERE dim_slab.slabID=?\n";

            mysql.connection.query(updateSaleQuery,
                [
                    req.body['slab_number'] || currentValue_slabs.slab_number,
                    req.body['Overall_Grade'] || currentValue_slabs.Overall_Grade,
                    req.body['Centering'] || currentValue_slabs.Centering,
                    req.body['Corners'] || currentValue_slabs.Corners,
                    req.body['Edges'] || currentValue_slabs.Edges,
                    req.body['Surface'] || currentValue_slabs.Surface,
                    req.body['Auto'] || currentValue_slabs.Auto,
                    req.body.slabID
                ],

                function (err, result) {
                    if (err) {
                        next(err);
                        return;
                    }
                    console.log("after the query successfully implemented: ", req.body);
                });
        }
    });

    // update sales
    mysql.connection.query(selectUpdateQuery, [req.body.cardID], function(err, result) {
        if (err) {
            next(err);
            return;
        }
        console.log(11)
        console.log("attempting to update sales");
        if (result.length >= 1) {
            var currentValue_sales = result[0];

            var updateSaleQuery = "UPDATE dim_sale\n" +
                "SET dim_sale.b_date=?, dim_sale.b_price=?, dim_sale.b_fees=?,\n" +
                "dim_sale.b_ship=?, dim_sale.s_date=?, dim_sale.s_price=?,\n" +
                "dim_sale.s_fees=?, dim_sale.s_ship=?\n" +
                "WHERE saleID=?";

            console.log(3)
            mysql.connection.query(updateSaleQuery,
                [
                    req.body['b_date'] || currentValue_sales.b_date,
                    req.body['b_price'] || currentValue_sales.b_price,
                    req.body['b_fees'] || currentValue_sales.b_fees,
                    req.body['b_ship'] || currentValue_sales.b_ship,
                    req.body['s_date'] || currentValue_sales.s_date,
                    req.body['s_price'] || currentValue_sales.s_price,
                    req.body['s_fees'] || currentValue_sales.s_fees,
                    req.body['s_ship'] || currentValue_sales.s_ship,
                    req.body.saleID
                ],

                function (err, result) {
                    if (err) {
                        next(err);
                        return;
                    }
                    console.log("after the query successfully implemented: ", req.body);
                    res.render('collection/collection');
                });
        }
    });
});


module.exports = router;