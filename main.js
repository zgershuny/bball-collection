/* Main app file for the project */

const express = require('express');
const path = require('path');
const bodyParser = require('body-parser');
const handlebars = require('express-handlebars').create({defaultLayout:'main'});

// Express app
var app = express();

// Public Directory
app.use(express.static(path.join(__dirname, '/public')));

// Bodyparser
app.use(bodyParser.urlencoded({extended: false}));
app.use(bodyParser.json());

// Handlebars
app.engine('handlebars', handlebars.engine);
app.set('view engine', 'handlebars');

// Port
app.set('port', 7777);

/* ROUTES FOR ALL PAGES */

// Home
app.use(require('./routes/home'));

// Collection
app.use(require('./routes/collection/collection'));
app.use(require('./routes/collection/detailedInfo'));
app.use(require('./routes/collection/updateDetailedInfo'));
app.use(require('./routes/collection/deleteCard'));

// sales
app.use(require('./routes/sales/sales'));
app.use(require('./routes/sales/updateSale'));

// 404 - No Page Error
app.use(function(req, res){
    res.status(404);
    res.render('404');
});

// 500 - Server Error
app.use(function(err, res, next){
    res.status(500);
    res.render('500');
});

// Console Output to confirm express is running
app.listen(app.get('port'), function(){
    console.log('Express started on http://localhost:' + app.get('port') + '; press Ctrl+C to terminate.');
});