package com.qhit.baseChat.controller; 

import com.qhit.baseChat.pojo.BaseChat; 
import com.qhit.baseChat.service.IBaseChatService;
import com.qhit.friends.pojo.Friends;
import com.sun.net.httpserver.HttpsServer;
import javafx.application.Application;
import net.sf.json.JSONObject;
import org.springframework.boot.SpringApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.http.HttpRequest;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import org.springframework.web.bind.annotation.RestController; 

/** 
* Created by GeneratorCode on 2019/05/14
*/ 

@RestController 
@RequestMapping("/baseChat") 
public class BaseChatController { 

    @Resource 
    IBaseChatService baseChatService; 

    @RequestMapping("/insert") 
    public void insert(BaseChat baseChat) {

        baseChatService.insert(baseChat); 
    } 

    @RequestMapping("/delete") 
    public void delete(Integer chatId) { 
        baseChatService.delete(chatId); 
    } 

    @RequestMapping("/update") 
    public void update(BaseChat baseChat) { 
        baseChatService.update(baseChat); 
    } 

    @RequestMapping("/updateSelective") 
    public void updateSelective(BaseChat baseChat) { 
        baseChatService.updateSelective(baseChat); 
    } 

    @RequestMapping("/load") 
    public BaseChat load(Integer chatId) { 
        BaseChat baseChat = baseChatService.findById(chatId); 
        return baseChat; 
    } 

    @RequestMapping("/list") 
    public List<BaseChat> list()  { 
        List<BaseChat> list = baseChatService.findAll(); 
        return list; 
    } 

    @RequestMapping("/search") 
    public List<BaseChat> search(BaseChat baseChat, HttpSession session) {
        Object baseUserLogin = session.getAttribute("baseUserLogin");
        String s = baseUserLogin.toString();
        JSONObject jsonObject = JSONObject.fromObject(s);
        String userId = jsonObject.getString("userId");
        baseChat.setAuId(Integer.valueOf(userId));

        List<BaseChat> list = baseChatService.search(baseChat);

        return list; 
    }

    @RequestMapping("/search1")
    public List<BaseChat> search1(BaseChat baseChat, HttpSession session) {
        Object baseUserLogin = session.getAttribute("baseUserLogin");
        String s = baseUserLogin.toString();
        JSONObject jsonObject = JSONObject.fromObject(s);
        String userId = jsonObject.getString("userId");
        baseChat.setAuId(Integer.valueOf(userId));

        List<BaseChat> list = baseChatService.search(baseChat);
        baseChat.setAuId(baseChat.getBuId());
        baseChat.setBuId(Integer.valueOf(userId));
        BaseChat baseChat1 = new BaseChat();
        baseChat1.setStatus(1);
        List<BaseChat> searchs = baseChatService.searchs(baseChat);
        for (int i = 0; i < searchs.size(); i++) {
            baseChat1.setChatId(searchs.get(i).getChatId());
            updateSelectives(baseChat1);
        }
        return list;
    }
    public void updateSelectives(BaseChat baseChat) {
        baseChatService.updateSelective(baseChat);
    }
} 
