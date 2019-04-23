package com.qhit.doctorVisitRecordinfo.controller; 

import com.qhit.basePatientInfo.pojo.BasePatientInfo;
import com.qhit.basePatientInfo.service.IBasePatientInfoService;
import com.qhit.basePatientInfo.service.impl.BasePatientInfoServiceImpl;
import com.qhit.baseUser.pojo.BaseUser;
import com.qhit.baseUser.service.IBaseUserService;
import com.qhit.baseUser.service.impl.BaseUserServiceImpl;
import com.qhit.doctorVisitRecordinfo.pojo.DoctorVisitRecordinfo;
import com.qhit.doctorVisitRecordinfo.service.IDoctorVisitRecordinfoService; 
import com.qhit.doctorVisitRecordinfo.service.impl.DoctorVisitRecordinfoServiceImpl;
import com.qhit.medicineCode.pojo.MedicineCode;
import com.qhit.medicineCode.service.IMedicineCodeService;
import com.qhit.medicineCode.service.impl.MedicineCodeServiceImpl;
import com.qhit.medicineStockinfo.pojo.MedicineStockinfo;
import com.qhit.medicineStockinfo.service.IMedicineStockinfoService;
import com.qhit.medicineStockinfo.service.impl.MedicineStockinfoServiceImpl;
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
* Created by GeneratorCode on 2019/01/07
*/ 

@Controller 
@RequestMapping("/doctorVisitRecordinfo") 
public class DoctorVisitRecordinfoController { 

    @Resource 
    IDoctorVisitRecordinfoService doctorVisitRecordinfoService;
    IMedicineStockinfoService medicineStockinfoService = new MedicineStockinfoServiceImpl();
    IMedicineCodeService medicineCodeService = new MedicineCodeServiceImpl();


    @RequestMapping("/insert") 
    public String insert(DoctorVisitRecordinfo doctorVisitRecordinfo) { 
        doctorVisitRecordinfoService.insert(doctorVisitRecordinfo); 
        return "forward:list.action"; 
    } 
 
    @RequestMapping("/delete") 
    public String delete(Integer infoId, HttpServletResponse response) throws IOException { 
        doctorVisitRecordinfoService.delete(infoId); 
        return "forward:list.action"; 
    } 
 
    @RequestMapping("/update") 
    public String update(DoctorVisitRecordinfo doctorVisitRecordinfo) { 
        doctorVisitRecordinfoService.update(doctorVisitRecordinfo); 
        return "forward:list.action"; 
    } 
 
    @RequestMapping("/updateSelective") 
    public String updateSelective(DoctorVisitRecordinfo doctorVisitRecordinfo) { 
        doctorVisitRecordinfoService.updateSelective(doctorVisitRecordinfo); 
        return "forward:list.action"; 
    } 
 
    @RequestMapping("/load") 
    public String load(Integer infoId, Model model) { 
        DoctorVisitRecordinfo doctorVisitRecordinfo = doctorVisitRecordinfoService.findById(infoId); 
        model.addAttribute("doctorVisitRecordinfo",doctorVisitRecordinfo); 
        return "doctorVisitRecordinfo/edit"; 
    } 
 
    @RequestMapping("/list") 
    public String list(Integer vrId, Model model) throws IOException {
        List<DoctorVisitRecordinfo> list = doctorVisitRecordinfoService.findByVrId(vrId);
        List<MedicineStockinfo> all = medicineStockinfoService.findAll();
        List<MedicineCode> all1 = medicineCodeService.findAll();
        model.addAttribute("list",list);
        model.addAttribute("ms",all);
        model.addAttribute("mc",all1);
        model.addAttribute("vrId",vrId);
        return "doctorVisitRecordinfo/list";
    }
    @RequestMapping("/lists")
    public String lists(Integer vrId, Model model) throws IOException {
        List<DoctorVisitRecordinfo> list = doctorVisitRecordinfoService.findByVrId(vrId);
        List<MedicineStockinfo> all = medicineStockinfoService.findAll();
        List<MedicineCode> all1 = medicineCodeService.findAll();
        model.addAttribute("list",list);
        model.addAttribute("ms",all);
        model.addAttribute("mc",all1);
        model.addAttribute("vrId",vrId);
        return "doctorVisitRecordinfo/lists";
    }
 
    @RequestMapping("/ajaxList") 
    public void ajaxList(HttpServletResponse response) throws IOException { 
        List<DoctorVisitRecordinfo> list = doctorVisitRecordinfoService.findAll(); 
        String s = JSON.toJSONString(list); 
        response.getWriter().write(s); 
    } 
 
    @RequestMapping("/search") 
    public String search(DoctorVisitRecordinfo doctorVisitRecordinfo,Model model) { 
        List<DoctorVisitRecordinfo> list = doctorVisitRecordinfoService.search(doctorVisitRecordinfo); 
        model.addAttribute("list",list); 
        model.addAttribute("searchObject",doctorVisitRecordinfo); 
        return "doctorVisitRecordinfo/list"; 
    } 
 
} 
