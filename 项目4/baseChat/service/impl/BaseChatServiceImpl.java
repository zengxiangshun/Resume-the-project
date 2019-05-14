package com.qhit.baseChat.service.impl;

import com.qhit.baseChat.service.IBaseChatService;
import java.util.List;
import com.qhit.baseChat.dao.IBaseChatDao;
import com.qhit.baseChat.pojo.BaseChat;
import org.springframework.stereotype.Service;
import javax.annotation.Resource; 

/**
* Created by GeneratorCode on 2019/05/14
*/

@Service 
public class BaseChatServiceImpl  implements IBaseChatService {

    @Resource 
    IBaseChatDao dao;

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
        BaseChat baseChat = findById(id); 
        return dao.delete(baseChat); 
    } 

    @Override 
    public List findAll() { 
        return dao.findAll(); 
    } 

    @Override 
    public BaseChat findById(Object id) { 
        List<BaseChat> list = dao.findById(id); 
        return  list.get(0); 
    } 

    @Override 
    public List<BaseChat> search(BaseChat baseChat) { 
        return dao.search(baseChat); 
    }

    @Override
    public List<BaseChat> searchs(BaseChat baseChat) {
        return dao.searchs(baseChat);
    }

}