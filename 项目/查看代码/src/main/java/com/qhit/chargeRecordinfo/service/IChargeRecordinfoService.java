package com.qhit.chargeRecordinfo.service;

import java.util.List;
import com.qhit.chargeRecordinfo.pojo.ChargeRecordinfo;
/**
* Created by GeneratorCode on 2019/01/28
*/

public interface IChargeRecordinfoService {

    boolean insert(Object object);

    boolean  update(Object object);

    boolean  updateSelective(Object object);

    boolean delete(Object id);

    List findAll();

    ChargeRecordinfo findById(Object id);

    List<ChargeRecordinfo> search(ChargeRecordinfo chargeRecordinfo);

}