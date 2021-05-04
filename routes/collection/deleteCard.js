var express = require('express');
var router = express.Router();
var mysql = require('../dbcon.js');


// Delete Card
router.post('/deleteCard', function(req, res, next){
    var context = {};
    context.cardID = req.body.cardID;

    // find the card
    mysql.pool.query("SELECT cardID, saleID, seriesID, teamID, playerID, featureID, parallelID, slabID, '#d', 'out of', note FROM fact_card WHERE cardID=?", [context.cardID],
        function(err, result){
            if(err){
                next(err);
                return;
            }

            // delete the card
            mysql.pool.query("DELETE FROM `fact_card`, `dim_sale`, `dim_slab`\n" +
                "USING `fact_card`\n" +
                "LEFT JOIN `dim_sale` ON fact_card.saleID = dim_sale.saleID\n" +
                "LEFT JOIN `dim_slab` ON fact_card.slabID = dim_slab.slabID\n" +
                "WHERE fact_card.cardID=?", [req.body.cardID],
                function(err, result){
                    if(err){
                        next(err);
                        return;
                    }
                    res.render('collection/deleteCard_confirmed');
                });
        });
});

module.exports = router;