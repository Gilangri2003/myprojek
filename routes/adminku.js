var multer = require('multer');

exports.login = function(req, res) {
    var message ='';
    var sess = req.session;
    var md5 = require('md5');

    if(req.method == 'POST'){
        var post = req.body;
        //2. tangkap nilai atribut nama dari form input username dan password
        var name = post.username;
        var pass = md5(post.password);
        req.getConnection(function(err, connect){
            var sql = "SELECT id_admin, username, name, admin_level FROM admin_tbl WHERE username='"+name+"' AND password='"+pass+"'";
            var query = connect.query (sql, function(err, results){
                if (results.length) {
                    //jika hasil query ada, daftarkan session dan alihkan ke halaman home!
                    req.session.adminId = results[0].id_admin;
                    req.session.admin = results[0];
                    console.log(results[0].id_admin);
                    res.redirect('./home');
                } else {
                    //jikz hasil query tidak ada, kirimkan error message dan tampilkan layout form login!
                    message = 'Username or password incorrect! Please try again.';
                    res.render('./admin/index', {
                    message : message,
                    
                    });
                }
            });
        });
        //jika route modulnya adalah POST, lakukan proses autentikasi login
    } else {
        // jika route methodnya bukan POST, tampilkan layout form login
        //1.tangkap nilai dari atribut pada body
        res.render('./admin/index', {
            message : message
            
            });
    //3.   
 }
}


exports.home = function(req, res) {
    var admin = req.session.admin;
    var adminId =  req.session.adminId;
    console.log('id_admin=' + adminId);

    if (adminId == null) {
        res.redirect('/admin/login');
        return;
    }


    req.getConnection(function(err, connect){
    var sql = "SELECT * FROM news_tbl ORDER BY createdate DESC";

    var query = connect.query(sql, function(err, results){
        //jika koreksi dan query berhasil tampilkan home admin
        
        res.render('./admin/home', {
            pathname: 'home',
            data : results
    });  
    });
});
} 

exports.add_news = function(req, res) {
    res.render('./admin/home', {
        pathname: 'add_news',
        
    });
} 

exports.Data_produk = function(req, res) {
    var admin = req.session.admin;
    var adminId =  req.session.adminId;
    console.log('id_admin=' + adminId);

    if (adminId == null) {
        res.redirect('/admin/login');
        return;
    }


    req.getConnection(function(err, connect){
    var sql = "SELECT * FROM news_tbl ORDER BY createdate DESC";

    var query = connect.query(sql, function(err, results){
        //jika koreksi dan query berhasil tampilkan home admin
        if(err){
            console.log(err);
        }
        console.log(results);
        res.render('./admin/home', {
            pathname: 'Data_produk',
            data : results
    });  
    });
});
}

exports.Data_user = function(req, res) {
    var admin = req.session.admin;
    var adminId =  req.session.adminId;
    console.log('id_admin=' + adminId);

    if (adminId == null) {
        res.redirect('/admin/login');
        return;
    }


    req.getConnection(function(err, connect){
    var sql = "SELECT * FROM data_user";

    var query = connect.query(sql, function(err, results){
        //jika koreksi dan query berhasil tampilkan home admin
        if(err){
            console.log(err);
        }
        console.log(results);
        res.render('./admin/home', {
            pathname: 'Data_User',
            data : results
    });  
    });
});
}

exports.Data_Brand = function(req, res) {
    var admin = req.session.admin;
    var adminId =  req.session.adminId;
    console.log('id_admin=' + adminId);

    if (adminId == null) {
        res.redirect('/admin/login');
        return;
    }


    req.getConnection(function(err, connect){
    var sql = "SELECT * FROM data_brand";

    var query = connect.query(sql, function(err, results){
        //jika koreksi dan query berhasil tampilkan home admin
        if(err){
            console.log(err);
        }
        console.log(results);
        res.render('./admin/home', {
            pathname: 'Data_Brand',
            data : results
    });  
    });
});
}


exports.edit_news = function(req, res) {
        //tangkap id_news dari link edit
        var id_news = req.params.id_news;

        req.getConnection(function(err, connect){
            var sql = "SELECT * FROM news_tbl WHERE id_news=?";

            var query = connect.query(sql, id_news, function(err, results){
                if (err) {
                    console.log('Error show news: %s', err);
                }
                res.render('./admin/home', {
                    id_news: id_news,
                    pathname: 'edit_news',
                    data:results
                });
            });
        });           
}

exports.Delete_news = function(req, res) {
    var id_news = req.params.id_news;

    req.getConnection(function(err, connect){
        var sql = "DELETE FROM news_tbl WHERE id_news =?";

        var query = connect.query(sql, id_news, function(err, results){
            if (err) {
                console.log("Error delete news: %s", err);
            }
            res.redirect('/admin/Data_produk');
        });
    });
}



exports.process_edit_news = function(req, res) {
    var storage = multer.diskStorage({     
        destination: '/public/dist/img',     
        filename: function(req, file, callback) {         
            callback(null, file.originalname);    
         }
         });
         var upload = multer({ storage: storage}).single('image');
         var date = new Date(Date.now());
         
         upload(req, res, function(err){
             if (err) {
                 var image = req.body.image_old;
                 console.log("Error uploading image!");
             } else if ( req.file == undefined) {
                 var image = req.body.image_old;
             }else {
                 var image = req.file.filename;
             }
             console.log(req.file);
             console.log(req.body);
             req.getConnection(function(err, connect){
                //tangkap nilai atau value dr body (atribut name)
                var post = {
                   
                   title: req.body.namaproduk,
                   description: req.body.deskripsi,
                   harga_normal: req.body.harganormal,
                   harga_diskon: req.body.hargadiskon,
                   images : image
                  
                }
                var sql = "UPDATE news_tbl SET ? WHERE id_news=?";
                var query = connect.query(sql, [post, req.body.id_news], 
                    function(err, results) {
                        if(err){
                            console.log("Error edit_news: %s", err);
                        }
                        res.redirect('/admin/Data_produk');
             });
        });
     });
}

exports.process_add_news = function(req, res) { 
    var storage = multer.diskStorage({     
        destination: '/public/dist/img',     
        filename: function(req, file, callback) {         
            callback(null, file.originalname);    
         }
         }); 

         var upload = multer({ storage: storage}).single('gambar');
         var date = new Date(Date.now());

         upload(req, res, function(err){
             if (err) {
                 return res,end('Error uploading image!');
             }
             console.log(req.file);
             console.log(req.body);

             req.getConnection(function(err, connect){
                 //tangkap nilai atau value dr body (atribut name)
                 var post = {
                    
                    title: req.body.namaproduk,
                    description: req.body.deskripsi,
                    harga_normal: req.body.harganormal,
                    harga_diskon: req.body.hargadiskon,
                    images : req.file.filename,
                   
                 }
                 console.log(post); //untuk menampilkan data post di console

                 var sql = "INSERT INTO news_tbl SET ?";
                 var query = connect.query(sql, post, function(err, results){
                     if (err) {
                        console.log('Error input news: %5', err);
                     }
                     res.redirect('/admin/Data_produk');
                 });
             });
         });
} 

