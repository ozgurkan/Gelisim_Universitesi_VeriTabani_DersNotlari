/*SORU 1------ANKARA DO�UMLU DOKTORLARIN HASTA ADLARINI UYGUNDUR D�YE DE���T�REN SORGUYU YAZINIZ------*/
Update Hastalar set HasataAdi='Uygundur' where DoktorId=(Select DoktorId from Doktorlar where DoktorDogumYeri='Ankara')

/*SORU 2---DOKTOR ADI TUGAY OLAN,CERRAH� B�L�M�NDE MUAYENE OLAN VE HASTA YA�I 43 OLAN HASTALARIN SOYADINI UYGUN DE��LD�R YAPINIZ----*/
Update Hastalar set HastaSoyadi='Uygun De�ildir' where HastaYas=43 and 
DoktorId=(Select DoktorId from Doktorlar where DoktorAdi='Tugay') and
BolumId=(Select BolumId from Bolumler where BolumAdi='Cerrahi')

/*SORU 3---ADI KAD�R OLAN DOKTORLARIN �ALI�MI� OLDU�U B�L�M� N�ROLOJ� OLARAK G�NCELLEY�N---*/
Update Bolumler set BolumAdi='N�roloji' where BolumId=(Select BolumId from Doktorlar where DoktorAdi='Kadir')

Update Hastalar set HasataAdi='uygundur' where DoktorId=(Select DoktorId from Doktorlar where DoktorDogumYeri='istanbul')

/*SORU 2---DOKTOR ADI TUGAY OLAN,CERRAH� B�L�M�NDE MUAYENE OLAN VE HASTA YA�I 43 OLAN HASTALARIN SOYADINI UYGUN DE��LD�R YAPINIZ----*/
Update Hastalar set HastaSoyadi='Uygun De�ildir' where HastaYas=43 and 
DoktorId=(select DoktorId from Doktorlar where DoktorAdi='Tugay') and
BolumId=(select BolumId from Bolumler where BolumAdi='Cerrahi')

update Bolumler set BolumAdi='N�roloji' where BolumId=(Select DoktorId from Doktorlar where DoktorAdi='Kadir')

 
 
 /*g�z b�l�m�nde muayene olan hastalar�n ya��n� 35 olarak de�i�tirin*/ 
 update Hastalar set HastaYas=35 where BolumId=(select BolumId from Bolumler where BolumAdi='G�z')

/*doktor emre ye muayene olan hastalar�n ya��n� 45 olarak de�i�tirin*/
update Hastalar set HastaYas=45 where DoktorId=(select DoktorId from Doktorlar where DoktorAdi='Emre' )



/*kbb b�l�m�nde muayene olan hastalar�n ad�n� ali olarak de�i�trin*/
update Hastalar set HasataAdi='ali' where BolumId=(select BolumId from Bolumler where BolumAdi='Kbb')

/*hastalar tablosuna ali ko� isimli ve ya�� 20 olan hastay� ekleyin*/
insert into Hastalar (HasataAdi,HastaSoyadi,HastaYas) values ('ALi','Ko�',20)

delete from Hastalar where HastaId=6

select COUNT(HastaId) as 'ka� hasta var' from Hastalar
select SUM(HastaYas) as 'toplam�',AVG(HastaYas) as 'ortalamas�' from Hastalar 
select HastaSoyadi from Hastalar where HasataAdi like '%a'
/*
%A% ==== i�inde A ge�en
A% ==== ba��nda A ge�en
%A ==== sonunda A ge�en
*/
select * from Hastalar order by HastaYas asc



/*hasta ad�nda m harfi ge�en hastalar�n ya��n� b�y�kten k����e s�ralay�n*/
select * from Hastalar where HasataAdi like '%m%' order by HastaYas desc


/*---------------De�i�ken tan�mlama------------*/
declare @sayi int
set @sayi=55
print @sayi


declare @ad nvarchar(50)
set @ad='ad�m�z� yazd�k'
print @ad

/*doktor adi elif olan doktorla�n idsini ekrana yazd�r�n*/
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

/*hastalar�n ya�� 40 a e�it ve b�y�k olanlar�n ya�lar� toplam�n� ekrana yazd�r�n�z*/
declare @yaslartoplami int
set @yaslartoplami=(select SUM(HastaYas) from Hastalar where HastaYas>=40)
print @yaslartoplami
*/

/*cerrahi b�l�m�nde doktor olarak �al��an doktorlar�n adlar�n� yazd�r�n*/

declare @doktoradi nvarchar(50),@doktorid int
set @doktoradi=(select DoktorAdi from Doktorlar where BolumId=(select BolumId from Bolumler where BolumAdi='cerrahi'))
print @doktoradi






select * from Ogrenciler


Select * from ogrenciler where OgrenciId=6 or OgrenciId=7
select COUNT(OgrenciId) from Ogrenciler /*b�t�n kay�tlar� sayar*/
select SUM(vize) from Ogrenciler/*kay�tlar� toplar*/
select AVG(vize) FROM Ogrenciler/*ortalama al�r*/ 
select distinct(BolumId) from Ogrenciler/*ayn� kay�tlar� birle�tirir*/
select bolumId as 'B�l�m Numaras�' from Ogrenciler/*takma isim verir*/
Select top 3 * from Ogrenciler/*n tane kay�t getirir*/
select MIN(vize) from Ogrenciler/*en k���k */
select max(vize) from Ogrenciler/* en b�y�k*/

select * from Ogrenciler order by Ortalama/* s�ralama i�lemi yapar*/
select COUNT(OgrenciId) from Ogrenciler group by BolumId/*gruplama yapar*/

/*Tablolar� birle�tirme*/
/*�nner join*/
select * from Ogrenciler inner join Bolumler 
on 
Ogrenciler.BolumId=Bolumler.BolumId

/*where*/
select Ogrenciler.OgrenciAdi,Bolumler.BolumAdi,Ogrenciler.Vize,Ogrenciler.OgrenciId from Ogrenciler,Bolumler where Ogrenciler.BolumId=Bolumler.BolumId



/*�nsert -- Tabloya kay�t ekler*/
insert into Ogrenciler (OgrenciAdi,OgrenciSoyadi,Ortalama,Durum)values('Ali','Oku',80,'Ge�ti')

/*Update-- Tabloda g�ncelleme yapar*/
update Ogrenciler set Durum='Kald�' where OgrenciAdi='Ali'


/*Delete -- tablodan kay�t siler*/
Delete from Ogrenciler where OgrenciId=15
