package com.example.demosd18307.repos;

import com.example.demosd18307.moudel.HoaDon;
import com.example.demosd18307.moudel.HoaDonChitiet;
import com.example.demosd18307.utils.HibernateUtils;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.ArrayList;

public class HoaDonChiTiet_Repository {
    Session sess ;
    public ArrayList<HoaDonChitiet> getlist(Integer idHd){
        sess = HibernateUtils.getFACTORY().openSession();
        HoaDon hoaDon= new HoaDon();
        hoaDon.setId(idHd);
        ArrayList<HoaDonChitiet> lst = (ArrayList<HoaDonChitiet>) sess.createQuery("from HoaDonChitiet where " +
                "hd =:hd_1")
                .setParameter("hd_1",hoaDon).list();
        sess.close();
        return lst;
    }
    public void add(HoaDonChitiet hdct){
        sess = HibernateUtils.getFACTORY().openSession();
        Transaction tr = sess.beginTransaction();
        try {
            sess.saveOrUpdate(hdct);
            tr.commit();
        }catch (Exception e){
            e.printStackTrace();
            tr.rollback();
        }
        sess.close();
    }
    public HoaDonChitiet getdetail(Integer id){
        Session sess = HibernateUtils.getFACTORY().openSession();
        HoaDonChitiet hdct = (HoaDonChitiet) sess.createQuery("from HoaDonChitiet where id=:id_1")
                .setParameter("id_1",1).getSingleResult();
        sess.close();
        return hdct;
    }
    public void delete(HoaDonChitiet hdct){
        sess = HibernateUtils.getFACTORY().openSession();
        Transaction tr = sess.beginTransaction();
        try {
            sess.delete(hdct);
            tr.commit();
            sess.close();
        }catch (Exception e){
            e.printStackTrace();
            tr.rollback();
        }
        sess.close();
    }
}
