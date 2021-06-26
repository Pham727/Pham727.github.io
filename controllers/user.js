var csdl=require('./database')
module.exports.dangki= async function (ho_ten,ten_dn,email,mat_khau,so_dt,dia_chi)
{
	var query="insert into user (hoten,tendn,email,password,phone,address)";
	query= query+"values('"+ho_ten+"','"+ten_dn+"','"+email+"','"+mat_khau+"','"+so_dt+"','"+dia_chi+"')";
	var kq = await csdl.DocBang(query);
    return kq;
}