var express = require('express');
var router = express.Router();
var mysql = require('../dbcon.js');

var populateSlabsOnlySales = "SELECT dim_sale.saleID, b_date, b_price, b_fees, b_ship, s_date, s_price, s_fees, s_ship, s_price - (b_price + dim_sale.b_fees + dim_sale.b_ship + dim_sale.s_fees + dim_sale.s_ship) AS 'sale'\n" +
    "FROM dim_sale\n" +
    "LEFT JOIN fact_card ON dim_sale.saleID=fact_card.saleID\n" +
    "WHERE fact_card.slabID IS NOT NULL";

var populateNoSlabsOnlySales = "SELECT dim_sale.saleID, b_date, b_price, b_fees, b_ship, s_date, s_price, s_fees, s_ship, s_price - (b_price + dim_sale.b_fees + dim_sale.b_ship + dim_sale.s_fees + dim_sale.s_ship) AS 'sale'\n" +
    "FROM dim_sale\n" +
    "LEFT JOIN fact_card ON dim_sale.saleID=fact_card.saleID\n" +
    "WHERE fact_card.slabID IS NULL";

/* script to load the page */
router.get('/sales', function(req, res, next){
    var context = {};

    // display overall gain/loss
    mysql.connection.query("SELECT SUM(dim_sale.s_price) - SUM(dim_sale.b_price + dim_sale.b_fees + dim_sale.b_ship + dim_sale.s_fees + dim_sale.s_ship) AS 'ttl_sale',\n" +
        "dim_sale.saleID\n" +
        "FROM dim_sale", function(err, result){
        if(err){
            next(err);
            return;
        }
        context.sale = result;
    });

        // if slabs only is selected
        if(req.query.slabsOnly){
            mysql.connection.query(populateSlabsOnlySales, function(err, result){
                if(err){
                    console.log("error pop slabs only sales");
                    next(err);
                    return;
                }
                context.card_sale = result;
                console.log("populating slabs only collection completed");
                res.render('sales/sales', context);
            });
        }
        else if(req.query.noSlabs){
            mysql.connection.query(populateNoSlabsOnlySales, function(err, result){
                if(err){
                    console.log("error pop no slabs only sales");
                    next(err);
                    return;
                }
                context.card_sale = result;
                console.log("populating no slabs only collection completed");
                res.render('sales/sales', context);
            });
        }

        // if else no slabs selected

        // else (both)
        else{
            mysql.connection.query("SELECT saleID, b_date, b_price, b_fees, b_ship, s_date, s_price, s_fees, s_ship, s_price - (b_price + dim_sale.b_fees + dim_sale.b_ship + dim_sale.s_fees + dim_sale.s_ship) AS 'sale'\n" +
                "FROM dim_sale", function(err, result){
                if(err){
                    next(err);
                    return;
                }
                context.card_sale = result;
                res.render('sales/sales', context);
            });
        }


});

module.exports = router;