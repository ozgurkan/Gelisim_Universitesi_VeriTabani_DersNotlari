/*SORU 1------ANKARA DOÐUMLU DOKTORLARIN HASTA ADLARINI UYGUNDUR DÝYE DEÐÝÞTÝREN SORGUYU YAZINIZ------*/
Update Hastalar set HasataAdi='Uygundur' where DoktorId=(Select DoktorId from Doktorlar where DoktorDogumYeri='Ankara')

/*SORU 2---DOKTOR ADI TUGAY OLAN,CERRAHÝ BÖLÜMÜNDE MUAYENE OLAN VE HASTA YAÞI 43 OLAN HASTALARIN SOYADINI UYGUN DEÐÝLDÝR YAPINIZ----*/
Update Hastalar set HastaSoyadi='Uygun Deðildir' where HastaYas=43 and 
DoktorId=(Select DoktorId from Doktorlar where DoktorAdi='Tugay') and
BolumId=(Select BolumId from Bolumler where BolumAdi='Cerrahi')

/*SORU 3---ADI KADÝR OLAN DOKTORLARIN ÇALIÞMIÞ OLDUÐU BÖLÜMÜ NÖROLOJÝ OLARAK GÜNCELLEYÝN---*/
Update Bolumler set BolumAdi='Nöroloji' where BolumId=(Select BolumId from Doktorlar where DoktorAdi='Kadir')

Update Hastalar set HasataAdi='uygundur' where DoktorId=(Select DoktorId from Doktorlar where DoktorDogumYeri='istanbul')

/*SORU 2---DOKTOR ADI TUGAY OLAN,CERRAHÝ BÖLÜMÜNDE MUAYENE OLAN VE HASTA YAÞI 43 OLAN HASTALARIN SOYADINI UYGUN DEÐÝLDÝR YAPINIZ----*/
Update Hastalar set HastaSoyadi='Uygun Deðildir' where HastaYas=43 and 
DoktorId=(select DoktorId from Doktorlar where DoktorAdi='Tugay') and
BolumId=(select BolumId from Bolumler where BolumAdi='Cerrahi')

update Bolumler set BolumAdi='Nöroloji' where BolumId=(Select DoktorId from Doktorlar where DoktorAdi='Kadir')

 
 
 /*göz bölümünde muayene olan hastalarýn yaþýný 35 olarak deðiþtirin*/ 
 update Hastalar set HastaYas=35 where BolumId=(select BolumId from Bolumler where BolumAdi='Göz')

/*doktor emre ye muayene olan hastalarýn yaþýný 45 olarak deðiþtirin*/
update Hastalar set HastaYas=45 where DoktorId=(select DoktorId from Doktorlar where DoktorAdi='Emre' )



/*kbb bölümünde muayene olan hastalarýn adýný ali olarak deðiþtrin*/
update Hastalar set HasataAdi='ali' where BolumId=(select BolumId from Bolumler where BolumAdi='Kbb')

/*hastalar tablosuna ali koþ isimli ve yaþý 20 olan hastayý ekleyin*/
insert into Hastalar (HasataAdi,HastaSoyadi,HastaYas) values ('ALi','Koþ',20)

delete from Hastalar where HastaId=6

select COUNT(HastaId) as 'kaç hasta var' from Hastalar
select SUM(HastaYas) as 'toplamý',AVG(HastaYas) as 'ortalamasý' from Hastalar 
select HastaSoyadi from Hastalar where HasataAdi like '%a'
/*
%A% ==== içinde A geçen
A% ==== baþýnda A geçen
%A ==== sonunda A geçen
*/
select * from Hastalar order by HastaYas asc



/*hasta adýnda m harfi geçen hastalarýn yaþýný büyükten küçüðe sýralayýn*/
select * from Hastalar where HasataAdi like '%m%' order by HastaYas desc


/*---------------Deðiþken tanýmlama------------*/
declare @sayi int
set @sayi=55
print @sayi


declare @ad nvarchar(50)
set @ad='adýmýzý yazdýk'
print @ad

/*doktor adi elif olan doktorlaýn idsini ekrana yazdýrýn*/
/*declare @doktorid int
set @doktorid=(select DoktorId from Doktorlar where DoktorAdi='Elif')
print @doktorid*/

/*declare @doktorad nvarchar(50)
set @doktorad=(select DoktorAdi from Doktorlar where DoktorDogumYeri='Ankara')
print @doktorad*/


/*DECLARE @doktoradi nvarchar(50),@doktorid int
set @doktoradi='elif'
set @doktorid=(select DoktorId from Doktorlar where DoktorAdi=@doktoradi)
print @doktoradi

/*hastalarýn yaþý 40 a eþit ve büyük olanlarýn yaþlarý toplamýný ekrana yazdýrýnýz*/
declare @yaslartoplami int
set @yaslartoplami=(select SUM(HastaYas) from Hastalar where HastaYas>=40)
print @yaslartoplami
*/

/*cerrahi bölümünde doktor olarak çalýþan doktorlarýn adlarýný yazdýrýn*/

declare @doktoradi nvarchar(50),@doktorid int
set @doktoradi=(select DoktorAdi from Doktorlar where BolumId=(select BolumId from Bolumler where BolumAdi='cerrahi'))
print @doktoradi






select * from Ogrenciler


Select * from ogrenciler where OgrenciId=6 or OgrenciId=7
select COUNT(OgrenciId) from Ogrenciler /*bütün kayýtlarý sayar*/
select SUM(vize) from Ogrenciler/*kayýtlarý toplar*/
select AVG(vize) FROM Ogrenciler/*ortalama alýr*/ 
select distinct(BolumId) from Ogrenciler/*ayný kayýtlarý birleþtirir*/
select bolumId as 'Bölüm Numarasý' from Ogrenciler/*takma isim verir*/
Select top 3 * from Ogrenciler/*n tane kayýt getirir*/
select MIN(vize) from Ogrenciler/*en küçük */
select max(vize) from Ogrenciler/* en büyük*/

select * from Ogrenciler order by Ortalama/* sýralama iþlemi yapar*/
select COUNT(OgrenciId) from Ogrenciler group by BolumId/*gruplama yapar*/

/*Tablolarý birleþtirme*/
/*Ýnner join*/
select * from Ogrenciler inner join Bolumler 
on 
Ogrenciler.BolumId=Bolumler.BolumId

/*where*/
select Ogrenciler.OgrenciAdi,Bolumler.BolumAdi,Ogrenciler.Vize,Ogrenciler.OgrenciId from Ogrenciler,Bolumler where Ogrenciler.BolumId=Bolumler.BolumId



/*Ýnsert -- Tabloya kayýt ekler*/
insert into Ogrenciler (OgrenciAdi,OgrenciSoyadi,Ortalama,Durum)values('Ali','Oku',80,'Geçti')

/*Update-- Tabloda güncelleme yapar*/
update Ogrenciler set Durum='Kaldý' where OgrenciAdi='Ali'


/*Delete -- tablodan kayýt siler*/
Delete from Ogrenciler where OgrenciId=15
