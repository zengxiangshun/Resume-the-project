package com.qhit.chargeRecordinfo.dao;

import org.springframework.stereotype.Repository;
import com.qhit.chargeRecordinfo.pojo.ChargeRecordinfo;
import java.util.List;

/**
* Created by GeneratorCode on 2019/01/28
*/

@Repository  
public interface IChargeRecordinfoDao {

    boolean insert(Object object);

    boolean  update(Object object);

    boolean  updateSelective(Object object);

    boolean delete(Object object);

    List freeFind(String sql);

    List findAll();

    List findById(Object id);

    boolean freeUpdate(String sql);

    List<ChargeRecordinfo> search(ChargeRecordinfo chargeRecordinfo);

    List findByChargeId(Object chargeId);

    List findByCodeId(Object codeId);

    List findByUnitprc(Object unitprc);

    List findByAmt(Object amt);

}