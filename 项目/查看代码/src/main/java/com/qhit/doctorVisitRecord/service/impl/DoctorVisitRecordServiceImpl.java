package com.qhit.doctorVisitRecord.service.impl;

import com.qhit.doctorVisitRecord.service.IDoctorVisitRecordService;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import com.qhit.doctorVisitRecord.dao.IDoctorVisitRecordDao;
import com.qhit.doctorVisitRecord.pojo.DoctorVisitRecord;
import com.qhit.doctorVisitRecordinfo.pojo.DoctorVisitRecordinfo;
import com.qhit.doctorVisitRecordinfo.service.IDoctorVisitRecordinfoService;
import com.qhit.patientRegisterRecord.pojo.PatientRegisterRecord;
import com.qhit.patientRegisterRecord.service.IPatientRegisterRecordService;
import com.qhit.patientRegisterRecord.service.impl.PatientRegisterRecordServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

/**
* Created by GeneratorCode on 2018/12/27
*/
@Service 
public class DoctorVisitRecordServiceImpl  implements IDoctorVisitRecordService {

    @Resource
    IDoctorVisitRecordDao dao;
    @Resource
    IDoctorVisitRecordinfoService doctorVisitRecordinfoService;
    //挂号
    IPatientRegisterRecordService patientRegisterRecordService = new PatientRegisterRecordServiceImpl();

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
        DoctorVisitRecord doctorVisitRecord = findById(id); 
        return dao.delete(doctorVisitRecord); 
    } 


    @Override 
    public List findAll() { 
        return dao.findAll(); 
    } 


    @Override 
    public DoctorVisitRecord findById(Object id) { 
        List<DoctorVisitRecord> list = dao.findById(id);
        return  list.get(0); 
    } 


    @Override 
    public List<DoctorVisitRecord> search(DoctorVisitRecord doctorVisitRecord) { 
        return dao.search(doctorVisitRecord); 
    }

    @Transactional
    @Override
    public synchronized boolean add(String a, String b, Integer userId, String advice, String symptom) {
        //修改挂号表状态
        String[] split = a.split(",");
        PatientRegisterRecord byId = patientRegisterRecordService.findById(split[1]);
        byId.setStatus(2);
        boolean update = patientRegisterRecordService.update(byId);
        //查询就诊次数
        List<DoctorVisitRecord> list = findPid(split[0]);
        //增加就诊
        DoctorVisitRecord doctorVisitRecord = new DoctorVisitRecord();
        Date date = new Date();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        String format1 = format.format(date);
        doctorVisitRecord.setVisitDate(format1);
        doctorVisitRecord.setPatientId(Integer.valueOf(split[0]));
        doctorVisitRecord.setDoctorId(userId);
        doctorVisitRecord.setSymptom(symptom);
        doctorVisitRecord.setAdvice(advice);
        if (list!=null&&list.size()>0){
            doctorVisitRecord.setTimes(list.size()+1);
        }else {
            doctorVisitRecord.setTimes(1);
        }
        doctorVisitRecord.setStatus(1);
        insert(doctorVisitRecord);
        //增加药品
        List<DoctorVisitRecord> all = findAll();
        DoctorVisitRecord doctorVisitRecord1 = all.get(all.size() - 1);
        DoctorVisitRecordinfo doctorVisitRecordinfo = new DoctorVisitRecordinfo();
        Integer vrId = doctorVisitRecord1.getVrId();//就诊记录id
        doctorVisitRecordinfo.setVrId(vrId);
        String[] b1 = b.split(",");
        boolean flag=false;
        for (int j = 0; j < b1.length; j++) {
            if (j==0 || j%2==0){
                doctorVisitRecordinfo.setCodeId(Integer.valueOf(b1[j]));
                doctorVisitRecordinfo.setAmt(Integer.valueOf(b1[j+1]));
                boolean insert = doctorVisitRecordinfoService.insert(doctorVisitRecordinfo);
                flag=true;
            }
        }

        return flag;
    }

    @Override
    public List<DoctorVisitRecord> findAll2() {
        return dao.findAll2();
    }

    @Override
    public List<DoctorVisitRecord> findAll3() {
        return dao.findAll3();
    }

    @Override
    public List<DoctorVisitRecord> search2(DoctorVisitRecord doctorVisitRecord) {
        return dao.search2(doctorVisitRecord);
    }

    @Override
    public List<DoctorVisitRecord> findPid(String s) {
        return dao.findByPatientId(Integer.valueOf(s));
    }


}