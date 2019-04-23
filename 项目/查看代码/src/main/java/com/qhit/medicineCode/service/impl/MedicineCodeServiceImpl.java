package com.qhit.medicineCode.service.impl;

import com.qhit.medicineCode.service.IMedicineCodeService;
import java.util.List;
import com.qhit.medicineCode.dao.IMedicineCodeDao;
import com.qhit.medicineCode.dao.impl.MedicineCodeDaoImpl;
import com.qhit.medicineCode.pojo.MedicineCode;
import com.qhit.medicineStockinfo.pojo.MedicineStockinfo;

/**
* Created by GeneratorCode on 2018/12/03
*/

public class MedicineCodeServiceImpl  implements IMedicineCodeService {

    IMedicineCodeDao dao = new MedicineCodeDaoImpl();

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
        MedicineCode medicineCode = findById(id); 
        return dao.delete(medicineCode); 
    } 


    @Override 
    public List findAll() { 
        return dao.findAll(); 
    } 


    @Override 
    public MedicineCode findById(Object id) { 
        List<MedicineCode> list = dao.findById(id); 
        return  list.get(0); 
    } 


    @Override 
    public boolean freeUpdate(String sql) {
        return dao.freeUpdate(sql);
    }


    @Override 
    public List<MedicineCode> search(MedicineCode medicineCode) {
            String sql = "select * from medicine_code where 1=1 "; 
            if (medicineCode.getMedicineName()!=null && !"".equals(medicineCode.getMedicineName())){        
                sql+=" and MEDICINE_NAME like '%"+medicineCode.getMedicineName()+"%' ";        
            } 
            if (medicineCode.getAliasName()!=null && !"".equals(medicineCode.getAliasName())){        
                sql+=" and alias_name like '%"+medicineCode.getAliasName()+"%' ";        
            } 
            if (medicineCode.getSpecification()!=null && !"".equals(medicineCode.getSpecification())){        
                sql+=" and specification like '%"+medicineCode.getSpecification()+"%' ";        
            } 
            if (medicineCode.getManCode()!=null && !"".equals(medicineCode.getManCode())){        
                sql+=" and man_code like '%"+medicineCode.getManCode()+"%' ";        
            } 
            if (medicineCode.getManChnName()!=null && !"".equals(medicineCode.getManChnName())){        
                sql+=" and man_chn_name like '%"+medicineCode.getManChnName()+"%' ";        
            } 
            if (medicineCode.getTypeName()!=null && !"".equals(medicineCode.getTypeName())){        
                sql+=" and type_name like '%"+medicineCode.getTypeName()+"%' ";        
            } 
            if (medicineCode.getTypeCode()!=null && !"".equals(medicineCode.getTypeCode())){        
                sql+=" and type_code like '%"+medicineCode.getTypeCode()+"%' ";        
            } 
            if (medicineCode.getStockUnit()!=null && !"".equals(medicineCode.getStockUnit())){        
                sql+=" and stock_unit like '%"+medicineCode.getStockUnit()+"%' ";        
            } 
            if (medicineCode.getRetailPrice()!=null && !"".equals(medicineCode.getRetailPrice())){        
                sql+=" and retail_price like '%"+medicineCode.getRetailPrice()+"%' ";        
            } 
            if (medicineCode.getStockPrice()!=null && !"".equals(medicineCode.getStockPrice())){        
                sql+=" and stock_price like '%"+medicineCode.getStockPrice()+"%' ";        
            } 
            if (medicineCode.getDrugNotesPatient()!=null && !"".equals(medicineCode.getDrugNotesPatient())){        
                sql+=" and drug_notes_patient like '%"+medicineCode.getDrugNotesPatient()+"%' ";        
            } 
            if (medicineCode.getDrugNote()!=null && !"".equals(medicineCode.getDrugNote())){        
                sql+=" and drug_note like '%"+medicineCode.getDrugNote()+"%' ";        
            } 
            if (medicineCode.getDrugForm()!=null && !"".equals(medicineCode.getDrugForm())){        
                sql+=" and drug_form like '%"+medicineCode.getDrugForm()+"%' ";        
            } 
            List<MedicineCode> list = dao.freeFind(sql);        
            return list;        
    }

    @Override
    public List findAllby() {
        String sql = "SELECT mc.* from  medicine_code mc JOIN medicine_req_plan mrp ON mrp.medicine_codeid = mc.code_id WHERE mrp.status=2 GROUP BY mrp.medicine_codeid";
        List list = dao.freeFind(sql);
        return list;
    }

    @Override
    public MedicineCode findByCodeId(Integer id) {
        String sql = " SELECT mc.*,CAST(ms.amt AS CHAR) AS amt\n" +
                " from medicine_code mc left JOIN  medicine_stockinfo ms ON mc.code_id = ms.medicinecode_id\n" +
                " WHERE mc.code_id = '"+id+"'";
        List list = dao.freeFind(sql);
        return (MedicineCode) list.get(0);
    }


}