var express = require('express');
var router = express.Router();
var mysql = require('../dbcon.js');

/* script to load the page */
router.get('/sales', function(req, res, next){
    var context = {};

    mysql.pool.query("SELECT SUM(dim_sale.s_price) - SUM(dim_sale.b_price + dim_sale.b_fees + dim_sale.b_ship + dim_sale.s_fees + dim_sale.s_ship) AS 'ttl_sale'\n" +
        "FROM dim_sale", function(err, result){
        if(err){
            next(err);
            return;
        }
        context.sale = result;
        res.render('sales/sales', context);
    });
});

module.exports = router;