USE [HABER_YENİ]
GO
/****** Object:  Table [dbo].[Uyeler]    Script Date: 06/09/2014 15:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Uyeler](
	[UyeId] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](max) NULL,
	[Sifre] [nvarchar](max) NULL,
	[Sifre1] [nvarchar](max) NULL,
	[Ad] [nvarchar](max) NULL,
	[Soyad] [nvarchar](max) NULL,
	[Kullanici_Adi] [nvarchar](max) NULL,
	[Dogum_Tarihi] [date] NULL,
	[Adres] [nvarchar](max) NULL,
	[Telefon] [int] NULL,
	[Cinsiyet] [nvarchar](10) NULL,
	[Resim] [nvarchar](max) NULL,
	[Sayi] [nvarchar](max) NULL,
	[Onay] [int] NULL,
 CONSTRAINT [PK_Uyeler] PRIMARY KEY CLUSTERED 
(
	[UyeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sosyal_Medya]    Script Date: 06/09/2014 15:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sosyal_Medya](
	[Sm_İd] [int] IDENTITY(1,1) NOT NULL,
	[Sm_Adi] [nvarchar](50) NOT NULL,
	[Sm_Linki] [nvarchar](100) NULL,
	[Sm_Durum] [nvarchar](50) NULL,
 CONSTRAINT [PK_Sosyal_Medya] PRIMARY KEY CLUSTERED 
(
	[Sm_İd] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Yoneticiler]    Script Date: 06/09/2014 15:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Yoneticiler](
	[YöneticiId] [int] IDENTITY(1,1) NOT NULL,
	[YöneticiAdi] [nvarchar](50) NULL,
	[YöneticiSoyadi] [nvarchar](50) NULL,
	[Görevi] [nvarchar](50) NULL,
	[GrupId] [int] NULL,
	[KullaniciAdi] [nvarchar](50) NULL,
	[Sifre] [nvarchar](max) NULL,
	[Email] [nvarchar](50) NULL,
	[Telefon] [int] NULL,
 CONSTRAINT [PK_Yöneticiler] PRIMARY KEY CLUSTERED 
(
	[YöneticiId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[YoneticiGrup]    Script Date: 06/09/2014 15:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YoneticiGrup](
	[GrupId] [int] IDENTITY(1,1) NOT NULL,
	[GrupAdi] [nvarchar](max) NULL,
 CONSTRAINT [PK_Yönet] PRIMARY KEY CLUSTERED 
(
	[GrupId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kategori]    Script Date: 06/09/2014 15:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kategori](
	[tür_id] [int] IDENTITY(1,1) NOT NULL,
	[tür_adi] [nvarchar](20) NULL,
	[tür_link] [nvarchar](max) NULL,
 CONSTRAINT [PK_Kategori] PRIMARY KEY CLUSTERED 
(
	[tür_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Anket_Soruları]    Script Date: 06/09/2014 15:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Anket_Soruları](
	[soru_id] [int] IDENTITY(1,1) NOT NULL,
	[soru_detay] [nvarchar](50) NULL,
 CONSTRAINT [PK_Anket_Soruları] PRIMARY KEY CLUSTERED 
(
	[soru_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Anket_Secenekleri]    Script Date: 06/09/2014 15:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Anket_Secenekleri](
	[secenek_id] [int] IDENTITY(1,1) NOT NULL,
	[secenek_adi] [nvarchar](50) NULL,
 CONSTRAINT [PK_Anket_Secenekleri] PRIMARY KEY CLUSTERED 
(
	[secenek_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Anket]    Script Date: 06/09/2014 15:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Anket](
	[anket_id] [int] IDENTITY(1,1) NOT NULL,
	[soru_id] [int] NULL,
	[secenek_id] [int] NULL,
 CONSTRAINT [PK_Anket] PRIMARY KEY CLUSTERED 
(
	[anket_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Alt_Kategori]    Script Date: 06/09/2014 15:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alt_Kategori](
	[alt_tür_id] [int] IDENTITY(1,1) NOT NULL,
	[alt_tür_adi] [nvarchar](20) NULL,
	[tür_id] [int] NULL,
 CONSTRAINT [PK_Alt_Kategori] PRIMARY KEY CLUSTERED 
(
	[alt_tür_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Haber]    Script Date: 06/09/2014 15:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Haber](
	[haber_id] [int] IDENTITY(1,1) NOT NULL,
	[haber_baslik] [nvarchar](50) NULL,
	[haber_ozet] [nvarchar](250) NULL,
	[haber_detay] [nvarchar](max) NULL,
	[yazılıs_tarihi] [date] NULL,
	[tür_id] [int] NULL,
	[alt_tür_id] [int] NULL,
	[haber_durumu] [int] NULL,
	[Yönetici_Adi] [nvarchar](20) NULL,
	[Yönetici_Soyadi] [nvarchar](20) NULL,
	[Yönetici_Id] [int] NULL,
	[ikon_resmi] [nvarchar](max) NULL,
	[manset_resmi] [nvarchar](max) NULL,
	[manset_durumu] [int] NULL,
	[Haber_Okunma] [int] NULL,
 CONSTRAINT [PK_Haber] PRIMARY KEY CLUSTERED 
(
	[haber_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Haber', @level2type=N'COLUMN',@level2name=N'haber_durumu'
GO
/****** Object:  Table [dbo].[Yazarlar]    Script Date: 06/09/2014 15:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Yazarlar](
	[yazar_id] [int] IDENTITY(1,1) NOT NULL,
	[yazar_adi] [nvarchar](20) NULL,
	[yazar_soyadi] [nvarchar](20) NULL,
	[alt_tür_id] [int] NULL,
 CONSTRAINT [PK_Yazarlar] PRIMARY KEY CLUSTERED 
(
	[yazar_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Yorumlar]    Script Date: 06/09/2014 15:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Yorumlar](
	[yorum_id] [int] IDENTITY(1,1) NOT NULL,
	[haber_baslik] [nvarchar](50) NULL,
	[yorum_detay] [nvarchar](50) NULL,
	[haber_id] [int] NULL,
	[yazan_adi_soyadi] [nvarchar](50) NULL,
	[yazan_mail] [nvarchar](max) NULL,
	[yorum_tarihi] [date] NULL,
	[bilgisayar_ip] [nvarchar](20) NULL,
 CONSTRAINT [PK_Yorumlar] PRIMARY KEY CLUSTERED 
(
	[yorum_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Videolar]    Script Date: 06/09/2014 15:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Videolar](
	[video_id] [int] IDENTITY(1,1) NOT NULL,
	[video_adi] [nvarchar](20) NULL,
	[haber_id] [int] NULL,
 CONSTRAINT [PK_Videolar] PRIMARY KEY CLUSTERED 
(
	[video_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Resimler]    Script Date: 06/09/2014 15:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resimler](
	[resim_id] [int] IDENTITY(1,1) NOT NULL,
	[resim_adi] [nvarchar](20) NULL,
	[haber_id] [int] NULL,
 CONSTRAINT [PK_Resimler] PRIMARY KEY CLUSTERED 
(
	[resim_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reklamlar]    Script Date: 06/09/2014 15:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reklamlar](
	[reklam_id] [int] IDENTITY(1,1) NOT NULL,
	[reklam_adi] [nvarchar](20) NULL,
	[reklam_icerigi] [nvarchar](50) NULL,
	[haber_id] [int] NULL,
 CONSTRAINT [PK_Reklamlar] PRIMARY KEY CLUSTERED 
(
	[reklam_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Köse_Yazilari]    Script Date: 06/09/2014 15:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Köse_Yazilari](
	[yazi_id] [int] IDENTITY(1,1) NOT NULL,
	[yazi_baslik] [nvarchar](50) NULL,
	[yazi_detay] [nvarchar](max) NULL,
	[yazar_id] [int] NULL,
	[yazilis_tarihi] [date] NULL,
 CONSTRAINT [PK_Köse_Yaz] PRIMARY KEY CLUSTERED 
(
	[yazi_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Default [DF_Haber_haber_durumu]    Script Date: 06/09/2014 15:52:20 ******/
ALTER TABLE [dbo].[Haber] ADD  CONSTRAINT [DF_Haber_haber_durumu]  DEFAULT ((0)) FOR [haber_durumu]
GO
/****** Object:  Default [DF_Uyeler_Onay]    Script Date: 06/09/2014 15:52:20 ******/
ALTER TABLE [dbo].[Uyeler] ADD  CONSTRAINT [DF_Uyeler_Onay]  DEFAULT ((0)) FOR [Onay]
GO
/****** Object:  ForeignKey [FK_Alt_Kategori_Kategori]    Script Date: 06/09/2014 15:52:20 ******/
ALTER TABLE [dbo].[Alt_Kategori]  WITH CHECK ADD  CONSTRAINT [FK_Alt_Kategori_Kategori] FOREIGN KEY([tür_id])
REFERENCES [dbo].[Kategori] ([tür_id])
GO
ALTER TABLE [dbo].[Alt_Kategori] CHECK CONSTRAINT [FK_Alt_Kategori_Kategori]
GO
/****** Object:  ForeignKey [FK_Anket_Anket_Secenekleri]    Script Date: 06/09/2014 15:52:20 ******/
ALTER TABLE [dbo].[Anket]  WITH CHECK ADD  CONSTRAINT [FK_Anket_Anket_Secenekleri] FOREIGN KEY([secenek_id])
REFERENCES [dbo].[Anket_Secenekleri] ([secenek_id])
GO
ALTER TABLE [dbo].[Anket] CHECK CONSTRAINT [FK_Anket_Anket_Secenekleri]
GO
/****** Object:  ForeignKey [FK_Anket_Anket_Soruları]    Script Date: 06/09/2014 15:52:20 ******/
ALTER TABLE [dbo].[Anket]  WITH CHECK ADD  CONSTRAINT [FK_Anket_Anket_Soruları] FOREIGN KEY([soru_id])
REFERENCES [dbo].[Anket_Soruları] ([soru_id])
GO
ALTER TABLE [dbo].[Anket] CHECK CONSTRAINT [FK_Anket_Anket_Soruları]
GO
/****** Object:  ForeignKey [FK_Haber_Alt_Kategori]    Script Date: 06/09/2014 15:52:20 ******/
ALTER TABLE [dbo].[Haber]  WITH CHECK ADD  CONSTRAINT [FK_Haber_Alt_Kategori] FOREIGN KEY([alt_tür_id])
REFERENCES [dbo].[Alt_Kategori] ([alt_tür_id])
GO
ALTER TABLE [dbo].[Haber] CHECK CONSTRAINT [FK_Haber_Alt_Kategori]
GO
/****** Object:  ForeignKey [FK_Haber_Kategori]    Script Date: 06/09/2014 15:52:20 ******/
ALTER TABLE [dbo].[Haber]  WITH CHECK ADD  CONSTRAINT [FK_Haber_Kategori] FOREIGN KEY([tür_id])
REFERENCES [dbo].[Kategori] ([tür_id])
GO
ALTER TABLE [dbo].[Haber] CHECK CONSTRAINT [FK_Haber_Kategori]
GO
/****** Object:  ForeignKey [FK_Köse_Yazilari_Yazarlar]    Script Date: 06/09/2014 15:52:20 ******/
ALTER TABLE [dbo].[Köse_Yazilari]  WITH CHECK ADD  CONSTRAINT [FK_Köse_Yazilari_Yazarlar] FOREIGN KEY([yazar_id])
REFERENCES [dbo].[Yazarlar] ([yazar_id])
GO
ALTER TABLE [dbo].[Köse_Yazilari] CHECK CONSTRAINT [FK_Köse_Yazilari_Yazarlar]
GO
/****** Object:  ForeignKey [FK_Reklamlar_Haber1]    Script Date: 06/09/2014 15:52:20 ******/
ALTER TABLE [dbo].[Reklamlar]  WITH CHECK ADD  CONSTRAINT [FK_Reklamlar_Haber1] FOREIGN KEY([haber_id])
REFERENCES [dbo].[Haber] ([haber_id])
GO
ALTER TABLE [dbo].[Reklamlar] CHECK CONSTRAINT [FK_Reklamlar_Haber1]
GO
/****** Object:  ForeignKey [FK_Resimler_Haber]    Script Date: 06/09/2014 15:52:20 ******/
ALTER TABLE [dbo].[Resimler]  WITH CHECK ADD  CONSTRAINT [FK_Resimler_Haber] FOREIGN KEY([haber_id])
REFERENCES [dbo].[Haber] ([haber_id])
GO
ALTER TABLE [dbo].[Resimler] CHECK CONSTRAINT [FK_Resimler_Haber]
GO
/****** Object:  ForeignKey [FK_Videolar_Haber]    Script Date: 06/09/2014 15:52:20 ******/
ALTER TABLE [dbo].[Videolar]  WITH CHECK ADD  CONSTRAINT [FK_Videolar_Haber] FOREIGN KEY([haber_id])
REFERENCES [dbo].[Haber] ([haber_id])
GO
ALTER TABLE [dbo].[Videolar] CHECK CONSTRAINT [FK_Videolar_Haber]
GO
/****** Object:  ForeignKey [FK_Yazarlar_Alt_Kategori]    Script Date: 06/09/2014 15:52:20 ******/
ALTER TABLE [dbo].[Yazarlar]  WITH CHECK ADD  CONSTRAINT [FK_Yazarlar_Alt_Kategori] FOREIGN KEY([alt_tür_id])
REFERENCES [dbo].[Alt_Kategori] ([alt_tür_id])
GO
ALTER TABLE [dbo].[Yazarlar] CHECK CONSTRAINT [FK_Yazarlar_Alt_Kategori]
GO
/****** Object:  ForeignKey [FK_Yorumlar_Haber]    Script Date: 06/09/2014 15:52:20 ******/
ALTER TABLE [dbo].[Yorumlar]  WITH CHECK ADD  CONSTRAINT [FK_Yorumlar_Haber] FOREIGN KEY([haber_id])
REFERENCES [dbo].[Haber] ([haber_id])
GO
ALTER TABLE [dbo].[Yorumlar] CHECK CONSTRAINT [FK_Yorumlar_Haber]
GO
