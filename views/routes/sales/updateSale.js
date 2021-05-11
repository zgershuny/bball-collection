var express = require('express');
var router = express.Router();
var mysql = require('../dbcon.js');

/* script to load the page */
router.post('/updateSale', function(req, res, next){
    var context = {};

    // pass on the values to the form

    context.saleID = req.body.saleID;
    context.b_date = req.body.b_date;
    context.b_price = req.body.b_price;
    context.b_fees = req.body.b_fees;
    context.b_ship = req.body.b_ship;
    context.s_date = req.body.s_date;
    context.s_price = req.body.s_price;
    context.s_fees = req.body.s_fees;
    context.s_ship = req.body.s_ship;
    console.log("check to see values are retrieved: ", req.body);
    res.render('sales/updateSale_form', context);
})

/* actions for the page */
router.post('/updateSale_update', function(req, res, next){
    var context = {};

    context.saleID = req.body.saleID;
    // context.b_date = req.body.b_date;
    // context.b_price = req.body.b_price;
    // context.b_fees = req.body.b_fees;
    // context.b_ship = req.body.b_ship;
    // context.s_date = req.body.s_date;
    // context.s_price = req.body.s_price;
    // context.s_fees = req.body.s_fees;
    // context.s_ship = req.body.s_ship;

    // Find all values for the specific card's sale

    console.log("req body to check values have passed to find the saleID: ", req.body); //debug to check saleID has passed

    // find the sale ID
    mysql.connection.query("SELECT saleID\n" +
        "FROM dim_sale\n" +
        "WHERE saleID=?", [req.body.saleID], function(err, result){
        if(err){
            next(err);
            return;
        }

        console.log(2)
        // update if user entered values
        if (result.length >= 1){
            var currentValue = result[0];

            var updateSaleQuery = "UPDATE dim_sale\n" +
                "SET dim_sale.b_date=?, dim_sale.b_price=?, dim_sale.b_fees=?,\n" +
                "dim_sale.b_ship=?, dim_sale.s_date=?, dim_sale.s_price=?,\n" +
                "dim_sale.s_fees=?, dim_sale.s_ship=?\n" +
                "WHERE saleID=?";

            console.log(3)
            mysql.connection.query(updateSaleQuery,
                [
                    req.body['b_date'] || currentValue.b_date,
                    req.body['b_price'] || currentValue.b_price,
                    req.body['b_fees'] || currentValue.b_fees,
                    req.body['b_ship'] || currentValue.b_ship,
                    req.body['s_date'] || currentValue.s_date,
                    req.body['s_price'] || currentValue.s_price,
                    req.body['s_fees'] || currentValue.s_fees,
                    req.body['s_ship'] || currentValue.s_ship,
                    req.body.saleID
                ],

                function(err, result){
                if(err){
                    next(err);
                    return;
                }
                    console.log(4);
                    console.log("after the query successfully implemented: ", req.body);
                    res.render('sales/sales');
                });
        }
    });

});



module.exports = router;