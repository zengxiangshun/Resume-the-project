package com.qhit.baseFunction.service.impl;

import com.qhit.baseFunction.service.IBaseFunctionService;
import java.util.List;
import com.qhit.baseFunction.dao.IBaseFunctionDao;
import com.qhit.baseFunction.dao.impl.BaseFunctionDaoImpl;
import com.qhit.baseFunction.pojo.BaseFunction;

/**
* Created by GeneratorCode on 2018/11/29
*/

public class BaseFunctionServiceImpl  implements IBaseFunctionService {

    IBaseFunctionDao dao = new BaseFunctionDaoImpl();

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
        BaseFunction baseFunction = findById(id); 
        return dao.delete(baseFunction); 
    } 


    @Override 
    public List findAll() {
        String sql = "SELECT * from base_function  JOIN base_module ON base_module.mid=base_function.mid";
        return dao.freeFind(sql);
    } 


    @Override 
    public BaseFunction findById(Object id) { 
        List<BaseFunction> list = dao.findById(id); 
        return  list.get(0); 
    }

    @Override
    public List findAlls(BaseFunction baseFunction) {
        String sql = "select * from base_function JOIN base_module ON base_module.mid=base_function.mid where base_function.fname like '%"+baseFunction.getFname()+"%' and base_function.mid='"+baseFunction.getMid()+"'";
        return dao.freeFind(sql);
    }

    @Override
    public List findByIds(Integer mid,Integer userId) {
        String sql = "SELECT DISTINCT bf.* \n" +
                "from base_function bf JOIN base_role_function brf ON bf.fid=brf.fid\n" +
                "\t\t      JOIN base_role br ON br.rid = brf.rid \n" +
                "\t\t      JOIN base_user_role bur ON bur.rid=br.rid\n" +
                "\t\t      JOIN base_user bu ON bu.user_id=bur.uid\n" +
                "\t\t      AND bu.user_id='"+userId+"'\n" +
                "\t\t      AND bf.mid ='"+mid+"'";
        return dao.freeFind(sql);
    }


}