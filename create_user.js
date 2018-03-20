var mongoose = require('mongoose');
var configDB = require('./config/database.js');
var modelUser = require('./app/models/user.js');

mongoose.connect(configDB.url);

var user = process.env.ADMIN_USER || 'admin';
var password = process.env.ADMIN_PASS || 'redboard';

var objUser = modelUser();
var hash = objUser.generateHash(password);

var admin = new modelUser ({ "local" : {
    "password" : hash,
    "username" : user, "isAdmin" : true
}});

console.log('[*]'+user+':'+password+':'+hash);

admin.save(function (err) {if (err) console.log ('Error creating user!')});

mongoose.connection.close();