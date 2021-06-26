var csdl=require('./database')
module.exports.select= async function ()
{
	var query='SELECT * from catalog';
	dssanpham=await csdl.DocBang(query);
	var kq="";
	for(i=0;i<dssanpham.length;i++)
 		{
			kq=kq + "<li><a href='/"+dssanpham[i].idCat+"'>"+dssanpham[i].nameCat+"</a></li>"
		}
return kq;
}