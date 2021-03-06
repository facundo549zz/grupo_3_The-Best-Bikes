var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');

const methodOverride = require('method-override');
const session = require('express-session');
const localsCheck = require('./middlewares/localsUserCheck');
var logMiddlewares = require('./middlewares/logMiddlewares');

var indexRouter = require('./routes/index');
var productsRouter = require('./routes/products');
var usersRouter= require('./routes/users');
var storeRouter = require('./routes/store');


var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, '../public')));

app.use(logMiddlewares);
app.use(methodOverride('_method'))
app.use(session({secret:"TheBestBikes"}));
app.use(localsCheck);

app.use('/', indexRouter);
app.use('/store', storeRouter);
app.use('/users', usersRouter);
app.use('/products', productsRouter);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};
});

module.exports = app;
