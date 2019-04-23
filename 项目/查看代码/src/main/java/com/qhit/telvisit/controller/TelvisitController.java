package com.qhit.telvisit.controller; 

import com.qhit.telvisit.pojo.Telvisit; 
import com.qhit.telvisit.service.ITelvisitService; 
import com.qhit.telvisit.service.impl.TelvisitServiceImpl; 
import org.springframework.stereotype.Controller; 
import org.springframework.ui.Model; 
import org.springframework.web.bind.annotation.RequestMapping; 
import javax.annotation.Resource; 
import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse; 
import com.alibaba.fastjson.JSON; 
import java.io.IOException; 
import java.util.List; 

/**
* Created by GeneratorCode on 2018/12/05
*/
@Controller 
@RequestMapping("/telvisit") 
public class TelvisitController { 

    ITelvisitService telvisitService = new TelvisitServiceImpl();; 

    @RequestMapping("/insert") 
    public String insert(Telvisit telvisit) { 
        telvisitService.insert(telvisit); 
        return "forward:listAdd.action";
    } 
 
    @RequestMapping("/delete") 
    public String delete(Integer tvid, HttpServletResponse response) throws IOException { 
        telvisitService.delete(tvid); 
        return "forward:list.action"; 
    } 
 
    @RequestMapping("/update") 
    public String update(Telvisit telvisit) { 
        telvisitService.update(telvisit); 
        return "forward:list.action"; 
    } 
 
    @RequestMapping("/updateSelective") 
    public String updateSelective(Telvisit telvisit) { 
        telvisitService.updateSelective(telvisit); 
        return "forward:list.action"; 
    } 
 
    @RequestMapping("/load") 
    public String load(Integer tvid, Model model) { 
        Telvisit telvisit = telvisitService.findById(tvid); 
        model.addAttribute("telvisit",telvisit); 
        return "telvisit/edit"; 
    }
    //增加回访
    @RequestMapping("/loadTel")
    public String loadTel(Integer cid, Model model) {
        model.addAttribute("cid",cid);
        return "telvisit/add";
    }
 
    @RequestMapping("/list") 
    public String list(Model model) throws IOException { 
        List<Telvisit> list = telvisitService.findAll(); 
        model.addAttribute("list",list); 
        return "telvisit/list"; 
    }
    //增加后返回
    @RequestMapping("/listAdd")
    public String listAdd(Model model,Telvisit telvisit) throws IOException {
        List<Telvisit> list = telvisitService.findAllToCid(telvisit.getCid());
        model.addAttribute("list",list);
        return "telvisit/list";
    }
    @RequestMapping("/listTel")
    public String listTel(Integer cid,Model model) throws IOException {
        List<Telvisit> list = telvisitService.findAllToCid(cid);
        model.addAttribute("list",list);
        return "telvisit/list";
    }
 
    @RequestMapping("/ajaxList") 
    public void ajaxList(HttpServletResponse response) throws IOException { 
        List<Telvisit> list = telvisitService.findAll(); 
        String s = JSON.toJSONString(list); 
        response.getWriter().write(s); 
    } 
 
    @RequestMapping("/search") 
    public String search(Telvisit telvisit,Model model) { 
        List<Telvisit> list = telvisitService.search(telvisit); 
        model.addAttribute("list",list); 
        model.addAttribute("searchObject",telvisit); 
        return "telvisit/list"; 
    } 
 
} 
