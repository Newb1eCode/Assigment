package com.example.demosd18307.repos;

import com.example.demosd18307.moudel.HoaDon;
import com.example.demosd18307.utils.HibernateUtils;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.ArrayList;

public class HoaDon_Repository {
    Session sess ;
    public ArrayList<HoaDon> getList(){
        ArrayList<HoaDon> lst = new ArrayList<>();
        sess = HibernateUtils.getFACTORY().openSession();
        lst = (ArrayList<HoaDon>) sess.createQuery("from HoaDon ").list();
        sess.close();
        return lst;
    }
    public void add(HoaDon hd ){
        sess = HibernateUtils.getFACTORY().openSession();
        Transaction tr = sess.beginTransaction();
        try{
            sess.saveOrUpdate(hd);
            tr.commit();
        }catch (Exception e){
            e.printStackTrace();
            tr.rollback();
        }
        sess.close();
    }
    public HoaDon getdetail(Integer id){
        Session sess = HibernateUtils.getFACTORY().openSession();
        HoaDon hd = (HoaDon) sess.createQuery("from HoaDon  where id =:id_1")
                .setParameter("id_1",id).getSingleResult();
        sess.close();
        return hd;
    }
    public HoaDon getsdt(String sdt){
        Session sess = HibernateUtils.getFACTORY().openSession();
        HoaDon hd = (HoaDon) sess.createQuery("select kh.hoTen from HoaDon hd" +
                        " where hd.kh.sdt =:sdt_1")
                .setParameter("sdt_1",sdt).getSingleResult();
        sess.close();
        return hd;
    }
    public  void delete(HoaDon hd){
        sess = HibernateUtils.getFACTORY().openSession();
        Transaction tr = sess.beginTransaction();
        try{
            sess.delete(hd);
            tr.commit();
            sess.close();
        }catch ( Exception e){
            e.printStackTrace();
            tr.rollback();
        }
        sess.close();
    }
}
