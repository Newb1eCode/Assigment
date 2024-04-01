package com.example.demosd18307.Servlet;

import com.example.demosd18307.moudel.ChitietSp;
import com.example.demosd18307.moudel.HoaDon;
import com.example.demosd18307.moudel.HoaDonChitiet;
import com.example.demosd18307.moudel.KhachHang;
import com.example.demosd18307.repos.HoaDonChiTiet_Repository;
import com.example.demosd18307.repos.HoaDon_Repository;
import com.example.demosd18307.repos.KhachHang_Repository;
import com.example.demosd18307.repos.SanPhamChiTiet_Repository;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

@WebServlet(name = "XServlet", value ={ "/ban-hang",
        "/tao-hoa-don",
        "/hoa-don/detail",
        "/hoa-don-chi-tiet/add",
        "/hoa-don-chi-tiet/delete",
        "/hoa-don-chi-tiet/list",
        "/hoa-don/delete"
})
public class XServlet extends HttpServlet {
  private HoaDon_Repository hdr = new HoaDon_Repository();
  private SanPhamChiTiet_Repository ctsprp = new SanPhamChiTiet_Repository();
  private HoaDonChiTiet_Repository hdctrep = new HoaDonChiTiet_Repository();
  private KhachHang_Repository khRe = new KhachHang_Repository();
  private ArrayList<HoaDon> lst = new ArrayList<>();
  private ArrayList<ChitietSp> lstctsp = new ArrayList<>();
  private ArrayList<HoaDonChitiet> listHDCT = new ArrayList<>();
  private  HoaDon hdDetail;
  private Integer idHD ;
    Float tongTien ;

    public XServlet() {
         lst = new ArrayList<>();
         lstctsp = new ArrayList<>();
         listHDCT = new ArrayList<>();
         hdDetail = new HoaDon();
         idHD = 0;
         tongTien = 0F;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        if (uri.contains("/ban-hang")){
            this.banhang(request,response);
        } else if (uri.contains("/hoa-don/detail")) {
            this.detail(request,response);
        } else if (uri.contains("/hoa-don-chi-tiet/add")) {
            this.addHDCT(request,response);
        }else if (uri.contains("/hoa-don/delete")) {
            this.find(request,response);
        } else if (uri.contains("/hoa-don-chi-tiet/delete")) {
            this.delete(request,response);
        }
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Integer id = Integer.parseInt(request.getParameter("idHdCT"));
        HoaDonChitiet hd = hdctrep.getdetail(id);
        hdctrep.delete(hd);
        response.sendRedirect("/ban-hang");
    }

    private void find(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Integer id = Integer.parseInt(request.getParameter("idHD"));
        idHD = id;
        hdDetail = hdr.getdetail(id);

        hdr.delete(hdDetail);
        response.sendRedirect("/ban-hang");
    }


    private void banhang(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        lst = hdr.getList();
        lstctsp = ctsprp.getlist();
        listHDCT = hdctrep.getlist(idHD);
        request.setAttribute("listHD", lst);
        request.setAttribute("lstHdCt",listHDCT);
        request.setAttribute("listCTSP", lstctsp);
        request.setAttribute("hdDetail",hdDetail);
        request.setAttribute("tongTien",tongTien);
        request.getRequestDispatcher("/view/ban_hang/x.jsp").forward(request,response);
    }

    private void taoHd(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Float tongTien = Float.parseFloat(request.getParameter("tongTien"));
        String sdt = request.getParameter("sdt");
        KhachHang kh = khRe.getdetailSdt(sdt);
        if(kh != null){
            if(tongTien == 0) {
                HoaDon hd = new HoaDon();
                hd.setNgayTao(new Date());
                hd.setNgaySua(new Date());
                hd.setTrangThai("Chua thanh toan");
                hd.setKh(kh);
                hdr.add(hd);
                response.sendRedirect("/ban-hang");
            } else  {
                Integer idHd = Integer.parseInt(request.getParameter("idHd"));
                HoaDon hoaDondetai = hdr.getdetail(idHd);
                hoaDondetai.setNgaySua(new Date());
                hoaDondetai.setTrangThai("Da Thanh Toan");
                hoaDondetai.setKh(kh);
                hdr.add(hoaDondetai);
                response.sendRedirect("/ban-hang");
            }
        }else {
            response.sendRedirect("/ban-hang?error=notfound");
            return;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
         if (uri.contains("/tao-hoa-don")) {
            this.taoHd(request,response);
        }
    }

    private void detail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer id = Integer.parseInt(request.getParameter("idHD"));
        idHD = id;
        hdDetail = hdr.getdetail(id);
        listHDCT = hdctrep.getlist(id);
        tongTien = 0.F;
        for (HoaDonChitiet hdct: listHDCT){
            tongTien += hdct.getTongTien();
        }
        response.sendRedirect("/ban-hang");
    }
    private void addHDCT(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Integer idCtsp = Integer.parseInt(request.getParameter("idCTSP"));
        ChitietSp ctsp = ctsprp.getdetail(idCtsp);
        listHDCT = hdctrep.getlist(idHD);
        boolean found = false;
        for (HoaDonChitiet hdct : listHDCT) {
            if (hdct.getCtsp().getId().equals(idCtsp)) {
                // Nếu sản phẩm đã tồn tại, cộng dồn số lượng mua
                hdct.setSoLuongmua(hdct.getSoLuongmua() + 1);
                hdct.setTongTien(hdct.getSoLuongmua() * hdct.getGiaBan());
                hdctrep.add(hdct); // Cập nhật thông tin sản phẩm trong hóa đơn chi tiết
                response.sendRedirect("/ban-hang");
                found = true;
                break;
            }
        }
        if(!found) {
            HoaDonChitiet hdct = new HoaDonChitiet();
            HoaDon hd = new HoaDon();
            hd.setId(idHD);
            hdct.setCtsp(ctsp);
            hdct.setHd(hd);
            hdct.setGiaBan(ctsp.getGiaBan());
            hdct.setSoLuongmua(1);
            hdct.setNgayTao(new Date());
            hdct.setNgaySua(new Date());
            hdct.setTongTien(ctsp.getGiaBan());
            hdctrep.add(hdct);
            response.sendRedirect("/ban-hang");
        }
    }
//    private void listHDCT(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        listHDCT = hdctrep.getlist(idHD);
//        request.setAttribute("listHDCT", listHDCT);
//        request.getRequestDispatcher("/view/ban_hang/x.jsp").forward(request, response);
//    }
}
