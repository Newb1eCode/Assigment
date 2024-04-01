package com.example.demosd18307.Servlet;

import com.example.demosd18307.moudel.ChitietSp;
import com.example.demosd18307.moudel.HoaDon;
import com.example.demosd18307.moudel.HoaDonChitiet;
import com.example.demosd18307.repos.CtspRespo;
import com.example.demosd18307.repos.HoaDonRespo;
import com.example.demosd18307.repos.HoadonCtRespo;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@WebServlet(name = "BanhangServlet", value = {
        "/ban-hang",
        "/hoa-don/edit",
        "/hoa-don/thanhtoan",
        "/hoa-don/store"
})
public class BanhangServlet extends HttpServlet {
    private HoaDonRespo hdRe = new HoaDonRespo();
    private CtspRespo chitietSpRE = new CtspRespo();
    private HoadonCtRespo hdctRe = new HoadonCtRespo();
    ArrayList<HoaDon> lstHd = new ArrayList<>();
    ArrayList<ChitietSp> lstctSp = new ArrayList<>();
    ArrayList<HoaDonChitiet> lstHdct = new ArrayList<>();
    Float tongTien = Float.valueOf(0);
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        if (uri.contains("/ban-hang")){
            this.index(request,response);
        }else if (uri.contains("/hoa-don/edit")){
            this.edit(request,response);
        } else if (uri.contains("/hoa-don/store")) {
            this.store(request,response);
        }else {
            //
        }

    }

    private void store(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HoaDon hd = new HoaDon();
        hd.setNgayTao(new Date());
        hd.setNgaySua(new Date());
        hd.setTrangThai("Chua Thanh Toan");
        hdRe.add(hd);
        response.sendRedirect("/ban-hang");
    }

    private void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer idHd = Integer.parseInt(request.getParameter("idHd"));
        HoaDon hDdetail = hdRe.getdetail(idHd);
        lstHdct = hdctRe.getdetail(idHd);
        tongTien = Float.valueOf(0);
        for (HoaDonChitiet hdct : lstHdct){
            tongTien += hdct.getTongTien();
        }
        request.setAttribute("tongtien",tongTien);
        request.setAttribute("lstcthd",lstHdct);
        request.setAttribute("hDdetail",hDdetail);
        request.setAttribute("ctsp",lstctSp);
        request.setAttribute("lstHd",lstHd);
        request.getRequestDispatcher("/view/x.jsp").forward(request,response);

    }

    private void index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<HoaDon> lstHd = hdRe.getList();
        List<ChitietSp> lstCtsp = chitietSpRE.getlist();
        request.setAttribute("ctsp",lstCtsp);
        request.setAttribute("hd",lstHd);
        request.getRequestDispatcher("/view/x.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        if (uri.contains("/hoa-don/thanhtoan")){
            this.pay(request,response);
        }
    }

    private void pay(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Integer idHoaDon = Integer.parseInt(request.getParameter("idHoaDon"));
        HoaDon hoaDonDetail = hdRe.getdetail(idHoaDon);
        hoaDonDetail.setTrangThai("Da thanh toan");
        hoaDonDetail.setNgaySua(new Date());
        hdRe.add(hoaDonDetail);
        response.sendRedirect("/ban-hang");
    }
}
