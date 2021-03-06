USE [WebsiteShopThoiTrang]
GO
/****** Object:  StoredProcedure [dbo].[sp_ChiTietDatHang_getByTop]    Script Date: 3/6/2017 6:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ChiTietDatHang_getByTop]
@Top	nvarchar(10),
@Where	nvarchar(MAX),
@Order	nvarchar(200)
AS
	Declare @SQL as nvarchar(500)
	Declare @strTop as nvarchar(100)
	Select @strTop = '(' + @Top + ')'
	if len(@Top) = 0 
		BEGIN
			Select @strTop = '100 percent'
		END
	Select @SQL = 'SELECT top ' + @strTop + ' * FROM [tbl_ChiTietDatHang]'
	if len(@Where) >0 
		BEGIN
			Select @SQL = @SQL + ' Where ' + @Where
		END
	if len(@Order) >0
		BEGIN
			Select @SQL = @SQL + ' Order by ' + @Order
		END
	EXEC (@SQL)
GO
/****** Object:  StoredProcedure [dbo].[sp_ChiTietDatHang_Insert]    Script Date: 3/6/2017 6:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ChiTietDatHang_Insert]
	@id_hoadon int,
	@id_hang int,
	@SoLuongMua int,
	@ThanhTien money,
	@Size char(10),
	@Gia money
AS
BEGIN
	insert into tbl_ChiTietDatHang(id_hoadon,id_hang,SoLuongMua,ThanhTien,Size,Gia) 
	values(@id_hoadon,@id_hang,@SoLuongMua,@ThanhTien,@Size,@Gia)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ChiTietDatHang_Update]    Script Date: 3/6/2017 6:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[sp_ChiTietDatHang_Update]
	@id_hoadon int,
	@id_hang int,
	@SoLuongMua int,
	@ThanhTien money,
	@Size char(10),
	@Gia money
AS
BEGIN
	update tbl_ChiTietDatHang set SoLuongMua = @SoLuongMua, ThanhTien = @ThanhTien,
	Size=@Size,Gia=@Gia
	where id_hoadon = @id_hoadon and id_hang=@id_hang
END

GO
/****** Object:  StoredProcedure [dbo].[sp_DatHang_getByTop]    Script Date: 3/6/2017 6:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DatHang_getByTop]
@Top	nvarchar(10),
@Where	nvarchar(MAX),
@Order	nvarchar(200)
AS
	Declare @SQL as nvarchar(500)
	Declare @strTop as nvarchar(100)
	Select @strTop = '(' + @Top + ')'
	if len(@Top) = 0 
		BEGIN
			Select @strTop = '100 percent'
		END
	Select @SQL = 'SELECT top ' + @strTop + ' * FROM [tbl_DatHang]'
	if len(@Where) >0 
		BEGIN
			Select @SQL = @SQL + ' Where ' + @Where
		END
	if len(@Order) >0
		BEGIN
			Select @SQL = @SQL + ' Order by ' + @Order
		END
	EXEC (@SQL)
GO
/****** Object:  StoredProcedure [dbo].[sp_DatHang_Insert]    Script Date: 3/6/2017 6:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DatHang_Insert]
	@NgaylapHD date,
	@id_KhachHang int,
	@IdPay int

AS
BEGIN
	insert into tbl_DatHang(NgaylapHD,id_KhachHang,IdPay) 
	values(@NgaylapHD,@id_KhachHang,@IdPay)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DatHang_Update]    Script Date: 3/6/2017 6:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_DatHang_Update]
	@NgaylapHD date,
	@id_KhachHang int,
	@IdPay int,
	@id int
AS
BEGIN
	update tbl_KhachHang set @NgaylapHD = @NgaylapHD, @id_KhachHang = @id_KhachHang, @IdPay = @IdPay
	
	where id = @id
END

GO
/****** Object:  StoredProcedure [dbo].[sp_Hang_Delete]    Script Date: 3/6/2017 6:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Hang_Delete]
	@id int
AS
BEGIN
	delete from tbl_Hang where id=@id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Hang_getByTop]    Script Date: 3/6/2017 6:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Hang_getByTop]
@Top	nvarchar(10),
@Where	nvarchar(MAX),
@Order	nvarchar(200)
AS
	Declare @SQL as nvarchar(500)
	Declare @strTop as nvarchar(100)
	Select @strTop = '(' + @Top + ')'
	if len(@Top) = 0 
		BEGIN
			Select @strTop = '100 percent'
		END
	Select @SQL = 'SELECT top ' + @strTop + ' [id],[TenHang],[image],[ChatLieu],[Mota],ISNULL([LuotXem],0) as [LuotXem] ,CONVERT(DECIMAL(18,0),[giaMoi])as [giaMoi],CONVERT(DECIMAL(18,0),[giaCu])as [giaCu] ,[id_Menu],[Soluong],[TinhTrang],[Active],[image_large],TomTat FROM [tbl_Hang]'
	if len(@Where) >0 
		BEGIN
			Select @SQL = @SQL + ' Where ' + @Where
		END
	if len(@Order) >0
		BEGIN
			Select @SQL = @SQL + ' Order by ' + @Order
		END
	EXEC (@SQL)
GO
/****** Object:  StoredProcedure [dbo].[sp_Hang_Insert]    Script Date: 3/6/2017 6:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Hang_Insert]
	@TenHang nvarchar(50),
	@TomTat nvarchar(MAX),
	@Mota ntext,
	@image nvarchar(MAX),
	@ChatLieu nvarchar(50),
	@giaMoi money,
	@giaCu money,
	@id_Menu int,
	@Soluong int,
	@Active bit,
	@image_large varchar(500)
AS
BEGIN
	insert into tbl_Hang(TenHang,TomTat,Mota,[image],ChatLieu,giaMoi,giaCu,id_Menu,Soluong,Active,image_large) values(@TenHang,@TomTat,@Mota,@image,@ChatLieu,@giaMoi,@giaCu,@id_Menu,@Soluong,@Active,@image_large)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Hang_Update]    Script Date: 3/6/2017 6:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_Hang_Update]
	@id int,
	@TenHang nvarchar(50),
	@TomTat nvarchar(MAX),
	@Mota ntext,
	@image nvarchar(MAX),
	@ChatLieu nvarchar(50),
	@giaMoi money,
	@giaCu money,
	@id_Menu int,
	@Soluong int,
	@Active bit,
	@image_large varchar(500)
AS
BEGIN
	update tbl_Hang set TenHang = @TenHang, TomTat = @TomTat, Mota = @Mota
	,[image]=@image,ChatLieu=@ChatLieu,giaMoi=@giaMoi,giaCu=@giaCu,id_Menu=@id_Menu,
	Soluong=@Soluong,Active=@Active,image_large=@image_large
	
	where id = @id
END

GO
/****** Object:  StoredProcedure [dbo].[sp_HinhThucThanhToan_getByTop]    Script Date: 3/6/2017 6:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_HinhThucThanhToan_getByTop]
@Top	nvarchar(10),
@Where	nvarchar(MAX),
@Order	nvarchar(200)
AS
	Declare @SQL as nvarchar(500)
	Declare @strTop as nvarchar(100)
	Select @strTop = '(' + @Top + ')'
	if len(@Top) = 0 
		BEGIN
			Select @strTop = '100 percent'
		END
	Select @SQL = 'SELECT top ' + @strTop + ' * FROM [PayMeThod]'
	if len(@Where) >0 
		BEGIN
			Select @SQL = @SQL + ' Where ' + @Where
		END
	if len(@Order) >0
		BEGIN
			Select @SQL = @SQL + ' Order by ' + @Order
		END
	EXEC (@SQL)
GO
/****** Object:  StoredProcedure [dbo].[sp_KhachHang_Delete]    Script Date: 3/6/2017 6:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_KhachHang_Delete]
	@id int
AS
BEGIN
	delete from tbl_KhachHang where id=@id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_KhachHang_getByTop]    Script Date: 3/6/2017 6:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_KhachHang_getByTop]
@Top	nvarchar(10),
@Where	nvarchar(MAX),
@Order	nvarchar(200)
AS
	Declare @SQL as nvarchar(500)
	Declare @strTop as nvarchar(100)
	Select @strTop = '(' + @Top + ')'
	if len(@Top) = 0 
		BEGIN
			Select @strTop = '100 percent'
		END
	Select @SQL = 'SELECT top ' + @strTop + ' id,tenKH,GioiTinh,convert(varchar,NgaySinh,120) as NgaySinh,TaiKhoan,MatKhau,Email,Tinh,Quan, SDT,TinhTrang,DiaChi,Link_Fb FROM [tbl_KhachHang]'
	if len(@Where) >0 
		BEGIN
			Select @SQL = @SQL + ' Where ' + @Where
		END
	if len(@Order) >0
		BEGIN
			Select @SQL = @SQL + ' Order by ' + @Order
		END
	EXEC (@SQL)

GO
/****** Object:  StoredProcedure [dbo].[sp_KhachHang_Insert]    Script Date: 3/6/2017 6:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_KhachHang_Insert]
	@tenKH nvarchar(50),
	@GioiTinh bit,
	@NgaySinh date,
	@TaiKhoan nvarchar(50),
	@MatKhau nvarchar(50),
	@Email nvarchar(50),
	@SDT char(10),
	@Tinh nvarchar(50),
	@Quan nvarchar(50),
	@DiaChi ntext,
	@Link_Fb varchar(200)
AS
BEGIN
	insert into tbl_KhachHang(tenKH,GioiTinh,NgaySinh,TaiKhoan,MatKhau,Email,SDT,Tinh,Quan,DiaChi,Link_Fb) values(@tenKH,@GioiTinh,@NgaySinh,@TaiKhoan,@MatKhau,@Email,@SDT,@Tinh,@Quan,@DiaChi,@Link_Fb)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_KhachHang_Update]    Script Date: 3/6/2017 6:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[sp_KhachHang_Update]
	@id int,
	@tenKH nvarchar(50),
	@GioiTinh bit,
	@NgaySinh date,
	@MatKhau nvarchar(50),
	@Email nvarchar(50),
	@SDT char(10),
	@Tinh nvarchar(50),
	@Quan nvarchar(50),
	@DiaChi ntext
AS
BEGIN
	update tbl_KhachHang set tenKH = @tenKH, GioiTinh = @GioiTinh, NgaySinh = @NgaySinh, MatKhau = @MatKhau,
	Email=@Email,SDT=@SDT,Tinh=@Tinh,Quan=@Quan,DiaChi=@DiaChi
	where id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_KhachHangDatHang_Update]    Script Date: 3/6/2017 6:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[sp_KhachHangDatHang_Update]
	@id int,
	@tenKH nvarchar(50),
	@Email nvarchar(50),
	@SDT char(10),
	@Tinh nvarchar(50),
	@Quan nvarchar(50),
	@DiaChi ntext
AS
BEGIN
	update tbl_KhachHang set tenKH = @tenKH, 
	Email=@Email,SDT=@SDT,Tinh=@Tinh,Quan=@Quan,DiaChi=@DiaChi
	where id = @id
END

GO
/****** Object:  StoredProcedure [dbo].[sp_KhuyenMai_getByTop]    Script Date: 3/6/2017 6:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_KhuyenMai_getByTop]
@Top	nvarchar(10),
@Where	nvarchar(MAX),
@Order	nvarchar(200)
AS
	Declare @SQL as nvarchar(500)
	Declare @strTop as nvarchar(100)
	Select @strTop = '(' + @Top + ')'
	if len(@Top) = 0 
		BEGIN
			Select @strTop = '100 percent'
		END
	Select @SQL = 'SELECT top ' + @strTop + ' * FROM [tbl_KhuyenMai]'
	if len(@Where) >0 
		BEGIN
			Select @SQL = @SQL + ' Where ' + @Where
		END
	if len(@Order) >0
		BEGIN
			Select @SQL = @SQL + ' Order by ' + @Order
		END
	EXEC (@SQL)
GO
/****** Object:  StoredProcedure [dbo].[sp_LienLac_getByTop]    Script Date: 3/6/2017 6:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_LienLac_getByTop]
@Top	nvarchar(10),
@Where	nvarchar(MAX),
@Order	nvarchar(200)
AS
	Declare @SQL as nvarchar(500)
	Declare @strTop as nvarchar(100)
	Select @strTop = '(' + @Top + ')'
	if len(@Top) = 0 
		BEGIN
			Select @strTop = '100 percent'
		END
	Select @SQL = 'SELECT top ' + @strTop + ' * FROM [tbl_LienLac]'
	if len(@Where) >0 
		BEGIN
			Select @SQL = @SQL + ' Where ' + @Where
		END
	if len(@Order) >0
		BEGIN
			Select @SQL = @SQL + ' Order by ' + @Order
		END
	EXEC (@SQL)
GO
/****** Object:  StoredProcedure [dbo].[sp_LienLac_Insert]    Script Date: 3/6/2017 6:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_LienLac_Insert]
	@Ten nvarchar(50),
	@DiaChi ntext,
	@DienThoai char(10),
	@Email varchar(50),
	@ChuDe nvarchar(50),
	@NoiDung ntext

AS
BEGIN
	insert into tbl_LienLac(Ten,DiaChi,DienThoai,Email,ChuDe,NoiDung) 
	values(@Ten,@DiaChi,@DienThoai,@Email,@ChuDe,@NoiDung) 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_NhanVien_getByTop]    Script Date: 3/6/2017 6:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_NhanVien_getByTop]
@Top	nvarchar(10),
@Where	nvarchar(MAX),
@Order	nvarchar(200)
AS
	Declare @SQL as nvarchar(500)
	Declare @strTop as nvarchar(100)
	Select @strTop = '(' + @Top + ')'
	if len(@Top) = 0 
		BEGIN
			Select @strTop = '100 percent'
		END
	Select @SQL = 'SELECT top ' + @strTop + ' * FROM tbl_NhanVien'
	if len(@Where) >0 
		BEGIN
			Select @SQL = @SQL + ' Where ' + @Where
		END
	if len(@Order) >0
		BEGIN
			Select @SQL = @SQL + ' Order by ' + @Order
		END
	EXEC (@SQL)

GO
/****** Object:  StoredProcedure [dbo].[sp_NhomHang_getByTop]    Script Date: 3/6/2017 6:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_NhomHang_getByTop]
@Top	nvarchar(10),
@Where	nvarchar(MAX),
@Order	nvarchar(200)
AS
	Declare @SQL as nvarchar(500)
	Declare @strTop as nvarchar(100)
	Select @strTop = '(' + @Top + ')'
	if len(@Top) = 0 
		BEGIN
			Select @strTop = '100 percent'
		END
	Select @SQL = 'SELECT top ' + @strTop + ' * FROM [tbl_NhomHang]'
	if len(@Where) >0 
		BEGIN
			Select @SQL = @SQL + ' Where ' + @Where
		END
	if len(@Order) >0
		BEGIN
			Select @SQL = @SQL + ' Order by ' + @Order
		END
	EXEC (@SQL)
GO
/****** Object:  StoredProcedure [dbo].[sp_QuangCao_Count_Update]    Script Date: 3/6/2017 6:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[sp_QuangCao_Count_Update]
	@id int

AS
BEGIN
	declare @get_Click int=(Select Count_Click from tblQuangCao where id=@id)
	if(@get_Click is null)
		update tblQuangCao set Count_Click=1 where id = @id	
	else		
		update tblQuangCao set Count_Click=Count_Click+1 where id = @id
	

END
GO
/****** Object:  StoredProcedure [dbo].[sp_QuangCao_getByTop]    Script Date: 3/6/2017 6:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_QuangCao_getByTop]
@Top	nvarchar(10),
@Where	nvarchar(MAX),
@Order	nvarchar(200)
AS
	Declare @SQL as nvarchar(500)
	Declare @strTop as nvarchar(100)
	Select @strTop = '(' + @Top + ')'
	if len(@Top) = 0 
		BEGIN
			Select @strTop = '100 percent'
		END
	Select @SQL = 'SELECT top ' + @strTop + ' * FROM [tblQuangCao]'
	if len(@Where) >0 
		BEGIN
			Select @SQL = @SQL + ' Where ' + @Where
		END
	if len(@Order) >0
		BEGIN
			Select @SQL = @SQL + ' Order by ' + @Order
		END
	EXEC (@SQL)

GO
/****** Object:  StoredProcedure [dbo].[sp_QuanLyMeNu_Delete]    Script Date: 3/6/2017 6:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_QuanLyMeNu_Delete]
	@ID int
AS
BEGIN
	delete from tbl_QuanLyMeNu where ID=@ID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_QuanLyMeNu_getByTop]    Script Date: 3/6/2017 6:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_QuanLyMeNu_getByTop]
@Top	nvarchar(10),
@Where	nvarchar(MAX),
@Order	nvarchar(200)
AS
	Declare @SQL as nvarchar(500)
	Declare @strTop as nvarchar(100)
	Select @strTop = '(' + @Top + ')'
	if len(@Top) = 0 
		BEGIN
			Select @strTop = '100 percent'
		END
	Select @SQL = 'SELECT top ' + @strTop + ' * FROM [tbl_QuanLyMeNu]'
	if len(@Where) >0 
		BEGIN
			Select @SQL = @SQL + ' Where ' + @Where
		END
	if len(@Order) >0
		BEGIN
			Select @SQL = @SQL + ' Order by ' + @Order
		END
	EXEC (@SQL)

GO
/****** Object:  StoredProcedure [dbo].[sp_QuanLyMeNu_Insert]    Script Date: 3/6/2017 6:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_QuanLyMeNu_Insert]
	@TenMenu nvarchar(50),
	@Type int,
	@Ord int,
	@Level nvarchar(50),
	@Link nvarchar(500),
	@TypeClick nvarchar(50),
	@Icon nvarchar(250),
	@Active bit
AS
BEGIN
	insert into tbl_QuanLyMeNu(TenMenu,[Type],Ord,[Level],Link,TypeClick,Icon,Active) values(@TenMenu,@Type,@Ord,@Level,@Link,@TypeClick,@Icon,@Active)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_QuanLyMeNu_Update]    Script Date: 3/6/2017 6:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[sp_QuanLyMeNu_Update]
	@id int,
	@TenMenu nvarchar(50),
	@Type int,
	@Ord int,
	@Level nvarchar(50),
	@Link nvarchar(500),
	@TypeClick nvarchar(50),
	@Icon nvarchar(250),
	@Active bit
AS
BEGIN
	update tbl_QuanLyMeNu set TenMenu = @TenMenu, [Type] = @Type, Ord = @Ord, [Level] = @Level,
	Link=@Link,TypeClick=@TypeClick,Icon=@Icon,Active=@Active
	where id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_SanPhamView_Update]    Script Date: 3/6/2017 6:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[sp_SanPhamView_Update]
	@id int

AS
BEGIN
	declare @get_LuotXem int=(Select LuotXem from tbl_Hang where id=@id)
	if(@get_LuotXem is null)
		update tbl_Hang set LuotXem=1 where id = @id
	else		
		update tbl_Hang set LuotXem=LuotXem+1 where id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_TinTuc_Delete]    Script Date: 3/6/2017 6:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_TinTuc_Delete]
	@id int
AS
BEGIN
	delete from tbl_TinTuc where id=@id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_TinTuc_getByTop]    Script Date: 3/6/2017 6:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_TinTuc_getByTop]
@Top	nvarchar(10),
@Where	nvarchar(MAX),
@Order	nvarchar(200)
AS
	Declare @SQL as nvarchar(500)
	Declare @strTop as nvarchar(100)
	Select @strTop = '(' + @Top + ')'
	if len(@Top) = 0 
		BEGIN
			Select @strTop = '100 percent'
		END
	Select @SQL = 'SELECT top ' + @strTop + ' id,tieuDe,tomtat,noidung,convert(varchar,ngayviet,120) as ngayviet,id_nhanvien,urlHinhAnh,LuotXem,Active FROM [tbl_TinTuc]'
	if len(@Where) >0 
		BEGIN
			Select @SQL = @SQL + ' Where ' + @Where
		END
	if len(@Order) >0
		BEGIN
			Select @SQL = @SQL + ' Order by ' + @Order
		END
	EXEC (@SQL)

GO
/****** Object:  StoredProcedure [dbo].[sp_TinTuc_Insert]    Script Date: 3/6/2017 6:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_TinTuc_Insert]
	@tieuDe nvarchar(500),
	@tomtat ntext,
	@noidung ntext,
	@ngayviet date,
	@id_nhanvien int,
	@urlHinhAnh text,
	@Active bit
AS
BEGIN
	insert into tbl_TinTuc(tieuDe,tomtat,noidung,ngayviet,id_nhanvien,urlHinhAnh,Active) values(@tieuDe,@tomtat,@noidung,@ngayviet,@id_nhanvien,@urlHinhAnh,@Active)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_TinTuc_Update]    Script Date: 3/6/2017 6:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[sp_TinTuc_Update]
	@id int,
	@tieuDe nvarchar(500),
	@tomtat ntext,
	@noidung ntext,
	@ngayviet date,
	@id_nhanvien int,
	@urlHinhAnh text,
	@Active bit
AS
BEGIN
	update tbl_TinTuc set tieuDe = @tieuDe, tomtat = @tomtat, noidung = @noidung, ngayviet = @ngayviet,
	id_nhanvien=@id_nhanvien,urlHinhAnh=@urlHinhAnh,Active=@Active
	where id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_TinTucView_Update]    Script Date: 3/6/2017 6:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[sp_TinTucView_Update]
	@id int

AS
BEGIN
	declare @get_LuotXem int=(Select LuotXem from tbl_TinTuc where id=@id)
	if(@get_LuotXem is null)
		update tbl_TinTuc set LuotXem=1 where id = @id	
	else		
		update tbl_TinTuc set LuotXem=LuotXem+1 where id = @id
	

END
GO
/****** Object:  UserDefinedFunction [dbo].[fuChuyenCoDauThanhKhongDau]    Script Date: 3/6/2017 6:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fuChuyenCoDauThanhKhongDau]
(
      @strInput NVARCHAR(4000)
)
RETURNS NVARCHAR(4000)
AS
BEGIN    
    IF @strInput IS NULL RETURN @strInput
    IF @strInput = '' RETURN @strInput
    DECLARE @RT NVARCHAR(4000)
    DECLARE @SIGN_CHARS NCHAR(136)
    DECLARE @UNSIGN_CHARS NCHAR (136)
 
    SET @SIGN_CHARS = N'ăâđêôơưàảãạáằẳẵặắầẩẫậấèẻẽẹéềểễệế
                 ìỉĩịíòỏõọóồổỗộốờởỡợớùủũụúừửữựứỳỷỹỵý
                 ĂÂĐÊÔƠƯÀẢÃẠÁẰẲẴẶẮẦẨẪẬẤÈẺẼẸÉỀỂỄỆẾÌỈĨỊÍ
                 ÒỎÕỌÓỒỔỖỘỐỜỞỠỢỚÙỦŨỤÚỪỬỮỰỨỲỶỸỴÝ'
                  +NCHAR(272)+ NCHAR(208)
    SET @UNSIGN_CHARS = N'aadeoouaaaaaaaaaaaaaaaeeeeeeeeee
                 iiiiiooooooooooooooouuuuuuuuuuyyyyy
                 AADEOOUAAAAAAAAAAAAAAAEEEEEEEEEEIIIII
                 OOOOOOOOOOOOOOOUUUUUUUUUUYYYYYDD'
 
    DECLARE @COUNTER INT
    DECLARE @COUNTER1 INT
    SET @COUNTER = 1
 
    WHILE (@COUNTER <=LEN(@strInput))
    BEGIN  
      SET @COUNTER1 = 1
      --Tìm trong chuỗi mẫu
       WHILE (@COUNTER1 <=LEN(@SIGN_CHARS)+1)
       BEGIN
     IF UNICODE(SUBSTRING(@SIGN_CHARS, @COUNTER1,1))
            = UNICODE(SUBSTRING(@strInput,@COUNTER ,1) )
     BEGIN          
          IF @COUNTER=1
              SET @strInput = SUBSTRING(@UNSIGN_CHARS, @COUNTER1,1)
              + SUBSTRING(@strInput, @COUNTER+1,LEN(@strInput)-1)                  
          ELSE
              SET @strInput = SUBSTRING(@strInput, 1, @COUNTER-1)
              +SUBSTRING(@UNSIGN_CHARS, @COUNTER1,1)
              + SUBSTRING(@strInput, @COUNTER+1,LEN(@strInput)- @COUNTER)
              BREAK
               END
             SET @COUNTER1 = @COUNTER1 +1
       END
      --Tìm tiếp
       SET @COUNTER = @COUNTER +1
    END
    SET @strInput = REPLACE(@strInput,' ','-')
    RETURN @strInput
END

GO
/****** Object:  Table [dbo].[PayMeThod]    Script Date: 3/6/2017 6:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PayMeThod](
	[IdPay] [int] IDENTITY(1,1) NOT NULL,
	[HinhThucThanhToan] [nvarchar](50) NULL,
	[Visible] [bit] NULL,
 CONSTRAINT [PK_PayMeThod] PRIMARY KEY CLUSTERED 
(
	[IdPay] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_ChiTietDatHang]    Script Date: 3/6/2017 6:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_ChiTietDatHang](
	[id_hoadon] [int] NOT NULL,
	[id_hang] [int] NOT NULL,
	[SoLuongMua] [int] NULL,
	[ThanhTien] [money] NULL,
	[Size] [char](10) NULL,
	[Gia] [money] NULL,
 CONSTRAINT [PK_tbl_ChiTietHoaDon] PRIMARY KEY CLUSTERED 
(
	[id_hoadon] ASC,
	[id_hang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_DatHang]    Script Date: 3/6/2017 6:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_DatHang](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[NgaylapHD] [date] NULL,
	[id_KhachHang] [int] NULL,
	[IdPay] [int] NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Hang]    Script Date: 3/6/2017 6:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Hang](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TenHang] [nvarchar](50) NULL,
	[image] [nvarchar](max) NULL,
	[ChatLieu] [nvarchar](50) NULL,
	[Mota] [ntext] NULL,
	[LuotXem] [int] NULL,
	[giaMoi] [money] NULL,
	[giaCu] [money] NULL,
	[id_Menu] [int] NULL,
	[Soluong] [int] NULL,
	[TinhTrang] [nvarchar](50) NULL,
	[Active] [bit] NULL,
	[image_large] [varchar](500) NULL,
	[TomTat] [nvarchar](max) NULL,
 CONSTRAINT [PK_tbl_Hang] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_KhachHang]    Script Date: 3/6/2017 6:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_KhachHang](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tenKH] [nvarchar](50) NULL,
	[GioiTinh] [bit] NULL,
	[NgaySinh] [date] NULL,
	[TaiKhoan] [nvarchar](50) NULL,
	[MatKhau] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[SDT] [char](10) NULL,
	[Tinh] [nvarchar](50) NULL,
	[Quan] [nvarchar](50) NULL,
	[TinhTrang] [nvarchar](50) NULL,
	[DiaChi] [ntext] NULL,
	[Link_Fb] [varchar](200) NULL,
 CONSTRAINT [PK_tbl_KhachHang] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_KhuyenMai]    Script Date: 3/6/2017 6:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_KhuyenMai](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[GiaTri] [int] NULL,
 CONSTRAINT [PK_tbl_KhuyenMai] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_LienLac]    Script Date: 3/6/2017 6:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_LienLac](
	[Ten] [nvarchar](50) NULL,
	[DiaChi] [ntext] NULL,
	[DienThoai] [char](10) NULL,
	[Email] [varchar](50) NULL,
	[ChuDe] [nvarchar](50) NULL,
	[NoiDung] [ntext] NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_tbl_LienLac] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_NhaCungCap]    Script Date: 3/6/2017 6:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_NhaCungCap](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tenNCC] [nvarchar](50) NULL,
	[DiaChi] [ntext] NULL,
	[DienThoai] [nchar](10) NULL,
	[Email] [nchar](10) NULL,
 CONSTRAINT [PK_tbl_NhaCungCap] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_NhanVien]    Script Date: 3/6/2017 6:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_NhanVien](
	[id] [int] NOT NULL,
	[tenNV] [nvarchar](50) NULL,
	[NgaySinh] [date] NULL,
	[gioitinh] [nvarchar](50) NULL,
	[ChucVu] [nvarchar](50) NULL,
	[id_quyen] [int] NULL,
	[UserName] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_NhanVien] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_NhomHang]    Script Date: 3/6/2017 6:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_NhomHang](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TenNhomHang] [nvarchar](50) NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_tbl_Menu] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_PhieuNhap]    Script Date: 3/6/2017 6:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_PhieuNhap](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ngayNhap] [date] NULL,
	[id_nhanvien] [int] NULL,
	[id_NCC] [int] NULL,
 CONSTRAINT [PK_tbl_PhieuNhap] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_QuanLyMeNu]    Script Date: 3/6/2017 6:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_QuanLyMeNu](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TenMenu] [nvarchar](50) NULL,
	[Type] [int] NULL,
	[Ord] [int] NULL,
	[Level] [nvarchar](50) NULL,
	[Link] [nvarchar](500) NULL,
	[TypeClick] [nvarchar](50) NULL,
	[Icon] [nvarchar](250) NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_tbl_QuanLyMeNu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Quyen]    Script Date: 3/6/2017 6:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Quyen](
	[id] [int] NOT NULL,
	[TaiKhoan] [nvarchar](50) NULL,
	[MatKhau] [nvarchar](50) NULL,
	[id_NhanVien] [int] NULL,
	[TenQuyen] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_Quyen] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_TinTuc]    Script Date: 3/6/2017 6:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_TinTuc](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tieuDe] [nvarchar](max) NULL,
	[tomtat] [nvarchar](max) NULL,
	[noidung] [nvarchar](max) NULL,
	[ngayviet] [date] NULL,
	[id_nhanvien] [int] NULL,
	[urlHinhAnh] [text] NULL,
	[LuotXem] [int] NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_tbl_TinTuc] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblQuangCao]    Script Date: 3/6/2017 6:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblQuangCao](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[urlImage] [varchar](50) NULL,
	[Active] [bit] NULL,
	[Count_Click] [int] NULL,
 CONSTRAINT [PK_Anh_GioiThieu] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[PayMeThod] ON 

INSERT [dbo].[PayMeThod] ([IdPay], [HinhThucThanhToan], [Visible]) VALUES (1, N'Giao hàng nhận tiên', 1)
INSERT [dbo].[PayMeThod] ([IdPay], [HinhThucThanhToan], [Visible]) VALUES (2, N'Qua thẻ ngân hàng', 1)
SET IDENTITY_INSERT [dbo].[PayMeThod] OFF
INSERT [dbo].[tbl_ChiTietDatHang] ([id_hoadon], [id_hang], [SoLuongMua], [ThanhTien], [Size], [Gia]) VALUES (41, 1, 1, 500000.0000, N'S         ', 500000.0000)
INSERT [dbo].[tbl_ChiTietDatHang] ([id_hoadon], [id_hang], [SoLuongMua], [ThanhTien], [Size], [Gia]) VALUES (42, 1, 1, 500000.0000, N'S         ', 500000.0000)
INSERT [dbo].[tbl_ChiTietDatHang] ([id_hoadon], [id_hang], [SoLuongMua], [ThanhTien], [Size], [Gia]) VALUES (43, 1, 1, 500000.0000, N'S         ', 500000.0000)
INSERT [dbo].[tbl_ChiTietDatHang] ([id_hoadon], [id_hang], [SoLuongMua], [ThanhTien], [Size], [Gia]) VALUES (43, 2, 2, 2.0000, N's         ', NULL)
INSERT [dbo].[tbl_ChiTietDatHang] ([id_hoadon], [id_hang], [SoLuongMua], [ThanhTien], [Size], [Gia]) VALUES (44, 1, 1, 500000.0000, N'S         ', 500000.0000)
INSERT [dbo].[tbl_ChiTietDatHang] ([id_hoadon], [id_hang], [SoLuongMua], [ThanhTien], [Size], [Gia]) VALUES (44, 4, 1, 280000.0000, N'S         ', 280000.0000)
INSERT [dbo].[tbl_ChiTietDatHang] ([id_hoadon], [id_hang], [SoLuongMua], [ThanhTien], [Size], [Gia]) VALUES (45, 1, 1, 500000.0000, N'S         ', 500000.0000)
INSERT [dbo].[tbl_ChiTietDatHang] ([id_hoadon], [id_hang], [SoLuongMua], [ThanhTien], [Size], [Gia]) VALUES (45, 8, 1, 540000.0000, N'S         ', 540000.0000)
SET IDENTITY_INSERT [dbo].[tbl_DatHang] ON 

INSERT [dbo].[tbl_DatHang] ([id], [NgaylapHD], [id_KhachHang], [IdPay]) VALUES (41, CAST(0x873C0B00 AS Date), 28, 1)
INSERT [dbo].[tbl_DatHang] ([id], [NgaylapHD], [id_KhachHang], [IdPay]) VALUES (42, CAST(0x873C0B00 AS Date), 29, 1)
INSERT [dbo].[tbl_DatHang] ([id], [NgaylapHD], [id_KhachHang], [IdPay]) VALUES (43, CAST(0x873C0B00 AS Date), 30, 1)
INSERT [dbo].[tbl_DatHang] ([id], [NgaylapHD], [id_KhachHang], [IdPay]) VALUES (44, CAST(0x893C0B00 AS Date), 32, 2)
INSERT [dbo].[tbl_DatHang] ([id], [NgaylapHD], [id_KhachHang], [IdPay]) VALUES (45, CAST(0x893C0B00 AS Date), 33, 1)
SET IDENTITY_INSERT [dbo].[tbl_DatHang] OFF
SET IDENTITY_INSERT [dbo].[tbl_Hang] ON 

INSERT [dbo].[tbl_Hang] ([id], [TenHang], [image], [ChatLieu], [Mota], [LuotXem], [giaMoi], [giaCu], [id_Menu], [Soluong], [TinhTrang], [Active], [image_large], [TomTat]) VALUES (1, N'AK68 ÁO KHOÁC DẠ', N'images/timthumb3.png', N'áo khoác dạ', N'<p>Sang, chảnh nhờ &aacute;o kho&aacute;c dạ k&egrave;m mũ l&ocirc;ng trong m&ugrave;a đ&ocirc;ng m&agrave; kh&ocirc;ng lo về gi&aacute;.</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<img alt="SHOP THỜI TRANG XINH" src="http://thoitrangxinh.net/upload/images/ak68b_logo.jpg" /></p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<img alt="SHOP THỜI TRANG XINH" src="http://thoitrangxinh.net/upload/images/ak68_logo.jpg" /></p>
', 355, 500000.0000, 750000.0000, 2, 3, N'Còn', 1, N'images/timthumb3_large.jpg', N'')
INSERT [dbo].[tbl_Hang] ([id], [TenHang], [image], [ChatLieu], [Mota], [LuotXem], [giaMoi], [giaCu], [id_Menu], [Soluong], [TinhTrang], [Active], [image_large], [TomTat]) VALUES (2, N'DL372 ĐẦM DẠ GHI-LÊ (2 TÚI THẬT)', N'images/timthumb13.png', N'da min', N'<p>Đối với những chiếc đầm ghi-l&ecirc; b&igrave;nh thường mang lại vẻ đứng đắn cho người mặc th&igrave; những chiếc ghi- l&ecirc; c&aacute;ch điệu với việc phối 2 t&uacute;i b&ecirc;n h&ocirc;ng sẽ tạo n&eacute;t duy&ecirc;n d&aacute;ng hơn cho người mặc.</p>

<p>M&ugrave;a xu&acirc;n l&agrave; m&ugrave;a hoa cỏ đua nhau khoe sắc n&ecirc;n con người ta cũng đua nhau trưng diện bằng những &nbsp;&ldquo;bộ c&aacute;nh&rdquo; rực rỡ.&nbsp;Nếu bạn trẻ trung, năng động, muốn tạo cho m&igrave;nh sự tươi mới v&agrave;o những ng&agrave;y se lạnh đầu năm th&igrave; h&atilde;y phối 1 chiếc&nbsp;<strong>ĐẦM DẠ GHI-L&Ecirc; C&Aacute;CH ĐIỆU</strong><em><strong>&nbsp;m&agrave;u đen&nbsp;</strong></em>với 1 chiếc &aacute;o thun đen d&agrave;i tay.</p>

<p>Bộ trang phục n&agrave;y sẽ&nbsp;vừa c&oacute; t&aacute;c dụng giữ ấm, vừa thể hiện được t&iacute;nh c&aacute;ch của bạn,&nbsp;khiến người nh&igrave;n phải d&otilde;i mắt theo từng bước ch&acirc;n của bạn.</p>

<p>Nếu bạn l&agrave; người co l&agrave;n da trắng hồng hay đặc biệt l&agrave;&nbsp;l&agrave;n da &quot;b&aacute;nh mật&quot;&nbsp;v&agrave; th&iacute;ch sự tươi mới, năng động&nbsp;trong bộ trang phục&nbsp;th&igrave; h&atilde;y tham khảo mẫu&nbsp;<a href="http://thoitrangxinh.net/san-pham/dl371-dam-da-ghile-2-tui-that-701.html"><em><strong>ĐẦM ĐẦM DẠ GHI-L&Ecirc; m&agrave;u cam</strong></em></a>&nbsp;nh&eacute;.</p>

<p>&nbsp;</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <img alt="SHOP THỜI TRANG XINH" src="http://thoitrangxinh.net/upload/images/dl372a(1).jpg" /></p>

<p>&nbsp;</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<img alt="SHOP THỜI TRANG XINH" src="http://thoitrangxinh.net/upload/images/dl372b(1).jpg" /></p>

<p>&nbsp;</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<img alt="SHOP THỜI TRANG XINH" src="http://thoitrangxinh.net/upload/images/dl372c(1).jpg" /></p>
', 9, 297000.0000, 330000.0000, 1, 3, N'Còn', 1, N'images/timthumb13_large.jpg', N'ĐẦM DẠ GHI-LÊ 2 túi thật màu đen sẽ là lựa chọn số 1 cho những chị thích sự trẻ trung nhưng vẫn mang dáng dấp đứng đắn, điểm tĩnh và nhẹ nhàng cho người mặc vào những ngày đầu năm.')
INSERT [dbo].[tbl_Hang] ([id], [TenHang], [image], [ChatLieu], [Mota], [LuotXem], [giaMoi], [giaCu], [id_Menu], [Soluong], [TinhTrang], [Active], [image_large], [TomTat]) VALUES (3, N'DL236 Peplum tay ngắn', N'images/timthumb4.png', N'Thun lụa co giãn 4 chiều', N'<p>Đầm peplum tay cộc che bụng chất liệu thun lụa co gi&atilde;n 4 chiều mới về cho n&agrave;ng diện cả h&egrave; m&aacute;t mẻ nh&eacute;.</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<img alt="SHOP THỜI TRANG XINH" src="http://demo52.ninavietnam.org/ilead/upload/images/DL236moi.jpg" /></p>

<p>&nbsp;</p>
', 22, 159000.0000, 259000.0000, 3, 4, N'Còn', 1, N'images/timthumb4_large.jpg', N'')
INSERT [dbo].[tbl_Hang] ([id], [TenHang], [image], [ChatLieu], [Mota], [LuotXem], [giaMoi], [giaCu], [id_Menu], [Soluong], [TinhTrang], [Active], [image_large], [TomTat]) VALUES (4, N'DL367 ĐẦM SUÔNG PHỐI REN LƯỚI', N'images/timthumb.png', N'tuyết tâm co giãn + ren lưới', NULL, 66, 280000.0000, 315000.0000, 1, 4, N'Còn', 1, N'images/timthumb_large.jpg', NULL)
INSERT [dbo].[tbl_Hang] ([id], [TenHang], [image], [ChatLieu], [Mota], [LuotXem], [giaMoi], [giaCu], [id_Menu], [Soluong], [TinhTrang], [Active], [image_large], [TomTat]) VALUES (5, N'DL370 ĐẦM XÒE DÂY RÚT', N'images/timthumb7.png', N'cát hàn co giãn', N'<p>Nếu bạn theo đuổi phong c&aacute;ch nữ t&iacute;nh dịu d&agrave;ng th&igrave; chắc hẳn bạn sẽ kh&ocirc;ng bỏ qua c&aacute;c mẫu đầm x&ograve;e đ&acirc;u đ&uacute;ng kh&ocirc;ng ?</p>

<p>Người xưa c&oacute; c&acirc;u &ldquo;<strong><em>Người đẹp v&igrave; lụa</em></strong>&rdquo; v&agrave; từ những thập kỉ trước trong c&aacute;c buổi tiệc, ta lu&ocirc;n thấy sự xuất hiện lộng lẫy, đầy sang trọng v&agrave; qu&yacute; ph&aacute;i của những c&ocirc; g&aacute;i thướt tha trong chiếc đầm x&ograve;e. Với kiểu d&aacute;ng đặc trưng, những chiếc đầm x&ograve;e lu&ocirc;n c&oacute; c&ocirc;ng dụng tuyệt vời:</p>

<ul>
	<li>Bạn gầy th&igrave; thiết kế t&ugrave;ng v&aacute;y x&ograve;e sẽ gi&uacute;p bạn nh&igrave;n mập hơn, c&oacute; d&aacute;ng hơn; đồng thời khi bạn kết hợp d&acirc;y r&uacute;t sẽ t&ocirc; điểm được v&ograve;ng eo cho bạn.</li>
	<li>Bạn bụng bự th&igrave; t&ugrave;ng x&ograve;e sẽ che di khuyết điểm n&agrave;y cho bạn.</li>
</ul>

<p>Với những c&ocirc; g&aacute;i tuổi từ 25 bắt đầu đi l&agrave;m hay c&oacute; gia đ&igrave;nh th&igrave; sẽ trở n&ecirc;n chin chắn hơn n&ecirc;n khi mua đầm, c&aacute;c bạn lu&ocirc;n muốn thể hiện sự lựa chọn tinh tế của m&igrave;nh cả về m&agrave;u sắc v&agrave; d&aacute;ng đầm</p>

<p><em><strong>Đầm x&ograve;e d&acirc;y r&uacute;t</strong></em>&nbsp;d&agrave;i qua gối với gam m&agrave;u nh&atilde; nhặn<em><strong>&nbsp;</strong></em>xanh đen v&agrave;&nbsp;<a href="http://thoitrangxinh.net/san-pham/dl369-dam-xoe-day-rut-699.html"><em><strong>cam gạch</strong></em></a>&nbsp;sẽ l&agrave; sự lựa chọn tuyệt vời cho c&aacute;c chị đấy nh&eacute;.</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<img alt="SHOP THỜI TRANG XINH" src="http://thoitrangxinh.net/upload/images/dl270_logo.jpg" /></p>
', NULL, 315000.0000, 350000.0000, 1, 4, N'Còn', 1, N'images/timthumb7_large.jpg', N'ĐẦM XÒE DÂY RÚT dành cho những cô nàng theo đuổi phong cách nữ tính, dịu dàng. Ưu thế của ĐẦM XÒE DÂY RÚT là thích hợp cho cả nàng "cò hương" và chị "eo bánh mì"')
INSERT [dbo].[tbl_Hang] ([id], [TenHang], [image], [ChatLieu], [Mota], [LuotXem], [giaMoi], [giaCu], [id_Menu], [Soluong], [TinhTrang], [Active], [image_large], [TomTat]) VALUES (6, N'AK67 ÁO KHOÁC DẠ', N'images/timthumb3.png', N'áo khoác dạ', NULL, 10, 675000.0000, 750000.0000, 2, 4, N'Còn', 1, N'images/timthumb3_large.jpg', NULL)
INSERT [dbo].[tbl_Hang] ([id], [TenHang], [image], [ChatLieu], [Mota], [LuotXem], [giaMoi], [giaCu], [id_Menu], [Soluong], [TinhTrang], [Active], [image_large], [TomTat]) VALUES (7, N'DL232 Color blook trẻ trung', N'images/timthumb12.png', N' Kim sa nhung co giãn 4 chiều vải cực kỳ đẹp và má', N'<p>Nếu n&agrave;ng cảm thấy chiếc đầm một m&agrave;u qu&aacute; nhiều v&agrave; nh&agrave;m ch&aacute;n v&igrave; ko mấy tạo cho n&agrave;ng th&ecirc;m ấn tượng mới mẻ th&igrave; h&atilde;y chọn ngay một chiếc đầm phối m&agrave;u trẻ trung giữa trắng, đen v&agrave; hồng cam như thế n&agrave;y nh&eacute;. Ngo&agrave;i việc chiếc đầm tạo cho n&agrave;ng ấn tượng trẻ trung th&igrave; color blook n&agrave;y c&ograve;n che được khuyết điểm ở c&aacute;c v&ugrave;ng bụng v&agrave; tạo eo triệt để cho n&agrave;ng tự tin hơn diện khai xu&acirc;n năm mới.</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<img alt="SHOP THỜI TRANG XINH" src="http://demo52.ninavietnam.org/ilead/upload/images/DL232a.jpg" /></p>
', 2, 179000.0000, 330000.0000, 3, 3, N'Còn', 1, N'images/timthumb12_large.jpg', N'')
INSERT [dbo].[tbl_Hang] ([id], [TenHang], [image], [ChatLieu], [Mota], [LuotXem], [giaMoi], [giaCu], [id_Menu], [Soluong], [TinhTrang], [Active], [image_large], [TomTat]) VALUES (8, N'AK64 TRẦN BÔNG NHẬP KHẨU', N'images/timthumb10.png', N'trần bông 2 lớp', N'<p>&Aacute;o kho&aacute;c chất liệu trần 2 lớp cao cấp kết hợp mũ l&ocirc;ng vừa ấm, vửa xinh cho phụ nữ ch&uacute;ng ta trong m&ugrave;a đ&ocirc;ng.</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<img alt="SHOP THỜI TRANG XINH" src="http://thoitrangxinh.net/upload/images/ak64a_logo.jpg" /></p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<img alt="SHOP THỜI TRANG XINH" src="http://thoitrangxinh.net/upload/images/ak64b_logo.jpg" /></p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<img alt="SHOP THỜI TRANG XINH" src="http://thoitrangxinh.net/upload/images/ak64c_logo.jpg" /></p>
', 54, 540000.0000, 600000.0000, 2, 3, N'Còn', 1, N'images/timthumb10_large.jpg', N'')
INSERT [dbo].[tbl_Hang] ([id], [TenHang], [image], [ChatLieu], [Mota], [LuotXem], [giaMoi], [giaCu], [id_Menu], [Soluong], [TinhTrang], [Active], [image_large], [TomTat]) VALUES (9, N'AK60 ÁO KHOÁC DẠ', N'images/timthumb20.png', N'dạ', N'<p>&Aacute;o kho&aacute;c dạ với thiết kế hiện đại, sang trọng mang lại gu thời trang đẳng cấp, tinh tế d&agrave;nh cho người mặc.</p>

<p>&Aacute;o kho&aacute;c dạ nữ lu&ocirc;n l&agrave; một item được c&aacute;c qu&yacute; c&ocirc; ưa chuộng v&agrave;o mỗi m&ugrave;a thu đ&ocirc;ng. Ch&uacute;ng kh&ocirc;ng chỉ được y&ecirc;u th&iacute;ch bởi c&aacute;c thiết kế độc đ&aacute;o, bắt mắt, t&ocirc;n d&aacute;ng người mặc m&agrave; c&ograve;n ở chất liệu vải d&agrave;y dặn gi&uacute;p người mặc giữ ấm trong những ng&agrave;y đ&ocirc;ng lạnh gi&aacute;.</p>

<p>Chỉ cần phối hợp với c&aacute;c phụ kiện v&agrave; trang phục kh&aacute;c, mẫu &aacute;o kho&aacute;c dạ nữ sẽ gi&uacute;p c&aacute;c n&agrave;ng tr&ocirc;ng thật thời trang, thu h&uacute;t trong mắt mọi người.</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<img alt="SHOP THỜI TRANG XINH" src="http://thoitrangxinh.net/upload/images/Ak60e.jpg" /></p>
', 23, 585000.0000, 650000.0000, 2, 3, N'Còn', 1, N'images/timthumb20_large.jpg', N'')
INSERT [dbo].[tbl_Hang] ([id], [TenHang], [image], [ChatLieu], [Mota], [LuotXem], [giaMoi], [giaCu], [id_Menu], [Soluong], [TinhTrang], [Active], [image_large], [TomTat]) VALUES (24, N'AK68 ÁO KHOÁC DẠ', N'images/timthumb3.png', N'áo khoác dạ', N'<p>Sang, chảnh nhờ &aacute;o kho&aacute;c dạ k&egrave;m mũ l&ocirc;ng trong m&ugrave;a đ&ocirc;ng m&agrave; kh&ocirc;ng lo về gi&aacute;.</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<img alt="SHOP THỜI TRANG XINH" src="http://thoitrangxinh.net/upload/images/ak68b_logo.jpg" /></p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<img alt="SHOP THỜI TRANG XINH" src="http://thoitrangxinh.net/upload/images/ak68_logo.jpg" /></p>
', 7, 500000.0000, 750000.0000, 2, 3, N'Còn', 1, N'images/timthumb3_large.jpg', N'')
INSERT [dbo].[tbl_Hang] ([id], [TenHang], [image], [ChatLieu], [Mota], [LuotXem], [giaMoi], [giaCu], [id_Menu], [Soluong], [TinhTrang], [Active], [image_large], [TomTat]) VALUES (25, N'AK68 ÁO KHOÁC DẠ', N'images/timthumb3.png', N'áo khoác dạ', N'<p>Sang, chảnh nhờ &aacute;o kho&aacute;c dạ k&egrave;m mũ l&ocirc;ng trong m&ugrave;a đ&ocirc;ng m&agrave; kh&ocirc;ng lo về gi&aacute;.</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<img alt="SHOP THỜI TRANG XINH" src="http://thoitrangxinh.net/upload/images/ak68b_logo.jpg" /></p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<img alt="SHOP THỜI TRANG XINH" src="http://thoitrangxinh.net/upload/images/ak68_logo.jpg" /></p>
', 2, 500000.0000, 750000.0000, 2, 88, N'Còn', 1, N'images/timthumb3_large.jpg', N'')
SET IDENTITY_INSERT [dbo].[tbl_Hang] OFF
SET IDENTITY_INSERT [dbo].[tbl_KhachHang] ON 

INSERT [dbo].[tbl_KhachHang] ([id], [tenKH], [GioiTinh], [NgaySinh], [TaiKhoan], [MatKhau], [Email], [SDT], [Tinh], [Quan], [TinhTrang], [DiaChi], [Link_Fb]) VALUES (8, N'Phạm Xuân Duy', 1, CAST(0x5B950A00 AS Date), N'', N'', N'phamxuanduy1996@gmail.com', N'0981349571', N'Hà Nội', N'Quận Ba Đình', NULL, N'Hà Nội', N'false')
INSERT [dbo].[tbl_KhachHang] ([id], [tenKH], [GioiTinh], [NgaySinh], [TaiKhoan], [MatKhau], [Email], [SDT], [Tinh], [Quan], [TinhTrang], [DiaChi], [Link_Fb]) VALUES (11, N'phamxuanduy', 1, CAST(0x5B950A00 AS Date), N'admin', N'admin', N'phamxuanduy', N'phamxuandu', N'Hà Nội', N'Quận Ba Đình', NULL, N'phamxuanduy', N'false')
INSERT [dbo].[tbl_KhachHang] ([id], [tenKH], [GioiTinh], [NgaySinh], [TaiKhoan], [MatKhau], [Email], [SDT], [Tinh], [Quan], [TinhTrang], [DiaChi], [Link_Fb]) VALUES (18, N'phamduy', 1, CAST(0x5B950A00 AS Date), N'', N'', N'phamduy', N'phamduy   ', N'Hà Nội', N'Quận Ba Đình', NULL, N'phamduy', N'false')
INSERT [dbo].[tbl_KhachHang] ([id], [tenKH], [GioiTinh], [NgaySinh], [TaiKhoan], [MatKhau], [Email], [SDT], [Tinh], [Quan], [TinhTrang], [DiaChi], [Link_Fb]) VALUES (19, N'phamduy', 1, CAST(0x5B950A00 AS Date), N'', N'', N'phamduy', N'phamduy   ', N'Hà Nội', N'Quận Ba Đình', NULL, N'phamduy', N'false')
INSERT [dbo].[tbl_KhachHang] ([id], [tenKH], [GioiTinh], [NgaySinh], [TaiKhoan], [MatKhau], [Email], [SDT], [Tinh], [Quan], [TinhTrang], [DiaChi], [Link_Fb]) VALUES (28, N'1', 1, CAST(0x5B950A00 AS Date), N'', N'', N'1', N'1         ', N'Hà Nội', N'Quận Ba Đình', NULL, N'1', N'false')
INSERT [dbo].[tbl_KhachHang] ([id], [tenKH], [GioiTinh], [NgaySinh], [TaiKhoan], [MatKhau], [Email], [SDT], [Tinh], [Quan], [TinhTrang], [DiaChi], [Link_Fb]) VALUES (29, N'1', 1, CAST(0x5B950A00 AS Date), N'', N'', N'1', N'1         ', N'Hà Nội', N'Quận Ba Đình', NULL, N'1', N'false')
INSERT [dbo].[tbl_KhachHang] ([id], [tenKH], [GioiTinh], [NgaySinh], [TaiKhoan], [MatKhau], [Email], [SDT], [Tinh], [Quan], [TinhTrang], [DiaChi], [Link_Fb]) VALUES (30, N'2', 1, CAST(0x5B950A00 AS Date), N'', N'', N'2', N'2         ', N'Hà Nội', N'Quận Ba Đình', NULL, N'2', N'false')
INSERT [dbo].[tbl_KhachHang] ([id], [tenKH], [GioiTinh], [NgaySinh], [TaiKhoan], [MatKhau], [Email], [SDT], [Tinh], [Quan], [TinhTrang], [DiaChi], [Link_Fb]) VALUES (32, N'trinhducduong', 1, CAST(0x5B950A00 AS Date), N'', N'', N'trinhducduong@gmail.com', N'012345678 ', N'Hà Nội', N'Quận Ba Đình', NULL, N'Cổ nhuế', N'false')
INSERT [dbo].[tbl_KhachHang] ([id], [tenKH], [GioiTinh], [NgaySinh], [TaiKhoan], [MatKhau], [Email], [SDT], [Tinh], [Quan], [TinhTrang], [DiaChi], [Link_Fb]) VALUES (33, N'kimvansang', 1, CAST(0x5B950A00 AS Date), N'', N'', N'kimvansang@gmail.com', N'0981348561', N'Hà Nội', N'Quận Ba Đình', NULL, N'hà nội', N'false')
INSERT [dbo].[tbl_KhachHang] ([id], [tenKH], [GioiTinh], [NgaySinh], [TaiKhoan], [MatKhau], [Email], [SDT], [Tinh], [Quan], [TinhTrang], [DiaChi], [Link_Fb]) VALUES (34, N'', 1, CAST(0x5B950A00 AS Date), N'quantri', N'', N'', N'          ', N'', N'', NULL, N'', N'https://www.facebook.com/app_scoped_user_id/2048981961994944/')
SET IDENTITY_INSERT [dbo].[tbl_KhachHang] OFF
SET IDENTITY_INSERT [dbo].[tbl_KhuyenMai] ON 

INSERT [dbo].[tbl_KhuyenMai] ([id], [GiaTri]) VALUES (1, 10)
SET IDENTITY_INSERT [dbo].[tbl_KhuyenMai] OFF
SET IDENTITY_INSERT [dbo].[tbl_LienLac] ON 

INSERT [dbo].[tbl_LienLac] ([Ten], [DiaChi], [DienThoai], [Email], [ChuDe], [NoiDung], [id]) VALUES (N'1', N'1', N'1         ', N'1', N'1', N'1', 1)
INSERT [dbo].[tbl_LienLac] ([Ten], [DiaChi], [DienThoai], [Email], [ChuDe], [NoiDung], [id]) VALUES (N'2', N'2', N'2         ', N'2', N'2', N'2', 2)
INSERT [dbo].[tbl_LienLac] ([Ten], [DiaChi], [DienThoai], [Email], [ChuDe], [NoiDung], [id]) VALUES (N'3', N'3', N'3         ', N'3', N'3', N'3', 3)
INSERT [dbo].[tbl_LienLac] ([Ten], [DiaChi], [DienThoai], [Email], [ChuDe], [NoiDung], [id]) VALUES (N'10', N'10', N'10        ', N'10', N'10', N'10', 4)
SET IDENTITY_INSERT [dbo].[tbl_LienLac] OFF
INSERT [dbo].[tbl_NhanVien] ([id], [tenNV], [NgaySinh], [gioitinh], [ChucVu], [id_quyen], [UserName], [Password]) VALUES (1, N'1', NULL, NULL, NULL, NULL, N'admin', N'admin')
SET IDENTITY_INSERT [dbo].[tbl_NhomHang] ON 

INSERT [dbo].[tbl_NhomHang] ([id], [TenNhomHang], [Active]) VALUES (1, N'Váy Đầm và set bộ', 1)
INSERT [dbo].[tbl_NhomHang] ([id], [TenNhomHang], [Active]) VALUES (2, N'ÁO KHOÁC ', 1)
INSERT [dbo].[tbl_NhomHang] ([id], [TenNhomHang], [Active]) VALUES (3, N'ĐẦM KHUYẾN MÃI', 1)
SET IDENTITY_INSERT [dbo].[tbl_NhomHang] OFF
SET IDENTITY_INSERT [dbo].[tbl_QuanLyMeNu] ON 

INSERT [dbo].[tbl_QuanLyMeNu] ([ID], [TenMenu], [Type], [Ord], [Level], [Link], [TypeClick], [Icon], [Active]) VALUES (1, N'Tin Tức', 1, 1, N'0001', N'./TinTucAdmin.aspx', N'_self', N'fa fa-edit fa-fw', 1)
INSERT [dbo].[tbl_QuanLyMeNu] ([ID], [TenMenu], [Type], [Ord], [Level], [Link], [TypeClick], [Icon], [Active]) VALUES (2, N'Trang Chủ', 1, 2, N'0002', N'../TrangChu.aspx', N'_blank', N'fa fa-dashboard fa-fw', 1)
INSERT [dbo].[tbl_QuanLyMeNu] ([ID], [TenMenu], [Type], [Ord], [Level], [Link], [TypeClick], [Icon], [Active]) VALUES (3, N'Quản trị hệ thông', 1, 3, N'0003', N'#', NULL, N'fa fa-wrench fa-fw', 1)
INSERT [dbo].[tbl_QuanLyMeNu] ([ID], [TenMenu], [Type], [Ord], [Level], [Link], [TypeClick], [Icon], [Active]) VALUES (4, N'Menu', 1, 1, N'00030001', N'./Menu.aspx', N'_self', NULL, 1)
INSERT [dbo].[tbl_QuanLyMeNu] ([ID], [TenMenu], [Type], [Ord], [Level], [Link], [TypeClick], [Icon], [Active]) VALUES (5, N'Nhân Viên', 1, 2, N'00030002', N'./NhanVien.aspx', N'_self', NULL, 1)
INSERT [dbo].[tbl_QuanLyMeNu] ([ID], [TenMenu], [Type], [Ord], [Level], [Link], [TypeClick], [Icon], [Active]) VALUES (6, N'Khách hàng', 1, 3, N'00030003', N'./KhachHang.aspx', N'_self', NULL, 1)
INSERT [dbo].[tbl_QuanLyMeNu] ([ID], [TenMenu], [Type], [Ord], [Level], [Link], [TypeClick], [Icon], [Active]) VALUES (7, N'Nhà Cung Cấp', 1, 4, N'00030004', N'./NhaCungCap.aspx', N'_self', NULL, 1)
INSERT [dbo].[tbl_QuanLyMeNu] ([ID], [TenMenu], [Type], [Ord], [Level], [Link], [TypeClick], [Icon], [Active]) VALUES (8, N'Hình thức thanh toán', 1, 5, N'00030005', N'./HinhThucThanhToan.aspx', N'_self', NULL, 1)
INSERT [dbo].[tbl_QuanLyMeNu] ([ID], [TenMenu], [Type], [Ord], [Level], [Link], [TypeClick], [Icon], [Active]) VALUES (9, N'Khuyến Mại', 1, 6, N'00030006', N'./KhuyenMai.aspx', N'_self', NULL, 1)
INSERT [dbo].[tbl_QuanLyMeNu] ([ID], [TenMenu], [Type], [Ord], [Level], [Link], [TypeClick], [Icon], [Active]) VALUES (10, N'Liên hệ', 1, 7, N'00030007', N'./LienHe.aspx', N'_self', NULL, 1)
INSERT [dbo].[tbl_QuanLyMeNu] ([ID], [TenMenu], [Type], [Ord], [Level], [Link], [TypeClick], [Icon], [Active]) VALUES (11, N'Quyền', 1, 8, N'00030008', N'./Quyen.aspx', N'_self', NULL, 1)
INSERT [dbo].[tbl_QuanLyMeNu] ([ID], [TenMenu], [Type], [Ord], [Level], [Link], [TypeClick], [Icon], [Active]) VALUES (12, N'Quảng cáo', 1, 9, N'00030009', N'./QuangCao.aspx', N'_self', NULL, 1)
INSERT [dbo].[tbl_QuanLyMeNu] ([ID], [TenMenu], [Type], [Ord], [Level], [Link], [TypeClick], [Icon], [Active]) VALUES (13, N'Quản lí  hàng', 1, 4, N'0004', N'#', N'_self', N'fa fa-table fa-fw', 1)
INSERT [dbo].[tbl_QuanLyMeNu] ([ID], [TenMenu], [Type], [Ord], [Level], [Link], [TypeClick], [Icon], [Active]) VALUES (14, N'Hàng', 1, 1, N'00040001', N'./HangAdminaspx.aspx', N'_self', NULL, 1)
INSERT [dbo].[tbl_QuanLyMeNu] ([ID], [TenMenu], [Type], [Ord], [Level], [Link], [TypeClick], [Icon], [Active]) VALUES (15, N'Đặt Hàng', 1, 2, N'00040002', N'./DonHangAdmin.aspx', N'_self', NULL, 1)
SET IDENTITY_INSERT [dbo].[tbl_QuanLyMeNu] OFF
SET IDENTITY_INSERT [dbo].[tbl_TinTuc] ON 

INSERT [dbo].[tbl_TinTuc] ([id], [tieuDe], [tomtat], [noidung], [ngayviet], [id_nhanvien], [urlHinhAnh], [LuotXem], [Active]) VALUES (10, N'MÁCH BẠN CÁCH PHÂN BIỆT CÁC LOẠI VẢI', N'Shop XINH có rất nhiều mẫu đầm và áo khoác đẹp với', N'<p><strong>1. Vải thun C&aacute;t H&agrave;n</strong></p>

<p>Chất vải mềm mịn, kh&ocirc;ng bị x&ugrave; l&ocirc;ng, đặc biệt l&agrave; chất vải &lsquo;&rsquo;ăn&rsquo;&rsquo; h&igrave;nh rất đẹp, h&igrave;nh in được hiện r&otilde; v&agrave; sắc n&eacute;t tr&ecirc;n nền vải, kh&ocirc;ng lo h&igrave;nh bị d&iacute;nh, bong tr&oacute;c . Độ co gi&atilde;n kh&ocirc;ng nhiều</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<img alt="SHOP THỜI TRANG XINH" src="http://thoitrangxinh.net/upload/images/tintuc3_cat%20han.jpg" /></p>

<p>&nbsp;</p>

<p><strong>2. Vải tuyết t&acirc;m</strong></p>

<p>Tuyết t&acirc;m l&agrave; loại vải gồm &iacute;t thun co d&atilde;n, kh&ocirc;ng qu&aacute; d&agrave;y cũng ko mỏng, đặc điểm mặc kh&ocirc;ng nhăn, kh&ocirc;ng b&aacute;m bụi, mềm mại, co gi&atilde;n tốt, đem đến cảm gi&aacute;c thoải m&aacute;i tối đa khi mặc, kh&ocirc;ng bị sờn mốc hay x&ugrave; l&ocirc;ng sau một thời gian d&agrave;i sử dụng .</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<img alt="SHOP THỜI TRANG XINH" src="http://thoitrangxinh.net/upload/images/tintuc3_tuy%E1%BA%BFt%20t%C3%A2m.JPG" style="height:187px; width:400px" /></p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p><strong>3.Len</strong></p>

<p>Len l&agrave; một loại sợi dệt thu được từ l&ocirc;ng cừu v&agrave; một số lo&agrave;i động vật kh&aacute;c, như d&ecirc;, lạc đ&agrave;... Len cung cấp nguy&ecirc;n liệu để dệt, đan, chế tạo c&aacute;c loại &aacute;o len l&agrave; mặt h&agrave;ng &aacute;o giữ ấm th&ocirc;ng dụng tr&ecirc;n thế giới, nhất l&agrave; những nước c&oacute; kh&iacute; hậu lạnh. &nbsp;Len c&oacute; khả năng đ&agrave;n hồi v&agrave; giữ kh&ocirc;ng kh&iacute; v&agrave; giữ nhiệt tốt. Kh&aacute;c với&nbsp;<a href="http://thoitrangxinh.net/tin-tuc/mach-ban-cach-phan-biet-cac-loai-vai-27.html">c&aacute;c loại vải kh&aacute;c</a>, len bị đốt ch&aacute;y ở nhiệt độ cao hơn b&ocirc;ng v&agrave; một số sợi tổng hợp. N&oacute; c&oacute; tỷ lệ thấp trong việc l&acirc;y lan lửa v&agrave; cũng c&oacute; khả năng c&aacute;ch điện v&agrave; tự dập lửa.</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<img alt="SHOP THỜI TRANG XINH" src="http://thoitrangxinh.net/upload/images/tintuc3_len.jpg" /></p>

<p>&nbsp;</p>

<p><strong>4.Dạ Nỉ</strong></p>

<p>Vải dạ nỉ l&agrave; loại vải được dệt từ sợi len tổng hợp, bề mặt được bao phủ bởi một lớp l&ocirc;ng ngắn mềm mại, thường được d&ugrave;ng để may &aacute;o kho&aacute;c, &aacute;o jacket&hellip; Vải dạ nỉ giữ ấm rất tốt, &iacute;t thấm nước, chất vải mềm nhẹ v&agrave; đa dạng về m&agrave;u sắc, họa tiết v&agrave; rất dễ bảo quản. Ch&iacute;nh v&igrave; những đặc t&iacute;nh nổi bật tr&ecirc;n m&agrave; vải dạ nỉ đ&atilde; trở th&agrave;nh sự lựa chọn h&agrave;ng đầu trong c&aacute;c nguy&ecirc;n liệu may &aacute;o kho&aacute;c</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;<img alt="SHOP THỜI TRANG XINH" src="http://thoitrangxinh.net/upload/images/tintuc3_d%E1%BA%A1(1).jpg" /></p>

<p>&nbsp;</p>

<p><strong>5.Vải bố ( vải Canvas)</strong></p>

<p>Vải canvas hay c&ograve;n gọi l&agrave; vải bố l&agrave; loại vải cao cấp, chất liệu vải d&agrave;y c&oacute; nguồn gốc l&agrave;m từ sợi cotton đan dệt ngang, c&oacute; độ bền cao v&agrave; l&agrave;nh t&iacute;nh, kh&ocirc;ng chứa c&aacute;c chất độc hại. Ưu điểm nổi trội của vải ch&iacute;nh l&agrave; bền, nhẹ v&agrave; dễ vệ sinh, bảo quản, hạn chế thấm nước khi gặp thờ tiết mưa</p>

<p style="text-align:center"><img alt="SHOP THỜI TRANG XINH" src="http://thoitrangxinh.net/upload/images/tintuc3_canvas.jpg" /></p>

<p>&nbsp;</p>

<p><strong>6.Trần b&ocirc;ng</strong></p>

<p>&Aacute;o trần b&ocirc;ng thường c&oacute; 2 lớp, lớp trong được trần b&ocirc;ng để giữ ấm v&agrave; tạo kiểu c&aacute;ch, c&ograve;n lớp ngo&agrave;i được l&agrave;m bằng chất liệu nỉ, da hoặc vải th&ocirc;. T&ugrave;y theo kiểu d&aacute;ng cụ thể của chiếc &aacute;o m&agrave; lớp b&ocirc;ng trần b&ecirc;n trong sẽ được may với độ d&agrave;y, mỏng kh&aacute;c nhau. Song thường th&igrave; một chiếc &aacute;o trần b&ocirc;ng thời trang l&agrave; chiếc &aacute;o c&oacute; lớp b&ocirc;ng trần may lộ ra kh&ocirc;ng chiếm qu&aacute; 1/3 diện t&iacute;ch b&ecirc;n ngo&agrave;i của chiếc &aacute;o, nếu kh&ocirc;ng tr&ocirc;ng sẽ chẳng kh&aacute;c n&agrave;o bạn đang kho&aacute;c l&ecirc;n m&igrave;nh một chiếc chăn b&ocirc;ng vậy.</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<img alt="SHOP THỜI TRANG XINH" src="http://thoitrangxinh.net/upload/images/tintuc3_tr%E1%BA%A7n%20b%C3%B4ng(1).jpg" /></p>

<p>&nbsp;</p>

<p><strong>7.Denim</strong></p>

<p>Denim l&agrave; loại chất liệu may từ vải cotton cứng với c&aacute;c sợi đan ch&eacute;o, trong đ&oacute; một sợi ngang nằm dưới hai hoặc một số nhiều hơn sợi dọc. Denim được biết đến như l&agrave; loại vải may quần jeans nhưng denim bền v&agrave; đắt tiền hơn jean. Hai loại vật liệu kh&aacute; giống nhau, nhưng c&oacute; một điểm kh&aacute;c biệt lớn nhất l&agrave;: denim được dệt từ 1 sợi m&agrave;u v&agrave; 1 sợi trắng, c&ograve;n jean được dệt từ 2 sợi c&ugrave;ng m&agrave;u. Denim theo truyền thống mang m&agrave;u xanh nhuộm từ ch&agrave;m (indigo) rất đặc trưng. V&agrave; ng&agrave;y nay, m&agrave;u xanh ch&agrave;m cũng l&agrave; m&agrave;u sắc phổ biến nhất đối với quần jeans, v&agrave; cũng như được rất nhiều người ưa chuộng.</p>

<p style="text-align:center"><img alt="SHOP THỜI TRANG XINH" src="http://thoitrangxinh.net/upload/images/tintuc3_Denim.jpg" /></p>

<p>&nbsp;</p>

<p>Thời trang Xinh sẽ cố gắng thu thập th&ecirc;m nhiều&nbsp;<a href="http://thoitrangxinh.net/tin-tuc/mach-ban-cach-phan-biet-cac-loai-vai-27.html">sự kh&aacute;c nhau giữa c&aacute;c loại vải</a>&nbsp;để chia sẻ&nbsp;cho c&aacute;c chị&nbsp;nh&eacute;.</p>

<p>C&aacute;c chị&nbsp;muốn biết th&ecirc;m về c&aacute;c loại vải cũng như c&aacute;c mẫu v&aacute;y, cứ&nbsp;<a href="http://thoitrangxinh.net/lien-he.html">li&ecirc;n hệ</a>&nbsp;shop nh&eacute; hoặc inbox qua&nbsp;<a href="https://www.facebook.com/shopthoitrangxinh/">facebook&nbsp;</a>đều được</p>
', CAST(0x6C3C0B00 AS Date), 1, N'images/tintuc3_cat-hannen8200_340x260.jpg', 43, 1)
INSERT [dbo].[tbl_TinTuc] ([id], [tieuDe], [tomtat], [noidung], [ngayviet], [id_nhanvien], [urlHinhAnh], [LuotXem], [Active]) VALUES (11, N'CÁCH CHỌN VÁY CHO CHỊ EM BÉO BỤNG', N'Hiện nay, chị em phụ nữ vừa phải lo công việc nhà,', N'<p><strong>Lời khuy&ecirc;n n&ecirc;n l&agrave;m</strong>:</p>

<p>- N&ecirc;n chọn v&aacute;y liền th&acirc;n c&oacute; thiết kế d&aacute;ng su&ocirc;ng, x&ograve;e nhẹ, d&aacute;ng chữ A hoặc c&oacute; th&acirc;n dưới hơi bồng bềnh một ch&uacute;t. Phần th&acirc;n dưới của v&aacute;y x&ograve;e ra sẽ gi&uacute;p bạn che đi v&ograve;ng eo ngấn mỡ v&agrave; v&ograve;ng h&ocirc;ng to qu&aacute; khổ.</p>

<p>- Chọn v&aacute;y cần lưu &yacute; đến độ rộng. N&ecirc;n mặc những chiếc v&aacute;y vừa vặn, c&oacute; độ x&ograve;e vừa phải, kh&ocirc;ng qu&aacute; rộng th&ugrave;ng th&igrave;nh cũng kh&ocirc;ng chật chội kh&oacute; thở. Điều quan trọng nhất khi mặc bản th&acirc;n phải cảm thấy vừa vặn v&agrave; tự tin.</p>

<p>- Bụng b&eacute;o h&ocirc;ng to tốt nhất bạn n&ecirc;n chọn những chiếc v&aacute;y đơn giản, thanh lịch v&agrave; c&oacute; những đường ly nhấn nh&aacute; ngay tại phần eo b&aacute;nh mỳ sẽ gi&uacute;p bạn trở n&ecirc;n xinh đẹp hơn rất nhiều.</p>

<p style="text-align:center"><img alt="Váy suông luôn là món hàng che dáng cực hiệu quả cho các nàng béo bụng" src="http://thoitrangxinh.net/upload/images/tintuc2_DL303.jpg" style="height:807px; width:400px" /></p>

<p><em>V&aacute;y su&ocirc;ng lu&ocirc;n l&agrave; m&oacute;n h&agrave;ng che d&aacute;ng cực hiệu quả cho c&aacute;c n&agrave;ng b&eacute;o bụng</em></p>

<p style="text-align:center"><img alt="SHOP THỜI TRANG XINH" src="http://thoitrangxinh.net/upload/images/DL301b.jpg" style="height:545px; width:400px" /></p>

<p><em>Bạn chỉ n&ecirc;n chọn những chiếc v&aacute;y c&oacute; độ x&ograve;e vừa phải, kh&ocirc;ng qu&aacute; th&ugrave;ng th&igrave;nh cũng kh&ocirc;ng qu&aacute; &ocirc;m s&aacute;t</em></p>

<p><strong>Kh&ocirc;ng n&ecirc;n</strong>:</p>

<p>- Một trong những nguy&ecirc;n tắc<a href="http://thoitrangxinh.net/tin-tuc/cach-chon-vay-cho-nang-beo-bung-26.html"><em><strong>&nbsp;chọn v&aacute;y cho chị em b&eacute;o bụng</strong></em></a>&nbsp;cần nhớ đ&oacute; l&agrave; tuyệt đối tr&aacute;nh xa những kiểu v&aacute;y b&oacute; s&aacute;t cơ thể hay c&oacute; qu&aacute; nhiều chi tiết di&ecirc;m d&uacute;a qu&aacute; đ&agrave;. Những kiểu v&aacute;y thiết kế cầu kỳ sẽ c&agrave;ng cho v&ograve;ng eo v&agrave; phần h&ocirc;ng của bạn trở n&ecirc;n đồ sộ.</p>

<p>- Kh&ocirc;ng chọn những chiếc v&aacute;y c&oacute; đường eo qu&aacute; cao, sẽ dễ để lộ phần eo b&aacute;nh mỳ m&agrave; những c&ocirc; n&agrave;ng b&eacute;o bụng đang cố gắng che giấu.</p>

<p style="text-align:center"><img alt="SHOP THỜI TRANG XINH" src="http://thoitrangxinh.net/upload/images/tintuc2_4.jpg" style="height:562px; width:400px" /></p>

<p><em>Diện v&aacute;y &ocirc;m b&oacute; s&aacute;t chỉ khiến phần bụng mỡ của bạn bị lộ r&otilde;</em></p>

<p style="text-align:center"><img alt="SHOP THỜI TRANG XINH" src="http://thoitrangxinh.net/upload/images/tintuc2_5.jpg" style="height:600px; width:400px" /></p>

<p><em>N&ecirc;n chọn v&aacute;y c&oacute; đường eo thấp vừa phải thay v&igrave; những chiếc v&aacute;y c&oacute; eo cao sẽ dễ l&agrave;m l&ocirc; v&ograve;ng 2 b&aacute;nh mỳ</em></p>

<p><strong>Lưu &yacute; khi chọn v&aacute;y họa tiết:</strong></p>

<p>Nguy&ecirc;n tắc&nbsp;<a href="http://thoitrangxinh.net/tin-tuc/cach-chon-vay-cho-chi-em-beo-bung-26.html"><em><strong>chọn v&aacute;y&nbsp;d&agrave;nh cho&nbsp;chị em b&eacute;o bụng</strong></em></a>&nbsp;đ&oacute; l&agrave; kh&ocirc;ng chọn những chiếc v&aacute;y c&oacute; họa tiết tập trung ở phần h&ocirc;ng v&agrave; bụng. Ch&uacute;ng sẽ khiến người đối diện để &yacute; đến nhược điểm của bạn ngay lập tức. B&ecirc;n cạnh đ&oacute; những kiểu hoa văn to bản cũng kh&ocirc;ng phải gợi &yacute; cho c&aacute;c c&ocirc; n&agrave;ng bụng b&eacute;o bởi n&oacute; sẽ khiến bạn tr&ocirc;ng &quot;ph&igrave; nhi&ecirc;u&quot; hơn.</p>

<p><em><strong>Lời khuy&ecirc;n</strong></em>: n&ecirc;n chọn v&aacute;y c&oacute; họa tiết nhỏ nh&atilde; nhặn, hoặc c&aacute;c chi tiết điểm xuyết ở cổ, ngực, tay &aacute;o, sẽ gi&uacute;p đ&aacute;nh lạc hướng mắt người nh&igrave;n</p>

<p style="text-align:center"><img alt="SHOP THỜI TRANG XINH" src="http://thoitrangxinh.net/upload/images/tintuc2_6.jpg" style="height:575px; width:400px" /></p>

<p><em>Họa tiết nhỏ nh&atilde; nhặn kết hợp c&ugrave;ng m&agrave;u tối mang lại cảm gi&aacute;c thon gọn cho c&aacute;c n&agrave;ng eo b&aacute;nh mỳ</em></p>

<p style="text-align:center"><em><img alt="SHOP THỜI TRANG XINH" src="http://thoitrangxinh.net/upload/images/al45.png" style="height:576px; width:400px" /></em></p>

<p><em>Với những chiếc v&aacute;y su&ocirc;ng họa tiết như thế n&agrave;y th&igrave; bạn kh&ocirc;ng c&ograve;n phải qu&aacute; lo lắng về bụng b&eacute;o, h&ocirc;ng to</em></p>

<p>Lưu &yacute; cuối c&ugrave;ng cho c&aacute;c bạn g&aacute;i, b&ecirc;n cạnh việc chọn form v&agrave; họa tiết, cần ch&uacute;&nbsp;&yacute; đến m&agrave;u sắc v&agrave; phụ kiện đi k&egrave;m nh&eacute; c&aacute;c bạn.&nbsp;<a href="http://thoitrangxinh.net/tin-tuc/cach-chon-vay-cho-chi-em-beo-bung-26.html"><em><strong>C&aacute;ch chọn v&aacute;y cho chị em b&eacute;o bụng</strong></em></a>, d&aacute;ng tr&ograve;n kh&ocirc;ng qu&aacute; kh&oacute; đ&acirc;u, chỉ cần ch&uacute; &yacute; một ch&uacute;t l&agrave; được &agrave;.</p>
', CAST(0xFC3A0B00 AS Date), 1, N'images/tintuc2_13542_385x256.jpg', 42, 1)
INSERT [dbo].[tbl_TinTuc] ([id], [tieuDe], [tomtat], [noidung], [ngayviet], [id_nhanvien], [urlHinhAnh], [LuotXem], [Active]) VALUES (12, N'CÔNG THỨC PHỐI ĐỒ CHO THU - ĐÔNG', N'Chọn áo khoác phù hợp, cân bằng chất liệu giữa các', N'<p><strong>1.&nbsp;</strong>Nếu muốn mặc quần jean v&agrave; &aacute;o thun, h&atilde;y chọn th&ecirc;m chiếc &aacute;o kho&aacute;c ngắn ngang lưng để c&oacute; thể khoe đ&ocirc;i ch&acirc;n d&agrave;i nh&eacute;. Th&ecirc;m phụ kiện cho set-đồ n&agrave;y, bạn c&oacute; thể chọn th&ecirc;m đ&ocirc;i gi&agrave;y thể thao sẽ&nbsp;chuẩn lu&ocirc;n bạn g&aacute;i nh&eacute;.</p>

<p style="text-align:center"><img alt="SHOP THỜI TRANG XINH" src="http://thoitrangxinh.net/upload/images/ak52d_logo.jpg" style="height:450px; width:300px" /></p>

<p>&nbsp;</p>

<p><strong>2.</strong>&nbsp;Giữa thời tiết se lạnh, sự kết hợp giữa &aacute;o thun d&agrave;i tay, cổ cao đi c&ugrave;ng &aacute;o yếm da mịn l&agrave; sự lựa chọn tuyệt vời nhất. Chất điệu đ&agrave; của da mịn sẽ l&agrave;m bạn g&aacute;i duy&ecirc;n hơn rất nhiều. Để tăng th&ecirc;m c&aacute; t&iacute;nh cho bộ yếm, bạn chọn đi k&egrave;m với boot cao, c&ograve;n để nữ t&iacute;nh hơn nữa th&igrave; chọn đ&ocirc;i gi&agrave;y cao g&oacute;t nha.</p>

<p style="text-align:center"><img alt="SHOP THỜI TRANG XINH" src="http://thoitrangxinh.net/upload/images/DL334(1).jpg" style="height:533px; width:300px" /></p>

<p>&nbsp;</p>

<p style="text-align:center"><img alt="SHOP THỜI TRANG XINH" src="http://thoitrangxinh.net/upload/images/dl365f.jpg" style="height:457px; width:300px" /></p>

<p>&nbsp;</p>

<p><strong>3.&nbsp;</strong>&Aacute;o len d&agrave;i, rộng sẽ khiến bạn bị coi l&agrave; luộm thuộm trong việc&nbsp;<a href="http://thoitrangxinh.net/tin-tuc/cong-thuc-phoi-do-cho-thudong-25.html"><em><strong>phối đồ thu-đ&ocirc;ng</strong></em></a>&nbsp;n&ecirc;n cần kết hợp với quần &ocirc;m v&agrave; k&iacute;nh đen sẽ tr&ocirc;ng s&agrave;nh điệu hơn đấy.</p>

<p style="text-align:center"><img alt="SHOP THỜI TRANG XINH" src="http://thoitrangxinh.net/upload/images/al16-logo(1).jpg" style="height:366px; width:300px" /></p>

<p>&nbsp;</p>

<p><strong>4.&nbsp;</strong>&Aacute;o thun, ch&acirc;n v&aacute;y ngắn v&agrave; &aacute;o kho&aacute;c m&agrave;u hồng phấn&nbsp;l&agrave; bộ c&aacute;nh cơ bản cho một c&ocirc; n&agrave;ng th&agrave;nh thị&nbsp;chuộng phong c&aacute;ch vintage. Bạn c&oacute; thể đi gi&agrave;y thể thao hoặc mốt hơn l&agrave; gi&agrave;y mules (gi&agrave;y hở g&oacute;t) cộng th&ecirc;m chiếc n&oacute;n v&agrave;nh l&agrave; chuẩn mốt lu&ocirc;n.</p>

<p style="text-align:center"><img alt="SHOP THỜI TRANG XINH" src="http://thoitrangxinh.net/upload/images/al21a.jpg" style="height:300px; width:300px" /></p>

<p>&nbsp;</p>

<p><strong>5.</strong>; Bạn cũng c&oacute; thể chọn phong c&aacute;ch cổ điển kiểu qu&yacute; ph&aacute;i bằng 1 bộ đầm&nbsp;c&aacute;ch điệu tạo cho bạn sự sang trọng v&agrave; đẳng cấp hơn trong bất cứ sự kiện n&agrave;o.</p>

<p style="text-align:center"><img alt="SHOP THỜI TRANG XINH" src="http://thoitrangxinh.net/upload/images/AL39b.jpg" style="height:366px; width:300px" /></p>

<p>&nbsp;</p>

<p><strong>6.&nbsp;</strong>Một set đầm&nbsp;len &aacute;o crop top lu&ocirc;n l&agrave; sự lựa chọn của những c&ocirc; n&agrave;ng năng động c&aacute; t&iacute;nh để khoe d&aacute;ng. Nếu bộ đồ n&agrave;y c&ograve;n qu&aacute; đơn giản, một chiếc t&uacute;i nổi bật sẽ l&agrave; lựa chọn th&iacute;ch hợp tiếp theo cho&nbsp;<a href="http://thoitrangxinh.net/tin-tuc/cong-thuc-phoi-do-cho-thudong-25.html"><em><strong>c&ocirc;ng thức phối đồ thu-đ&ocirc;ng</strong></em></a>&nbsp;nh&eacute;.</p>

<p style="text-align:center"><img alt="SHOP THỜI TRANG XINH" src="http://thoitrangxinh.net/upload/images/al38.jpg" style="height:445px; width:300px" /></p>

<p>&nbsp;</p>

<p>Ngo&agrave;i&nbsp;<strong><a href="http://thoitrangxinh.net/tin-tuc/cong-thuc-phoi-do-cho-thudong-25.html">c&ocirc;ng thức phối đồ cho thu-đ&ocirc;ng</a></strong>, shop Xinh c&ograve;n sưu tầm&nbsp;<a href="http://thoitrangxinh.net/tin-tuc/cach-chon-vay-cho-chi-em-beo-bung-26.html"><em>c&aacute;ch chọn v&aacute;y cho n&agrave;ng b&eacute;o bụng</em></a>&nbsp;nữa đấy nh&eacute;. Hi vọng phụ nữ ch&uacute;ng ta sẽ ng&agrave;y c&agrave;ng đẹp hơn bằng một số mẹo vặt nhỏ trong cuộc sống.</p>
', CAST(0xFD3A0B00 AS Date), 1, N'images/ak52c_logo1768_200x260.jpg', 14, 1)
SET IDENTITY_INSERT [dbo].[tbl_TinTuc] OFF
SET IDENTITY_INSERT [dbo].[tblQuangCao] ON 

INSERT [dbo].[tblQuangCao] ([id], [urlImage], [Active], [Count_Click]) VALUES (1, N'images/banner-thu-dong-2016_web3197_905x345.jpg', 0, NULL)
INSERT [dbo].[tblQuangCao] ([id], [urlImage], [Active], [Count_Click]) VALUES (2, N'images/dam-tay-xe_-cover-web3220_905x345.jpg', 1, 11)
INSERT [dbo].[tblQuangCao] ([id], [urlImage], [Active], [Count_Click]) VALUES (3, N'images/untitled_web9889_905x345.jpg', 1, 2)
INSERT [dbo].[tblQuangCao] ([id], [urlImage], [Active], [Count_Click]) VALUES (4, N'images/banner-thu-dong-2016_web3197_905x345.jpg', 1, 7)
SET IDENTITY_INSERT [dbo].[tblQuangCao] OFF
ALTER TABLE [dbo].[tbl_ChiTietDatHang]  WITH CHECK ADD  CONSTRAINT [FK_tbl_ChiTietDatHang_tbl_Hang] FOREIGN KEY([id_hang])
REFERENCES [dbo].[tbl_Hang] ([id])
GO
ALTER TABLE [dbo].[tbl_ChiTietDatHang] CHECK CONSTRAINT [FK_tbl_ChiTietDatHang_tbl_Hang]
GO
ALTER TABLE [dbo].[tbl_ChiTietDatHang]  WITH CHECK ADD  CONSTRAINT [FK_tbl_ChiTietHoaDon_tbl_HoaDon] FOREIGN KEY([id_hoadon])
REFERENCES [dbo].[tbl_DatHang] ([id])
GO
ALTER TABLE [dbo].[tbl_ChiTietDatHang] CHECK CONSTRAINT [FK_tbl_ChiTietHoaDon_tbl_HoaDon]
GO
ALTER TABLE [dbo].[tbl_DatHang]  WITH CHECK ADD  CONSTRAINT [FK_tbl_DatHang_PayMeThod] FOREIGN KEY([IdPay])
REFERENCES [dbo].[PayMeThod] ([IdPay])
GO
ALTER TABLE [dbo].[tbl_DatHang] CHECK CONSTRAINT [FK_tbl_DatHang_PayMeThod]
GO
ALTER TABLE [dbo].[tbl_DatHang]  WITH CHECK ADD  CONSTRAINT [FK_tbl_DatHang_tbl_KhachHang] FOREIGN KEY([id_KhachHang])
REFERENCES [dbo].[tbl_KhachHang] ([id])
GO
ALTER TABLE [dbo].[tbl_DatHang] CHECK CONSTRAINT [FK_tbl_DatHang_tbl_KhachHang]
GO
ALTER TABLE [dbo].[tbl_Hang]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Hang_tbl_Menu] FOREIGN KEY([id_Menu])
REFERENCES [dbo].[tbl_NhomHang] ([id])
GO
ALTER TABLE [dbo].[tbl_Hang] CHECK CONSTRAINT [FK_tbl_Hang_tbl_Menu]
GO
ALTER TABLE [dbo].[tbl_NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_tbl_NhanVien_tbl_Quyen] FOREIGN KEY([id_quyen])
REFERENCES [dbo].[tbl_Quyen] ([id])
GO
ALTER TABLE [dbo].[tbl_NhanVien] CHECK CONSTRAINT [FK_tbl_NhanVien_tbl_Quyen]
GO
ALTER TABLE [dbo].[tbl_PhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_tbl_PhieuNhap_tbl_NhaCungCap] FOREIGN KEY([id_NCC])
REFERENCES [dbo].[tbl_NhaCungCap] ([id])
GO
ALTER TABLE [dbo].[tbl_PhieuNhap] CHECK CONSTRAINT [FK_tbl_PhieuNhap_tbl_NhaCungCap]
GO
ALTER TABLE [dbo].[tbl_PhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_tbl_PhieuNhap_tbl_NhanVien] FOREIGN KEY([id_nhanvien])
REFERENCES [dbo].[tbl_NhanVien] ([id])
GO
ALTER TABLE [dbo].[tbl_PhieuNhap] CHECK CONSTRAINT [FK_tbl_PhieuNhap_tbl_NhanVien]
GO
ALTER TABLE [dbo].[tbl_TinTuc]  WITH CHECK ADD  CONSTRAINT [FK_tbl_TinTuc_tbl_NhanVien] FOREIGN KEY([id_nhanvien])
REFERENCES [dbo].[tbl_NhanVien] ([id])
GO
ALTER TABLE [dbo].[tbl_TinTuc] CHECK CONSTRAINT [FK_tbl_TinTuc_tbl_NhanVien]
GO
