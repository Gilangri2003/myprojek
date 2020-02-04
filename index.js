var express = require('express');
var app = express();
var logger = require('morgan');
var path = require('path');
var bodyParser = require('body-parser');
var session = require('express-session');


var expressku = require('./routes/expressku');
var adminku = require('./routes/adminku');

var conn = require('express-myconnection');
var mysql = require('mysql');

app.set('port', process.env.port || 3000);
app.set('view engine', 'ejs');

app.use(logger('dev'));
//app.use('/public' , express.static(__dirname + '/public'));
app.use('/public', express.static(path.join(__dirname, '/public')));
app.use(bodyParser.urlencoded({extended:false}));


app.use(
    conn(mysql, {
        host:'127.0.0.1',
        user: 'root',
        password:"",
        database:'expresstes'
    }, 'single')
);

app.use(
    session({
        secret: 'babastudio',
        resave:false,
        saveUninitialized:true,
        cookie: { maxAge:120000}
    })
);


// folder untuk front end developer
app.get('/', expressku.index);
app.get('/index', expressku.index);
app.get('/shopping_cart', expressku.shopping_cart);
app.get('/login', expressku.login);
app.post('/login', expressku.login);
app.get('/register', expressku.register);
app.post('/register', expressku.register);
app.get('/product_page', expressku.product_page);
app.get('/chek_out', expressku.chek_out);
app.get('/categoris', expressku.categoris);
app.get('/contact', expressku.contact);



// folder untuk back end developer
app.get('/admin', adminku.login);
app.get('/admin/login', adminku.login);
app.post('/admin/login', adminku.login);
app.get('/admin/home', adminku.home);
app.get('/admin/add_news', adminku.add_news);
app.post('/admin/add_news',  adminku.process_add_news);
app.post('/admin/Data_produk', adminku.Data_produk);
app.get('/admin/edit_news/:id_news', adminku.edit_news);
app.post('/admin/edit_news/:id_news',  adminku.process_edit_news);
app.get('/admin/Data_produk', adminku.Data_produk);
app.get('/admin/Data_Brand', adminku.Data_Brand);
app.get('/admin/Data_user', adminku.Data_user);
app.get('/admin/Delete_news/:id_news', adminku.Delete_news);

app.listen(app.get('port'), function(){
    console.log('server is running on port ' + app.get('port'));

});

