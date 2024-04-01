//package com.example.demosd18307.Servlet;
//
//import com.example.demosd18307.moudel.ChitietSp;
//import com.example.demosd18307.moudel.HoaDon;
//import com.example.demosd18307.moudel.HoaDonChitiet;
//import com.example.demosd18307.moudel.KhachHang;
//import com.example.demosd18307.repos.SanPhamChiTiet_Repository;
//import com.example.demosd18307.repos.HoaDon_Repository;
//import com.example.demosd18307.repos.HoaDonChiTiet_Repository;
//import com.example.demosd18307.repos.KhachHang_Repository;
//import jakarta.servlet.*;
//import jakarta.servlet.http.*;
//import jakarta.servlet.annotation.*;
//
//import java.io.IOException;
//import java.util.ArrayList;
//import java.util.Date;
//import java.util.List;
//
//@WebServlet(name = "BanhangServlet", value = {
//        "/ban-hang",
//        "/hoa-don/edit",
//        "/hoa-don/add",
//        "/hoa-don/thanhtoan",
//        "/hoa-don/store",
//        "khang-hang/find"
//})
//public class BanhangServlet extends HttpServlet {
//    private HoaDon_Repository hdRe = new HoaDon_Repository();
//    private SanPhamChiTiet_Repository chitietSpRE = new SanPhamChiTiet_Repository();
//    private HoaDonChiTiet_Repository hdctRe = new HoaDonChiTiet_Repository();
//    private KhachHang_Repository khRe = new KhachHang_Repository();
//    ArrayList<HoaDon> lstHd = new ArrayList<>();
//    ArrayList<ChitietSp> lstctSp = new ArrayList<>();
//    ArrayList<HoaDonChitiet> lstHdct = new ArrayList<>();
//    Float tongTien = Float.valueOf(0);
//    Integer idHD = 0;
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String uri = request.getRequestURI();
//        if (uri.contains("/ban-hang")){
//            this.index(request,response);
//        }else if (uri.contains("/hoa-don/edit")){
//            this.edit(request,response);
//        } else if (uri.contains("/hoa-don/store")) {
//            this.store(request,response);
//        }else if (uri.contains("/hoa-don/add")){
//            this.add(request,response);
//        }
////        else  if(uri.contains("/khang-hang/find")){
////            this.sdt(request,response);
////        }
//
//    }
//
//    private void sdt(HttpServletRequest request, HttpServletResponse response) throws IOException {
//        String sdt = request.getParameter("sdt");
//        List<KhachHang> kh = (List<KhachHang>) khRe.getdetailSdt(sdt);
//        request.setAttribute("k",kh);
//        response.sendRedirect("/ban-hang");
//    }
//
//    private void add(HttpServletRequest request, HttpServletResponse response) {
//        Integer idHdct =Integer.parseInt (request.getParameter("idCTSP"));
//        HoaDon hd =new HoaDon();
//        hd.setId(idHD);
//        ChitietSp chitietSp = chitietSpRE.getdetail(idHdct);
//        HoaDonChitiet hdct =new HoaDonChitiet();
//        hdct.setCtsp(chitietSp);
//        hdct.setHd(hd);
//        hdct.setGiaBan(chitietSp.getGiaBan());
//        hdct.setSoLuongmua(1);
//        hdct.setNgaySua(new Date());
//        hdct.setNgayTao(new Date());
//        hdctRe.add(hdct);
//    }
//
//    private void store(HttpServletRequest request, HttpServletResponse response) throws IOException {
//        String ten ="";
//        HoaDon hd = new HoaDon();
//        hd.setNgayTao(new Date());
//        hd.setNgaySua(new Date());
//        hd.setTrangThai("Chua Thanh Toan");
//        hdRe.add(hd);
//        response.sendRedirect("/ban-hang");
//    }
//
//    private void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        Integer idHd = Integer.parseInt(request.getParameter("idHd"));
//        HoaDon hDdetail = hdRe.getdetail(idHd);
//        lstHdct = hdctRe.getdetail(idHd);
//        tongTien = Float.valueOf(0);
//        for (HoaDonChitiet hdct : lstHdct){
//            tongTien += hdct.getTongTien();
//        }
//        request.setAttribute("tongtien",tongTien);
//        request.setAttribute("lstcthd",lstHdct);
//        request.setAttribute("hDdetail",hDdetail);
//        request.setAttribute("ctsp",lstctSp);
//        request.setAttribute("lstHd",lstHd);
//        request.getRequestDispatcher("/view/x.jsp").forward(request,response);
//
//    }
//
//    private void index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        List<HoaDon> lstHd = hdRe.getList();
//        List<ChitietSp> lstCtsp = chitietSpRE.getlist();
//        request.setAttribute("ctsp",lstCtsp);
//        request.setAttribute("hd",lstHd);
//        request.getRequestDispatcher("/view/x.jsp").forward(request,response);
//    }
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String uri = request.getRequestURI();
//        if (uri.contains("/hoa-don/thanhtoan")){
//            this.pay(request,response);
//        }
//    }
//
//    private void pay(HttpServletRequest request, HttpServletResponse response) throws IOException {
//        Integer idHoaDon = Integer.parseInt(request.getParameter("idHoaDon"));
//        HoaDon hoaDonDetail = hdRe.getdetail(idHoaDon);
//        hoaDonDetail.setTrangThai("Da thanh toan");
//        hoaDonDetail.setNgaySua(new Date());
//        hdRe.add(hoaDonDetail);
//        response.sendRedirect("/ban-hang");
//    }
//}
