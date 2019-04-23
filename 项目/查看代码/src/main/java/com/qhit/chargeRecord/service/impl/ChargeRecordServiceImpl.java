package com.qhit.chargeRecord.service.impl;

import com.qhit.chargeRecord.service.IChargeRecordService;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import com.qhit.chargeRecord.dao.IChargeRecordDao;
import com.qhit.chargeRecord.pojo.ChargeRecord;
import com.qhit.chargeRecordinfo.pojo.ChargeRecordinfo;
import com.qhit.chargeRecordinfo.service.IChargeRecordinfoService;
import com.qhit.doctorVisitRecord.dao.IDoctorVisitRecordDao;
import com.qhit.doctorVisitRecord.pojo.DoctorVisitRecord;
import com.qhit.doctorVisitRecord.service.IDoctorVisitRecordService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

/**
* Created by GeneratorCode on 2019/01/28
*/

@Service 
public class ChargeRecordServiceImpl  implements IChargeRecordService {

    @Resource 
    IChargeRecordDao dao;
    @Resource
    IDoctorVisitRecordService doctorVisitRecordService;
    @Resource
    IChargeRecordinfoService chargeRecordinfoService;

    @Override 
    public boolean insert(Object object) { 
        return dao.insert(object); 
    } 


    @Override 
    public boolean update(Object object) { 
        return dao.update(object); 
    } 


    @Override 
    public boolean updateSelective(Object object) { 
        return dao.updateSelective(object); 
    } 


    @Override 
    public boolean delete(Object id) { 
        ChargeRecord chargeRecord = findById(id); 
        return dao.delete(chargeRecord); 
    } 


    @Override 
    public List findAll() { 
        return dao.findAll(); 
    } 


    @Override 
    public ChargeRecord findById(Object id) { 
        List<ChargeRecord> list = dao.findById(id); 
        return  list.get(0); 
    } 


    @Override 
    public List<ChargeRecord> search(ChargeRecord chargeRecord) { 
        return dao.search(chargeRecord); 
    }

    @Transactional
    @Override
    public synchronized void findAdds(String nu,Integer userId) {

        //         2 收费后往收费记录表和收费记录详情表中分别插入数据
    //        3 更新就诊表的状态为已缴费
        nu = nu.substring(0,nu.length()-1);
        String[] split = nu.split("/");
        String s = split[0];
        DoctorVisitRecord byId = doctorVisitRecordService.findById(Integer.valueOf(s));
        byId.setStatus(2);
        double a = 0;
        doctorVisitRecordService.update(byId);
        for (int i = 1; i < split.length; i++) {
            String[] str = split[i].split(",");
            a+=Double.parseDouble(str[1])*Double.parseDouble(str[2]);
        }
        Date date = new Date();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        String format1 = format.format(date);
        ChargeRecord chargeRecord = new ChargeRecord();
        chargeRecord.setPatientId(byId.getPatientId());
        chargeRecord.setDoctorId(byId.getDoctorId());
        chargeRecord.setAmount(a);
        chargeRecord.setChargeDate(format1);
        chargeRecord.setChargeUser(userId);
        dao.insert(chargeRecord);
        //----------------------------
        List<ChargeRecord> all = dao.findAll();
        ChargeRecord chargeRecord1 = all.get(0);
        ChargeRecordinfo chargeRecordinfo = new ChargeRecordinfo();
        for (int i = 1; i < split.length; i++) {
            String[] str = split[i].split(",");
            chargeRecordinfo.setChargeId(chargeRecord1.getChargeId());
            chargeRecordinfo.setCodeId(Integer.valueOf(str[0]));
            chargeRecordinfo.setAmt(Integer.valueOf(str[1]));
            chargeRecordinfo.setUnitprc(Double.valueOf(str[2]));
            chargeRecordinfoService.insert(chargeRecordinfo);
        }
    }


}