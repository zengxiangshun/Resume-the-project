package com.qhit.inPatient.service;

import java.util.List;
import com.qhit.inPatient.pojo.InPatient;
/**
* Created by GeneratorCode on 2019/01/15
*/

public interface IInPatientService {

    boolean insert(Object object);

    boolean  update(Object object);

    boolean  updateSelective(Object object);

    boolean delete(Object id);

    List findAll();

    InPatient findById(Object id);

    List<InPatient> search(InPatient inPatient);

    List<InPatient> findAlls();

    List<InPatient> findAllj();

    List<InPatient> findAll1();

    List<InPatient> findAll2();

    List<InPatient> findAla1();

    List<InPatient> findAla2();
}