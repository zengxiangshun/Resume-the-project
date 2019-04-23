package com.qhit.doctorVisitRecord.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.qhit.doctorVisitRecord.pojo.DoctorVisitRecord;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
* Created by GeneratorCode on 2018/12/27
*/

@Repository
public interface IDoctorVisitRecordDao {

    boolean insert(Object object);

    boolean  update(Object object);

    boolean  updateSelective(Object object);

    boolean delete(Object object);

//    List freeFind(String sql);

    List findAll();

    List findById(Object id);

//    boolean freeUpdate(String sql);

    List<DoctorVisitRecord> search(DoctorVisitRecord doctorVisitRecord);
    List<DoctorVisitRecord> search2(DoctorVisitRecord doctorVisitRecord);

    List findByPatientId(Object patientId);

    List findByDoctorId(Object doctorId);

    List findByVisitDate(Object visitDate);

    List findBySymptom(Object symptom);

    List findByAdvice(Object advice);

    List findByTimes(Object times);

    List findByStatus(Object status);

    List<DoctorVisitRecord> findAll2();

    List<DoctorVisitRecord> findAll3();
}