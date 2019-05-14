package com.qhit.friends.controller; 

import com.fasterxml.jackson.databind.util.JSONPObject;
import com.qhit.friends.pojo.Friends;
import com.qhit.friends.service.IFriendsService;
import net.sf.json.JSONObject;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List; 
import org.springframework.web.bind.annotation.RestController; 

/** 
* Created by GeneratorCode on 2019/05/14
*/ 

@RestController 
@RequestMapping("/friends") 
public class FriendsController { 

    @Resource 
    IFriendsService friendsService; 

    @RequestMapping("/insert") 
    public void insert(Friends friends) { 
        friendsService.insert(friends); 
    } 

    @RequestMapping("/delete") 
    public void delete(Integer friendId) { 
        friendsService.delete(friendId); 
    } 

    @RequestMapping("/update") 
    public void update(Friends friends) { 
        friendsService.update(friends); 
    } 

    @RequestMapping("/updateSelective") 
    public void updateSelective(Friends friends) { 
        friendsService.updateSelective(friends); 
    } 

    @RequestMapping("/load") 
    public Friends load(Integer friendId) { 
        Friends friends = friendsService.findById(friendId); 
        return friends; 
    } 

    @RequestMapping("/list") 
    public List<Friends> list()  { 
        List<Friends> list = friendsService.findAll(); 
        return list; 
    } 

    @RequestMapping("/search") 
    public List<Friends> search(Friends friends, HttpSession session) {
        Object baseUserLogin = session.getAttribute("baseUserLogin");
        String s = baseUserLogin.toString();
        JSONObject jsonObject = JSONObject.fromObject(s);
        String userId = jsonObject.getString("userId");
        friends.setAuId(Integer.valueOf(userId));
        List<Friends> list = friendsService.search(friends); 
        return list;
    } 

} 
