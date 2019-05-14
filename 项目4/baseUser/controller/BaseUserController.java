package com.qhit.baseUser.controller; 

import com.qhit.baseUser.pojo.BaseUser; 
import com.qhit.baseUser.service.IBaseUserService;
import com.qhit.utils.HttpUtil;
import com.qhit.utils.MD5;
import net.sf.json.JSONObject;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RestController; 

/** 
* Created by GeneratorCode on 2019/05/06
*/ 

@RestController 
@RequestMapping("/baseUser") 
public class BaseUserController {

    MD5 md5 = new MD5();

    @Resource 
    IBaseUserService baseUserService; 

    @RequestMapping("/insert") 
    public void insert(BaseUser baseUser) { 
        baseUserService.insert(baseUser); 
    } 

    @RequestMapping("/delete") 
    public void delete(Integer userId) { 
        baseUserService.delete(userId); 
    } 

    @RequestMapping("/update") 
    public void update(BaseUser baseUser) { 
        baseUserService.update(baseUser); 
    } 

    @RequestMapping("/updateSelective") 
    public void updateSelective(BaseUser baseUser) { 
        baseUserService.updateSelective(baseUser); 
    } 

    @RequestMapping("/load") 
    public BaseUser load(Integer userId) { 
        BaseUser baseUser = baseUserService.findById(userId); 
        return baseUser; 
    }

    int count=0;
    @RequestMapping("/login")
    public BaseUser login(BaseUser baseUser, HttpSession session) {

        if (baseUser.getPassword()!=null){
            baseUser.setPassword(md5.getMD5ofStr(baseUser.getPassword()));
            List<BaseUser> list = baseUserService.baseUserLogin(baseUser);
            if(list.size()>0){
                BaseUser user = list.get(0);
                JSONObject jsonObject = JSONObject.fromObject(user);
                String s = jsonObject.toString();
                session.setAttribute("baseUserLogin",s);
                count++;
                System.out.println("访问了"+count+"次");
                return user;
            }
        }
        return null;
    }


    @RequestMapping("/list")
//    @GetMapping(value = "/list", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public List<BaseUser> list(HttpSession session)  {
        List<BaseUser> list = baseUserService.findAll();
//        List baseinfo = httpUtil.getForList("MrWang", "baseUser/list");
//        Map baseinfo1 = httpUtil.getForMap("baseinfo", "session/getSession");

//        session.setAttribute("zeng","jjdjj");
//        Object baseUserLogin = session.getAttribute("zeng");
//        System.out.println(baseUserLogin);

//        String zeng = (String) session.getAttribute("abc");
        return list; 
    } 

    @RequestMapping("/search") 
    public List<BaseUser> search(BaseUser baseUser) { 
        List<BaseUser> list = baseUserService.search(baseUser); 
        return list; 
    } 

} 
