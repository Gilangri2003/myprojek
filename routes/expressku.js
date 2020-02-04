exports.index = function (req, res) {
   req.getConnection(function (err, connect){
       var query = connect.query('SELECT * FROM news_tbl LIMIT 8', function (err, rows){
           if (err) {
               console.log('Error message: %', err);
           }
           res.render('index', {
               page_title: "Express News",
               data : rows
           });
       });
   });
    
}

exports.shopping_cart = function (req, res) {
    req.getConnection(function (err, connect){
        var query = connect.query('SELECT * FROM news_tbl LIMIT 4', function (err, rows){
            if (err) {
                console.log('Error message: %', err);
            }
            res.render('shopping_cart', {
                page_title: "Express News",
                data : rows
            });
        });
    });
}

exports.login = function (req, res) {
    var username = req.session.userNama;
    if(username !==null){
        username = "";
    }
    var message = '';
    if(req.method == 'POST'){
        var post= req.body;
        var email= post.email;
        var pass= post.password;
        req.getConnection(function(err, connect){
            var sql = "SELECT * FROM data_user where email='"+email+"' and password= '"+pass+"'";
            console.log(sql);
            var query = connect.query(sql, function(err, results){
                if(results.length){
                    req.session.userId=results[0].email
                    req.session.user=results[0];
                    req.session.Nama_user=results[0].Nama_user
                    console.log(results[0].id_user);
                    res.redirect('/');
                }else{
                    message="username or password inkurel";
                    res.render('./login',
                    {
                        message:message,
                        path:'login',
                        username:username
                    });
                }
            });
        });
    }else{
        res.render('./login',
        {
            message:message,
            path:'login',
            username:username
        });
    }
}

exports.register =  function(req, res){
    var message = '';

        var post={
            email:req.body.email,
            nama:req.body,Nama_user,
            password:req.body.password,
            no_hp:req.body.nomor
        }
        req.getConnection(function(err, connect){
            var sql = "insert into data_user set?";
            var query = connect.query(sql,post, function(err, results){
                if(err){
                    console.log("error register %s", err);
                    message="username or password inkurek";
                    res.render('./index',
                    {
                        message : message,
                        path: 'login',
                    });
                }
                res.redirect('/login');
            });
        });
}
exports.product_page = function(req, res) {
    req.getConnection(function (err, connect){
        var query = connect.query('SELECT * FROM news_tbl LIMIT 4', function (err, rows){
            if (err) {
                console.log('Error message: %', err);
            }
            res.render('product_page', {
                page_title: "Express News",
                data : rows
            });
        });
    });
}

exports.chek_out = function (req, res) {
    req.getConnection(function (err, connect){
        var query = connect.query('SELECT * FROM news_tbl LIMIT 4', function (err, rows){
            if (err) {
                console.log('Error message: %', err);
            }
            res.render('chek_out', {
                page_title: "Express News",
                data : rows
            });
        });
    });
}

exports.categoris = function (req, res) {
    req.getConnection(function(err, connect){
        var query = connect.query('SELECT * FROM news_tbl LIMIT 4', function (err, rows){
            if (err) {
                console.log('Error message: %', err);
            }
            res.render('categoris', {
                page_title: "Express News",
                data : rows
            });
        });
    });
}


exports.contact = function (req, res) {
    req.getConnection(function(err, connect){
        var query = connect.query('SELECT * FROM news_tbl LIMIT 4', function (err, rows){
            if (err) {
                console.log('Error message: %', err);
            }
            res.render('contact', {
                page_title: "Express News",
                data : rows
            });
        });
    });
}

exports.register = function(req, res) {
    req.getConnection(function(err, connect){
        var query =  connect.query(' * FROM news_tbl LIMIT 4', function (err, rows){
            if (err) {
                console.log('Error message %', err);
            }
            res.render('register', {
                page_title: "Express News",
                data: rows
            });
        } );
    });
}