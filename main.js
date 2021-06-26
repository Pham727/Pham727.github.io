var express = require('express');
var app =express();
app.set('view engine','ejs');
var publicDir = require('path').join(__dirname,'/public'); 
app.use(express.static(publicDir));
app.use(express.json());
app.use(express.urlencoded({extended:true}))
//Su dung Session
var session = require('express-session');
app.use(session({
    resave: true, 
    saveUninitialized: true, 
    secret: '1234567abc', 
    cookie: { maxAge: 60000 }}));
var danhmuc=require('./controllers/category');
var sanpham=require('./controllers/product')
const { Console } = require('console');
const { render } = require('ejs');
app.get('/',function(req,res){
    HienThi(req,res);
 });
 async function HienThi(req,res)
 {
     var dssanphamnoibat=await sanpham.selectsanphamnoibat();
     var dssanphamganday=await sanpham.selectsanphamnoibat();
     res.render('index',{spnoibat:dssanphamnoibat,spganday:dssanphamganday}); 
 }
 
 app.get('/contact',function(req,res){
     res.render('contact');
 });

app.get('/login',function(req,res){
    res.render('login');
});

app.get('/resset',function(req,res){
    res.render('ressetpassword');
});

app.get('/register',function(req,res){
    res.render('registration');
});

 async function HienThiDsSanPham(req, res,maloai)
{
    var danhmucsanpham= await danhmuc.select();
    var dssanpham=await sanpham.select(maloai);
    res.render('product-list',{danhmucsp:danhmucsanpham,danhsachsanpham:dssanpham});
}

 app.get('/cart',function(req,res){
     res.render('cart');
 })
 
 app.get('/checkout',function(req,res){
     res.render('checkout');
 })
 app.post('/search',function(req,res){
	var tensanpham=req.body.tensp;
	HienThiTimKiem(res,tensanpham);
})

app.get('/detail',function(req,res){
    res.render('product-detail');
});

async function HienThiTimKiem(res,tensanpham)
{  
	var dsachtimkiem=await sanpham.timKiem(tensanpham);
	res.render('product_search',{dstimkiem:dsachtimkiem});
}

 app.get('/:maloai', function(req, res) {
	var maloai=req.params.maloai;
	if(isNaN(maloai)==false)
	{
        HienThiDsSanPham(req,res,maloai); 
    }
    else if(maloai=="product"){
        HienThiDsSanPham(req,res,"");
    }
   
});

/*async function dangki(req,res,hoten,tendn,matkhau,ho_ten,dia_chi,so_dt,email)
{
	var kh= await khachhang.dangki(tendn,matkhau,ho_ten,dia_chi,so_dt,email);
	req.session.kh=kh;
	HienThi(req,res,1);
}

app.post('/dangki', function(req, res) {
	var ttdangki=req.body;	
	tendn=ttdangki.ten_dn;
	matkhau=ttdangki.mat_khau;
	matkhau_xacnhan=ttdangki.ma_khau1; 
	ho_ten=ttdangki.ho_ten;
	email=ttdangki.email;
	dia_chi=ttdangki.dia_chi;
	so_dt=ttdangki.so_dt;
	console.log(tendn);
	console.log(ho_ten);

	register(req,res,tendn,matkhau,ho_ten,dia_chi,so_dt,email)
	
	 
});*/

app.get('/detail/:masp', function(req, res) {
	var masp=req.params.masp;
	console.log(masp);
	
	if(isNaN(masp)==false)
	{
	 HienThiChiTiet(res,masp); 
	}
});

async function HienThiChiTiet(res,masp)
{
	var ttchitietsanpham=await sanpham.selectChitiet(masp);
    res.render('product-detail',{chitietsp:ttchitietsanpham});
}

 app.listen(8000);
console.log('8000 is the magic port');
//bỏ file sql vô luôn bạn
//đau r