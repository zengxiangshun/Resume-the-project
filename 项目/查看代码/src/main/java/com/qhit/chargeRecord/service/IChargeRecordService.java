package com.qhit.chargeRecord.service;

import java.util.List;
import com.qhit.chargeRecord.pojo.ChargeRecord;
/**
* Created by GeneratorCode on 2019/01/28
*/

public interface IChargeRecordService {

    boolean insert(Object object);

    boolean  update(Object object);

    boolean  updateSelective(Object object);

    boolean delete(Object id);

    List findAll();

    ChargeRecord findById(Object id);

    List<ChargeRecord> search(ChargeRecord chargeRecord);


    void findAdds(String nu, Integer userId);
}