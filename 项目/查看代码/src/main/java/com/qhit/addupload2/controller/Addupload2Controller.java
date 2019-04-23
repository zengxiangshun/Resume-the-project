package com.qhit.addupload2.controller; 

import com.qhit.addupload2.pojo.Addupload2; 
import com.qhit.addupload2.service.IAddupload2Service; 
import com.qhit.addupload2.service.impl.Addupload2ServiceImpl; 
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
* Created by GeneratorCode on 2018/12/25
*/ 

@Controller 
@RequestMapping("/addupload2") 
public class Addupload2Controller { 

    @Resource 
    IAddupload2Service addupload2Service; 

    @RequestMapping("/insert") 
    public String insert(Addupload2 addupload2) { 
        addupload2Service.insert(addupload2); 
        return "forward:list.action"; 
    } 
 
    @RequestMapping("/delete") 
    public String delete(Integer id, HttpServletResponse response) throws IOException { 
        addupload2Service.delete(id); 
        return "forward:list.action"; 
    }
    @RequestMapping("/delBtn")
    public String delBtn(String aee) throws IOException {
        String[] split = aee.split(",");

        addupload2Service.delBtn(split);
        return "forward:list.action";
    }
 
    @RequestMapping("/update") 
    public String update(Addupload2 addupload2) { 
        addupload2Service.update(addupload2); 
        return "forward:list.action"; 
    } 
 
    @RequestMapping("/updateSelective") 
    public String updateSelective(Addupload2 addupload2) { 
        addupload2Service.updateSelective(addupload2); 
        return "forward:list.action"; 
    } 
 
    @RequestMapping("/load") 
    public String load(Integer id, Model model) { 
        Addupload2 addupload2 = addupload2Service.findById(id); 
        model.addAttribute("addupload2",addupload2); 
        return "addupload2/edit"; 
    } 
 
    @RequestMapping("/list") 
    public String list(Model model) throws IOException { 
        List<Addupload2> list = addupload2Service.findAll(); 
        model.addAttribute("list",list); 
        return "addupload2/list"; 
    } 
 
    @RequestMapping("/ajaxList") 
    public void ajaxList(HttpServletResponse response) throws IOException { 
        List<Addupload2> list = addupload2Service.findAll(); 
        String s = JSON.toJSONString(list); 
        response.getWriter().write(s); 
    } 
 
    @RequestMapping("/search") 
    public String search(Addupload2 addupload2,Model model) { 
        List<Addupload2> list = addupload2Service.search(addupload2); 
        model.addAttribute("list",list); 
        model.addAttribute("searchObject",addupload2); 
        return "addupload2/list"; 
    } 
 
} 
