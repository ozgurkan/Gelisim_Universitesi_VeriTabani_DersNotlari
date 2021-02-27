SELECT * FROM haberler.dbo.Yazarlar WHERE yazar_alt_kategorileri_id=1

select *  from Yazar_alt_kategorileri

/*Yazar Adýna Göre Listele*/
select * from Kose_Yazilari,Yazarlar where Kose_Yazilari.yazar_id=Yazarlar.yazar_id and yazay_adi='Ali'
/* Futbol Yazýlarýný Listele*/
select * from Kose_Yazilari,Yazarlar where Kose_Yazilari.yazar_id=Yazarlar.yazar_id and yazar_alt_kategorileri_id=1
/*Spor Yazýlarný Listele*/
select distinct(Kose_Yazilari.yazi_detay) from Kose_Yazilari,Yazar_alt_kategorileri,Yazar_kategori where 
Yazar_kategori.yazar_kategori_id=Yazar_alt_kategorileri.yazar_kategori_id
and Yazar_kategori.yazar_kategori_id=1