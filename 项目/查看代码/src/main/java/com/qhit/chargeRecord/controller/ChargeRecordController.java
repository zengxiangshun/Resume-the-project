package com.qhit.chargeRecord.controller; 

import com.qhit.basePatientInfo.pojo.BasePatientInfo;
import com.qhit.basePatientInfo.service.IBasePatientInfoService;
import com.qhit.basePatientInfo.service.impl.BasePatientInfoServiceImpl;
import com.qhit.baseUser.pojo.BaseUser;
import com.qhit.baseUser.service.IBaseUserService;
import com.qhit.baseUser.service.impl.BaseUserServiceImpl;
import com.qhit.chargeRecord.pojo.ChargeRecord;
import com.qhit.chargeRecord.service.IChargeRecordService; 
import com.qhit.chargeRecord.service.impl.ChargeRecordServiceImpl; 
import org.springframework.stereotype.Controller; 
import org.springframework.ui.Model; 
import org.springframework.web.bind.annotation.RequestMapping; 
import javax.annotation.Resource; 
import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSON; 
import java.io.IOException; 
import java.util.List; 

/** 
* Created by GeneratorCode on 2019/01/28
*/ 

@Controller 
@RequestMapping("/chargeRecord") 
public class ChargeRecordController { 

    @Resource 
    IChargeRecordService chargeRecordService;
    IBaseUserService baseUserService = new BaseUserServiceImpl();
    IBasePatientInfoService basePatientInfoService = new BasePatientInfoServiceImpl();

    @RequestMapping("/adds")
    public String adds(String nu, HttpSession session) {
        //   3/2,20,15.0/5,10,15.0/
        BaseUser bucct = (BaseUser) session.getAttribute("bucct");
        chargeRecordService.findAdds(nu,bucct.getUserId());
        return "forward:list.action";
    }

    @RequestMapping("/insert") 
    public String insert(ChargeRecord chargeRecord) { 
        chargeRecordService.insert(chargeRecord); 
        return "forward:list.action"; 
    } 
 
    @RequestMapping("/delete") 
    public String delete(Integer chargeId, HttpServletResponse response) throws IOException { 
        chargeRecordService.delete(chargeId); 
        return "forward:list.action"; 
    } 
 
    @RequestMapping("/update") 
    public String update(ChargeRecord chargeRecord) { 
        chargeRecordService.update(chargeRecord); 
        return "forward:list.action"; 
    } 
 
    @RequestMapping("/updateSelective") 
    public String updateSelective(ChargeRecord chargeRecord) { 
        chargeRecordService.updateSelective(chargeRecord); 
        return "forward:list.action"; 
    } 
 
    @RequestMapping("/load") 
    public String load(Integer chargeId, Model model) { 
        ChargeRecord chargeRecord = chargeRecordService.findById(chargeId); 
        model.addAttribute("chargeRecord",chargeRecord); 
        return "chargeRecord/edit"; 
    } 
 
    @RequestMapping("/list") 
    public String list(Model model) throws IOException { 
        List<ChargeRecord> list = chargeRecordService.findAll(); 
        model.addAttribute("list",list);
        List<BaseUser> all = baseUserService.findAll();
        model.addAttribute("bu",all);
        List<BasePatientInfo> all1 = basePatientInfoService.findAll();
        model.addAttribute("bp",all1);
        return "chargeRecord/list"; 
    } 
 
    @RequestMapping("/ajaxList") 
    public void ajaxList(HttpServletResponse response) throws IOException { 
        List<ChargeRecord> list = chargeRecordService.findAll(); 
        String s = JSON.toJSONString(list); 
        response.getWriter().write(s); 
    } 
 
    @RequestMapping("/search") 
    public String search(ChargeRecord chargeRecord,Model model) { 
        List<ChargeRecord> list = chargeRecordService.search(chargeRecord); 
        model.addAttribute("list",list); 
        model.addAttribute("searchObject",chargeRecord); 
        return "chargeRecord/list"; 
    } 
 
} 
