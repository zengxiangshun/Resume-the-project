package com.qhit.doctorVisitRecord.service;

import java.util.List;
import com.qhit.doctorVisitRecord.pojo.DoctorVisitRecord;
import org.springframework.stereotype.Repository;

/**
* Created by GeneratorCode on 2018/12/27
*/

public interface IDoctorVisitRecordService {

    boolean insert(Object object);

    boolean  update(Object object);

    boolean  updateSelective(Object object);

    boolean delete(Object id);

    List findAll();

    DoctorVisitRecord findById(Object id);

    List<DoctorVisitRecord> search(DoctorVisitRecord doctorVisitRecord);

    List<DoctorVisitRecord> findPid(String s);


    boolean add(String a, String b, Integer userId, String advice, String symptom);

    List<DoctorVisitRecord> findAll2();

    List<DoctorVisitRecord> findAll3();

    List<DoctorVisitRecord> search2(DoctorVisitRecord doctorVisitRecord);
}