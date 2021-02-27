use ornek
/*--------------WH�LE D�NG�S� 1.�RNEK------------------------*/
declare @sayi int
set @sayi=1;
while(@sayi<11)
Begin
print (@sayi)
set @sayi=@sayi+1
End

/*-------------WH�LE D�NG�S� 2.�RNEK-------------------------*/
declare @sayi1 int
declare @isim nvarchar(50)
set @sayi1=1;
set @isim='�zg�r';
while(@sayi1<11)
Begin
print convert(nvarchar,@sayi1)+'-'+(@isim)
set @sayi1=@sayi1+1
End


/*---------------��RENC�LER TABLOSU �RNE��-----------------------*/


/*---------------��RENC�LER idsi 4-7 aras�nda olan ��rencilerin not ortalamalar�n� ekrana yazd�r�n-----------------------*/
declare @say int
set @say=4;
declare @ortalama int
while(@say<=7)
Begin
set @ortalama=((select Vize from Ogrenciler where OgrenciId=@say)*40/100+(select Final from Ogrenciler where OgrenciId=@say)*60/100)
print @ortalama
set @say=@say+1
End


/*---------------b�t�n ��rencilerin ortalaas�n� hesaplay�p tabloya ekleyin-----------------------*/
declare @say1 int
set @say1=1;
declare @ortalama1 int
while(@say1<=13)
Begin
set @ortalama1=((select Vize from Ogrenciler where OgrenciId=@say1)*40/100+(select Final from Ogrenciler where OgrenciId=@say1)*60/100)
Update Ogrenciler set Ortalama=@ortalama1 where OgrenciId=@say1
set @say1=@say1+1
End

/*---------------Oratalamaya g�re durumu ge�ti-kald� yap 70 ve �st� ge�ti di�erleri kald�-----------------------*/
declare @say2 int
set @say2=1;
declare @ortalama2 int
while(@say2<=13)
Begin
set @ortalama2=(select Ortalama from Ogrenciler where OgrenciId=@say2)

if(@ortalama2>=70)
Begin
Update Ogrenciler set Durum='GE�T�' where OgrenciId=@say2
End
else
Begin
Update Ogrenciler set Durum='KALDI' where OgrenciId=@say2
End

set @say2=@say2+1
End


/*---------------ORTALAMAYA G�RE HARF NOTLARINI TABLOYA EKLEY�N-----------------------*/
declare @say3 int
set @say3=1;
declare @ortalama3 int
while(@say3<=13)
Begin
set @ortalama3=(select Ortalama from Ogrenciler where OgrenciId=@say3)

if(@ortalama3>=90)
Begin
Update Ogrenciler set HarfNotu='AA' where OgrenciId=@say3
End
else if(@ortalama3>=85 and @ortalama3<=89)
Begin
Update Ogrenciler set HarfNotu='BA' where OgrenciId=@say3
End
else if(@ortalama3>=75 and @ortalama3<=84)
Begin
Update Ogrenciler set HarfNotu='BB' where OgrenciId=@say3
End
else if(@ortalama3>=65 and @ortalama3<=74)
Begin
Update Ogrenciler set HarfNotu='CB' where OgrenciId=@say3
End
else if(@ortalama3>=60 and @ortalama3<=64)
Begin
Update Ogrenciler set HarfNotu='CC' where OgrenciId=@say3
End
else if(@ortalama3>=50 and @ortalama3<=59)
Begin
Update Ogrenciler set HarfNotu='DC' where OgrenciId=@say3
End
else if(@ortalama3>=45 and @ortalama3<=49)
Begin
Update Ogrenciler set HarfNotu='DD' where OgrenciId=@say3
End
else if(@ortalama3>=40 and @ortalama3<=44)
Begin
Update Ogrenciler set HarfNotu='FD' where OgrenciId=@say3
End
else if(@ortalama3>=0 and @ortalama3<=39)
Begin
Update Ogrenciler set HarfNotu='FF' where OgrenciId=@say3
End

set @say3=@say3+1
End



/*------------------*/

Select * from Ogrenciler where BolumId=(Select BolumId from Bolumler where FakulteId=(Select FakulteId from Fakulteler where FakulteAdi='Mimarl�k'))

Select * from Ogrenciler where BolumId=(Select MAX(BolumId) from Bolumler where FakulteId=(Select FakulteId from Fakulteler where FakulteAdi='MYO'))

Select BolumId,BolumAdi  from Bolumler where FakulteId=(Select FakulteId from Fakulteler where FakulteAdi='MYO')

Select * from Ogrenciler where Ortalama>70 order by Ortalama desc
SELECT 'Eklenecek Metin		' + OgrenciAdi  FROM Ogrenciler
SELECT top 5(Vize*40/100+Final*60/100)  FROM Ogrenciler order by OgrenciId

SELECT top 5 * FROM Ogrenciler order by OgrenciId
SELECT top 25 percent * FROM Ogrenciler order by OgrenciId

select distinct BolumId from Ogrenciler

select bolum�d as 'bol�m numaras�',OgrenciAdi,OgrenciSoyadi from ogrenciler

select MIN(vize) from Ogrenciler
select MAX(vize) from Ogrenciler
select SUM(vize) from Ogrenciler
select AVG(vize) from Ogrenciler
select COUNT(vize) from Ogrenciler

select COUNT(OgrenciId) from Ogrenciler GROUP BY BolumId
select COUNT(OgrenciId) from Ogrenciler GROUP BY BolumId having BolumId>2

/*--------------------------------WHERE �LE TABLO B�RLE�T�RME-----------------------------------------------------*/
select o.OgrenciAdi,o.OgrenciSoyadi,o.HarfNotu,b.BolumAdi,f.FakulteAdi from Ogrenciler o,Bolumler b,Fakulteler f where o.BolumId=b.BolumId and b.FakulteId=f.FakulteId

/*--------------------------------�NNER JO�N TABLO B�RLE�T�RME-----------------------------------------------------*/
Select o.OgrenciAdi,o.OgrenciSoyadi,o.BolumId,b.BolumAdi,f.FakulteAdi from Ogrenciler as o
inner join Bolumler as b on o.BolumId=b.BolumId
inner join Fakulteler as f on b.FakulteId=f.FakulteId

/*--------------------------------�� ��E SORGU �LE FARKLI TABLOLARI KULLANMA-----------------------------------------------------*/
/*------------MYO OKUYAN ��RENC�LER� L�STELEYEL�M--------------*/
Select * from Ogrenciler where BolumId in(Select BolumId from Bolumler where FakulteId =(Select FakulteId from Fakulteler where FakulteAdi='MYO'))
/*------------Mimarl�kta okuyan ��rencilerin adlar� ve ortalamalar�  L�STELEYEL�M--------------*/
/*----i� i�e sorguyla--------*/
Select o.OgrenciAdi,o.Ortalama from Ogrenciler o where o.BolumId in(Select b.BolumId from Bolumler b where b.FakulteId=
(Select f.FakulteId from Fakulteler f Where f.FakulteAdi='Mimarl�k'))
/*----inner joinle--------*/
Select o.OgrenciAdi,o.OgrenciSoyadi,o.HarfNotu,o.Durum,b.BolumAdi,f.FakulteAdi from Ogrenciler o 
inner join Bolumler b on o.BolumId=b.BolumId
inner join Fakulteler f on b.FakulteId=f.FakulteId
where f.FakulteAdi='Mimarl�k'



/*--------Hangi b�l�mde ka� ��renci var-----*/
select b.BolumAdi,COUNT(*) as 'Okuyan ��renci Say�s�' from Ogrenciler o inner join Bolumler b on o.BolumId=b.BolumId 
GROUP BY o.BolumId,b.BolumAdi

/*-----------Hangi programda ka� ��renci var----------------*/
/*----------Right Joinle yap�lan----------*/
select f.FakulteAdi,COUNT(o.OgrenciId) as 'Okuyan ��renci Say�s�' from Ogrenciler o 
right join Bolumler b on o.BolumId=b.BolumId
right join Fakulteler f on f.FakulteId=b.FakulteId 
GROUP BY f.FakulteAdi

/*----------Left Joinle yap�lan----------*/
Select f.FakulteAdi,COUNT(o.OgrenciId) as 'Okuyan ��renci Say�s�' from Fakulteler f
left join Bolumler b on b.FakulteId=f.FakulteId 
left join Ogrenciler o on o.BolumId=b.BolumId
group by f.FakulteAdi

/*--------------Ka� tane ayn� isimde ��renci var--------------------------------------*/
select o.OgrenciAdi,COUNT(o.OgrenciAdi) as 'ka� ��renci var' from Ogrenciler o group by o.OgrenciAdi




/*------�NSERT-UPDATE-DELETE-------------*/
insert into Ogrenciler (OgrenciAdi,OgrenciSoyadi,Vize,Final,BolumId) values('�nsert','�nsert',80,70,4)
delete from Ogrenciler where OgrenciAdi='�nsert'
update Ogrenciler set OgrenciSoyadi='Update' where OgrenciAdi='�nsert'

/*----------MYO okuyan ��rencilerin ad�n� de�i�tirme update ve inner join---------------------*/
UPDATE Ogrenciler  SET OgrenciAdi = 'AGACIN PARENTREF�'  
FROM  Ogrenciler o 
inner join Bolumler b on o.BolumId=b.BolumId
inner join Fakulteler f on b.FakulteId=f.FakulteId 
where f.FakulteAdi='MYO'
/*----------MYO okuyan ��rencilerin ad�n� de�i�tirme i� i�e sorgu---------------------*/
UPDATE Ogrenciler  SET OgrenciAdi = 'AGACIN PARENTREF�' where BolumId in
(Select BolumId from Bolumler where FakulteId=(Select FakulteId from Fakulteler where FakulteAdi='MYO'))



/*------De�i�kenler--------*/
declare @deger int
set @deger=1
print @deger

declare @deger2 int
set @deger2=1
select @deger2 as 'selectle de�i�ken'
