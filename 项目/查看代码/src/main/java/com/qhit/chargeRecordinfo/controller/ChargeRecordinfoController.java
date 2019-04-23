package com.qhit.chargeRecordinfo.controller; 

import com.qhit.chargeRecordinfo.pojo.ChargeRecordinfo; 
import com.qhit.chargeRecordinfo.service.IChargeRecordinfoService; 
import com.qhit.chargeRecordinfo.service.impl.ChargeRecordinfoServiceImpl; 
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
* Created by GeneratorCode on 2019/01/28
*/ 

@Controller 
@RequestMapping("/chargeRecordinfo") 
public class ChargeRecordinfoController { 

    @Resource 
    IChargeRecordinfoService chargeRecordinfoService; 

    @RequestMapping("/insert") 
    public String insert(ChargeRecordinfo chargeRecordinfo) { 
        chargeRecordinfoService.insert(chargeRecordinfo); 
        return "forward:list.action"; 
    } 
 
    @RequestMapping("/delete") 
    public String delete(Integer chargeInfoid, HttpServletResponse response) throws IOException { 
        chargeRecordinfoService.delete(chargeInfoid); 
        return "forward:list.action"; 
    } 
 
    @RequestMapping("/update") 
    public String update(ChargeRecordinfo chargeRecordinfo) { 
        chargeRecordinfoService.update(chargeRecordinfo); 
        return "forward:list.action"; 
    } 
 
    @RequestMapping("/updateSelective") 
    public String updateSelective(ChargeRecordinfo chargeRecordinfo) { 
        chargeRecordinfoService.updateSelective(chargeRecordinfo); 
        return "forward:list.action"; 
    } 
 
    @RequestMapping("/load") 
    public String load(Integer chargeInfoid, Model model) { 
        ChargeRecordinfo chargeRecordinfo = chargeRecordinfoService.findById(chargeInfoid); 
        model.addAttribute("chargeRecordinfo",chargeRecordinfo); 
        return "chargeRecordinfo/edit"; 
    } 
 
    @RequestMapping("/list") 
    public String list(Model model) throws IOException { 
        List<ChargeRecordinfo> list = chargeRecordinfoService.findAll(); 
        model.addAttribute("list",list); 
        return "chargeRecordinfo/list"; 
    } 
 
    @RequestMapping("/ajaxList") 
    public void ajaxList(HttpServletResponse response) throws IOException { 
        List<ChargeRecordinfo> list = chargeRecordinfoService.findAll(); 
        String s = JSON.toJSONString(list); 
        response.getWriter().write(s); 
    } 
 
    @RequestMapping("/search") 
    public String search(ChargeRecordinfo chargeRecordinfo,Model model) { 
        List<ChargeRecordinfo> list = chargeRecordinfoService.search(chargeRecordinfo); 
        model.addAttribute("list",list); 
        model.addAttribute("searchObject",chargeRecordinfo); 
        return "chargeRecordinfo/list"; 
    } 
 
} 
