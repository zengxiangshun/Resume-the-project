package com.qhit.doctorVisitRecord.controller; 

import com.qhit.basePatientInfo.pojo.BasePatientInfo;
import com.qhit.basePatientInfo.service.IBasePatientInfoService;
import com.qhit.basePatientInfo.service.impl.BasePatientInfoServiceImpl;
import com.qhit.baseUser.pojo.BaseUser;
import com.qhit.baseUser.service.IBaseUserService;
import com.qhit.baseUser.service.impl.BaseUserServiceImpl;
import com.qhit.doctorMenu.pojo.DoctorMenu;
import com.qhit.doctorMenu.service.IDoctorMenuService;
import com.qhit.doctorMenu.service.impl.DoctorMenuServiceImpl;
import com.qhit.doctorVisitRecord.pojo.DoctorVisitRecord;
import com.qhit.doctorVisitRecord.service.IDoctorVisitRecordService; 
import com.qhit.doctorVisitRecord.service.impl.DoctorVisitRecordServiceImpl;
import com.qhit.medicineCode.pojo.MedicineCode;
import com.qhit.medicineCode.service.IMedicineCodeService;
import com.qhit.medicineCode.service.impl.MedicineCodeServiceImpl;
import com.qhit.medicineStockinfo.pojo.MedicineStockinfo;
import com.qhit.medicineStockinfo.service.IMedicineStockinfoService;
import com.qhit.medicineStockinfo.service.impl.MedicineStockinfoServiceImpl;
import com.qhit.patientRegisterRecord.pojo.PatientRegisterRecord;
import com.qhit.patientRegisterRecord.service.IPatientRegisterRecordService;
import com.qhit.patientRegisterRecord.service.impl.PatientRegisterRecordServiceImpl;
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
* Created by GeneratorCode on 2018/12/27
*/ 

@Controller 
@RequestMapping("/doctorVisitRecord") 
public class DoctorVisitRecordController { 

    @Resource 
    IDoctorVisitRecordService doctorVisitRecordService;
    IPatientRegisterRecordService patientRegisterRecordService = new PatientRegisterRecordServiceImpl();
    IDoctorMenuService doctorMenuService = new DoctorMenuServiceImpl();
    IBasePatientInfoService basePatientInfoService = new BasePatientInfoServiceImpl();
    IMedicineCodeService medicineCodeService = new MedicineCodeServiceImpl();
    IMedicineStockinfoService medicineStockinfoService = new MedicineStockinfoServiceImpl();
    IBaseUserService baseUserService = new BaseUserServiceImpl();


    @RequestMapping("/insert") 
    public String insert(DoctorVisitRecord doctorVisitRecord) { 
        doctorVisitRecordService.insert(doctorVisitRecord); 
        return "forward:list.action"; 
    }

    @RequestMapping("/dactorVisitRecord")
    public String dactorVisitRecord(DoctorVisitRecord doctorVisitRecord, HttpSession session,Model model) {
        BaseUser bucct = (BaseUser) session.getAttribute("bucct");
        //就诊病人
        List<PatientRegisterRecord> list =  patientRegisterRecordService.findByUserids(bucct);
        //医生看见套餐
        List<DoctorMenu> all = doctorMenuService.findByUserId(bucct);
        //药品
        List<MedicineCode> all1 = medicineCodeService.findAll();
        model.addAttribute("pr",list);
        model.addAttribute("dm",all);
        model.addAttribute("mc",all1);
        return "doctorVisitRecord/dactorVisitRecord";
    }
 
    @RequestMapping("/delete") 
    public String delete(Integer vrId, HttpServletResponse response) throws IOException { 
        doctorVisitRecordService.delete(vrId); 
        return "forward:list.action"; 
    } 
 
    @RequestMapping("/update") 
    public String update(DoctorVisitRecord doctorVisitRecord) { 
        doctorVisitRecordService.update(doctorVisitRecord); 
        return "forward:list.action"; 
    } 
 
    @RequestMapping("/updateSelective") 
    public String updateSelective(DoctorVisitRecord doctorVisitRecord) { 
        doctorVisitRecordService.updateSelective(doctorVisitRecord); 
        return "forward:list.action"; 
    } 
 
    @RequestMapping("/load") 
    public String load(Integer vrId, Model model) { 
        DoctorVisitRecord doctorVisitRecord = doctorVisitRecordService.findById(vrId); 
        model.addAttribute("doctorVisitRecord",doctorVisitRecord); 
        return "doctorVisitRecord/edit"; 
    }

    @RequestMapping("/adda")
    public String add(String a,String b,String advice,String symptom, Model model,HttpSession session) {
        BaseUser bucct = (BaseUser) session.getAttribute("bucct");
        boolean flag = doctorVisitRecordService.add(a,b,bucct.getUserId(),advice,symptom);
        return "forward:dactorVisitRecord.action";
    }
 
    @RequestMapping("/list") 
    public String list(Model model) throws IOException { 
        List<DoctorVisitRecord> list = doctorVisitRecordService.findAll2();
        model.addAttribute("list",list);
        List<BaseUser> all = baseUserService.findAll();
        List<BasePatientInfo> all1 = basePatientInfoService.findAll();
        model.addAttribute("bu",all);
        model.addAttribute("bp",all1);
        return "doctorVisitRecord/list"; 
    }
    @RequestMapping("/lists")
    public String lists(Model model) throws IOException {
        List<DoctorVisitRecord> list = doctorVisitRecordService.findAll3();
        model.addAttribute("list",list);
        List<BaseUser> all = baseUserService.findAll();
        List<BasePatientInfo> all1 = basePatientInfoService.findAll();
        model.addAttribute("bu",all);
        model.addAttribute("bp",all1);
        return "doctorVisitRecord/lists";
    }
 
    @RequestMapping("/ajaxList") 
    public void ajaxList(HttpServletResponse response) throws IOException { 
        List<DoctorVisitRecord> list = doctorVisitRecordService.findAll(); 
        String s = JSON.toJSONString(list); 
        response.getWriter().write(s); 
    }
    @RequestMapping("/ajaxload")
    public void ajaxload(HttpServletResponse response,Integer id) throws IOException {
        BasePatientInfo byId = basePatientInfoService.findById(id);
        String s = JSON.toJSONString(byId);
        response.getWriter().write(s);
    }
    @RequestMapping("/ajaxadd")
    public void ajaxadd(HttpServletResponse response,Integer id) throws IOException {
        MedicineCode byId = medicineCodeService.findByCodeId(id);
        String s = JSON.toJSONString(byId);
        response.getWriter().write(s);
    }
 
    @RequestMapping("/search") 
    public String search(DoctorVisitRecord doctorVisitRecord,Model model) {
        List<DoctorVisitRecord> search = doctorVisitRecordService.search(doctorVisitRecord);
        model.addAttribute("list",search);
        model.addAttribute("searchObject",doctorVisitRecord);
        List<BaseUser> all = baseUserService.findAll();
        List<BasePatientInfo> all1 = basePatientInfoService.findAll();
        model.addAttribute("bu",all);
        model.addAttribute("bp",all1);
        return "doctorVisitRecord/list"; 
    }
    @RequestMapping("/search2")
    public String search2(DoctorVisitRecord doctorVisitRecord,Model model) {
        List<DoctorVisitRecord> search = doctorVisitRecordService.search2(doctorVisitRecord);
        model.addAttribute("list",search);
        model.addAttribute("searchObject",doctorVisitRecord);
        List<BaseUser> all = baseUserService.findAll();
        List<BasePatientInfo> all1 = basePatientInfoService.findAll();
        model.addAttribute("bu",all);
        model.addAttribute("bp",all1);
        return "doctorVisitRecord/list";
    }
 
} 
