package com.qhit.doctorMenuMedicine.dao;

import com.qhit.utils.BaseDao;
import java.util.List;

/**
* Created by GeneratorCode on 2018/12/19
*/

public interface IDoctorMenuMedicineDao {

    boolean insert(Object object);

    boolean  update(Object object);

    boolean  updateSelective(Object object);

    boolean delete(Object object);

    List freeFind(String sql);

    List findAll();

    List findById(Object id);

    boolean freeUpdate(String sql);

    List findByMenuId(Object menuId);

    List findByCodeId(Object codeId);

    List findByAmt(Object amt);

}