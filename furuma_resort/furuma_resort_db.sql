create database Furama_Resort;
use Furama_Resort;
create table LoaiKhach(
IDloaikhach int auto_increment,
constraint PK_LoaiKhach primary key(IDloaikhach),
TenLoaiKhach varchar(45) not null unique
);
create table Khachhang(
IDkhachang int auto_increment,
constraint PK_KhachHang primary key(IDkhachang),
IDloaikhach int,
HoTenKhachHang varchar(45) not null,
Ngaysinh date not null,
SoCMND varchar(45) not null unique,
Email varchar(45) not null unique,
DiaChi varchar(45)
);
create table KieuThue(
IDkieuThue int auto_increment,
constraint PK_KieuThue primary key(IDkieuThue),
TenKieuThue varchar(45) not null,
GiaThue int not null
);
 create table LoaiDichVu(
 IDLoaiDichVu int auto_increment,
 constraint PK_LoaiDichVu primary key( IDLoaiDichVu),
 TenLoaiDV varchar(45) not null
 );
 create table DichVu(
 IDDichVu int auto_increment,
 constraint PK_DichVu primary key( IDDichVu),
 TenDichVu varchar(50) not null,
 DienTich int not null,
 SoTang int not null,
 SoNguoiToiDa varchar(45) not null,
 ChiPhiThue varchar(45) not null,
 IDkieuThue int not null,
 IDLoaiDichVu int not null,
 TrangThai varchar(45) default('off') check(TrangThai='off' or TrangThai='on')
 );
 create table ViTri(
 IDViTri int auto_increment,
 constraint PK_ViTri primary key( IDViTri),
 TenViTri varchar(45) not null
 );
 create table TrinhDo(
 IDTrinhDo int auto_increment,
 constraint PK_TrinhDo primary key( IDTrinhDo ),
 TrinhDo varchar(45) not null
 );
 create table BoPhan(
 IDBoPhan int auto_increment,
 constraint PK_BoPhan primary key( IDBoPhan),
 TenBoPhan varchar(45) not null
 );
 create table NhanVien(
 IDNhanVien int auto_increment,
 constraint PK_NhanVien primary key( IDNhanVien ),
 HoTenNhanVen varchar(45) not null,
 IDViTri int not null,
 IDTrinhDo int not null,
 IDBoPhan int not null,
 Ngaysinh date not null,
 SoCMND varchar(45) not null unique,
 Email varchar(45) not null unique,
 DiaChi varchar(45)
 );
 create table HopDong(
 IDHopDong int auto_increment,
 constraint PK_HopDong primary key( IDHopDong),
 IDNhanVien int not null,
 IDkhachang int not null,
 IDDichVu int not null,
 NgayLamHD date not null,
 NgayKetThuc date not null,
 TienCoc int ,
 TongTien int not null,
 constraint check( NgayLamHD<= NgayKetThuc),
 constraint check(TongTien> TienCoc)
 );
 create table hopdongchitiet(
 IdHopDongChiTiet int auto_increment,
 constraint PK_HDCT primary key( IdHopDongChiTiet),
 IDHopDong int not null,
  IDDichVuDiKem int not null,
  SoLuong int
 );
 create table DichVuDiKem(
 IDDichVuDiKem int auto_increment,
 constraint PK_DVDikem primary key(  IDDichVuDiKem),
 TenDichVuDiKem varchar(45),
 GiaDVDiKem int,
 DonVi int,
 TrangThaiKhaDung varchar(45)
 );
alter table khachhang
add constraint FK_KhachHang_LoaiKhach foreign key(IDloaikhach) references LoaiKhach(IDloaikhach);
alter table dichvu
add constraint FK_DichVu_LoaiDV foreign key( IDLoaiDichVu) references loaidichvu( IDLoaiDichVu);
alter table dichvu
add constraint FK_DichVu_KieuThue foreign key(IDkieuThue) references kieuthue( IDkieuThue);
alter table nhanvien
add constraint FK_NhanVien_ViTri foreign key( IDViTri) references vitri( IDViTri);
alter table nhanvien
add constraint FK_NhanVien_TrinhDo foreign key(  IDTrinhDo ) references trinhdo(  IDTrinhDo );
alter table nhanvien
add constraint FK_NhanVien_BoPhan foreign key(   IDBoPhan ) references bophan(  IDBoPhan );
alter table hopdong
add constraint FK_HopDong_KhachHang foreign key( IDkhachang ) references khachhang( IDkhachang );
alter table hopdong
add constraint FK_HopDong_NhanVien foreign key(  IDNhanVien ) references nhanvien(  IDNhanVien );
alter table hopdong
add constraint FK_HopDong_DichVu foreign key(   IDDichVu ) references dichvu(   IDDichVu );
alter table hopdongchitiet
add constraint FK_HDCT_HopDong foreign key( IDHopDong) references hopdong( IDHopDong);
alter table hopdongchitiet
add constraint FK_HDCT_DVDikKem foreign key( IDDichVuDiKem) references dichvudikem(IDDichVuDiKem);

