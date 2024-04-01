package com.example.demosd18307.moudel;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.ArrayList;
import java.util.Date;
import java.util.function.IntFunction;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "hdct")
@Entity
public class HoaDonChitiet  {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id ;
    @Column(name = "so_luong_mua")
    private Integer soLuongmua;
    @Column(name = "gia_ban")
    private Float giaBan;
    @Column(name = "tong_tien")
    private Float tongTien;
    @Column(name = "trang_thai")
    private String trangThai;
    @Column(name = "ngay_tao")
    private Date ngayTao;
    @Column(name = "ngay_sua")
    private Date ngaySua;
    @ManyToOne
    @JoinColumn(name = "id_hoa_don")
    private HoaDon hd;
    @ManyToOne
    @JoinColumn(name = "id_ctsp")
    private ChitietSp ctsp;


}
