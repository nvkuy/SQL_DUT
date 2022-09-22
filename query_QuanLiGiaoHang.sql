use QuanLiGiaoHang

create table LOAIMATHANG(
	MaLoaiMatHang varchar(10) primary key,
	TenLoaiMatHang varchar(100)
)
GO

create table KHOANGTHOIGIAN(
	MaKhoangThoiGianGiaoHang varchar(10) primary key,
	MoTa varchar(100)
)
GO

create table KHUVUC(
	MaKhuVuc varchar(10) primary key,
	TenKhuVuc varchar(100)
)
GO

create table DICHVU(
	MaDichVu varchar(10) primary key,
	TenDichVu varchar(100)
)
GO

create table DANGKYGIAOHANG(
	MaThanhVienGiaoHang varchar(10) not null unique,
	MaKhoangThoiGianDKGiaoHang varchar(10) foreign key references KHOANGTHOIGIAN(MaKhoangThoiGianGiaoHang),
	constraint PK_DKGH primary key(MaThanhVienGiaoHang, MaKhoangThoiGianDKGiaoHang)
)
GO

create table THANHVIENGIAOHANG(
	MaThanhVienGiaoHang varchar(10) primary key foreign key references DANGKYGIAOHANG(MaThanhVienGiaoHang),
	TenThanhVienGiaoHang varchar(100),
	NgaySinh date,
	GioiTinh varchar(10),
	SoDTThanhVien varchar(20),
	DiaChiThanhVien varchar(100)
)
GO

create table KHACHHANG(
	MaKhachHang varchar(10) primary key,
	MaKhuVuc varchar(10) foreign key references KHUVUC(MaKhuVuc),
	TenKhachHang varchar(100),
	TenCuaHang varchar(100),
	SoDTKhachHang varchar(20),
	DiaChiEmail varchar(100),
	DiaChiNhanHang varchar(100)
)
GO

create table DONHANG_GIAOHANG(
	MaDonHangGiaoHang varchar(10) primary key,
	MaKhachHang varchar(10) foreign key references KHACHHANG(MaKhachHang),
	MaThanhVienGiaoHang varchar(10) foreign key references THANHVIENGIAOHANG(MaThanhVienGiaoHang),
	MaDichVu varchar(10) foreign key references DICHVU(MaDichVu),
	MaKhuVucGiaoHang varchar(10) foreign key references KHUVUC(MaKhuVuc),
	TenNguoiNhan varchar(100),
	DiaChiGiaoHang varchar(100),
	SoDTNguoiThan varchar(20),
	MaKhoangThoiGianGiaoHang varchar(10) foreign key references KHOANGTHOIGIAN(MaKhoangThoiGianGiaoHang),
	NgayGiaoHang varchar(100),
	PhuongThucThanhToan varchar(100),
	TrangThaiPheDuyet varchar(100),
	TrangThaiGiaoHang varchar(100)
)
GO

create table CHITIET_DONHANG(
	MaDonHangGiaoHang varchar(10) foreign key references DONHANG_GIAOHANG(MaDonHangGiaoHang),
	TenSanPhamDuocGiao varchar(100) not null,
	SoLuong int check(SoLuong > 0),
	TrongLuong float check(TrongLuong > 0),
	MaLoaiMatHang varchar(10) foreign key references LOAIMATHANG(MaLoaiMatHang),
	TienThuHo varchar(100),
	constraint PK_CTDH primary key(MaDonHangGiaoHang, TenSanPhamDuocGiao)
)
GO