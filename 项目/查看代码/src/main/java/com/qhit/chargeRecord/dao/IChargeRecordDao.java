package com.qhit.chargeRecord.dao;

import org.springframework.stereotype.Repository;
import com.qhit.chargeRecord.pojo.ChargeRecord;
import java.util.List;

/**
* Created by GeneratorCode on 2019/01/28
*/

@Repository  
public interface IChargeRecordDao {

    boolean insert(Object object);

    boolean  update(Object object);

    boolean  updateSelective(Object object);

    boolean delete(Object object);

    List freeFind(String sql);

    List findAll();

    List findById(Object id);

    boolean freeUpdate(String sql);

    List<ChargeRecord> search(ChargeRecord chargeRecord);

    List findByPatientId(Object patientId);

    List findByDoctorId(Object doctorId);

    List findByAmount(Object amount);

    List findByChargeDate(Object chargeDate);

    List findByChargeUser(Object chargeUser);

}