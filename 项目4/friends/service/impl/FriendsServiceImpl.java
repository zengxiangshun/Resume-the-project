package com.qhit.friends.service.impl;

import com.qhit.friends.service.IFriendsService;
import java.util.List;
import com.qhit.friends.dao.IFriendsDao;
import com.qhit.friends.pojo.Friends;
import org.springframework.stereotype.Service;
import javax.annotation.Resource; 

/**
* Created by GeneratorCode on 2019/05/14
*/

@Service 
public class FriendsServiceImpl  implements IFriendsService {

    @Resource 
    IFriendsDao dao;

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
        Friends friends = findById(id); 
        return dao.delete(friends); 
    } 

    @Override 
    public List findAll() { 
        return dao.findAll(); 
    } 

    @Override 
    public Friends findById(Object id) { 
        List<Friends> list = dao.findById(id); 
        return  list.get(0); 
    } 

    @Override 
    public List<Friends> search(Friends friends) { 
        return dao.search(friends); 
    } 

}