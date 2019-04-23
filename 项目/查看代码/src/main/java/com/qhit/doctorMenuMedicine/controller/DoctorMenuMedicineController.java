package com.qhit.doctorMenuMedicine.controller; 

import com.qhit.baseRole.pojo.BaseRole;
import com.qhit.baseUser.pojo.BaseUser;
import com.qhit.baseUser.service.IBaseUserService;
import com.qhit.baseUser.service.impl.BaseUserServiceImpl;
import com.qhit.doctorMenu.service.IDoctorMenuService;
import com.qhit.doctorMenu.service.impl.DoctorMenuServiceImpl;
import com.qhit.doctorMenuMedicine.pojo.DoctorMenuMedicine;
import com.qhit.doctorMenuMedicine.service.IDoctorMenuMedicineService; 
import com.qhit.doctorMenuMedicine.service.impl.DoctorMenuMedicineServiceImpl;
import com.qhit.medicineCode.service.IMedicineCodeService;
import com.qhit.medicineCode.service.impl.MedicineCodeServiceImpl;
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
* Created by GeneratorCode on 2018/12/19
*/
@Controller 
@RequestMapping("/doctorMenuMedicine") 
public class DoctorMenuMedicineController { 

    IDoctorMenuMedicineService doctorMenuMedicineService = new DoctorMenuMedicineServiceImpl();
    IDoctorMenuService doctorMenuService = new DoctorMenuServiceImpl();
    IMedicineCodeService medicineCodeService = new MedicineCodeServiceImpl();
    IBaseUserService baseUserService = new BaseUserServiceImpl();

    @RequestMapping("/insert") 
    public String insert(DoctorMenuMedicine doctorMenuMedicine) { 
        doctorMenuMedicineService.insert(doctorMenuMedicine); 
        return "forward:list.action"; 
    } 
 
    @RequestMapping("/delete") 
    public String delete(Integer mdId, HttpServletResponse response) throws IOException { 
        doctorMenuMedicineService.delete(mdId); 
        return "forward:list.action"; 
    } 
 
    @RequestMapping("/update") 
    public String update(DoctorMenuMedicine doctorMenuMedicine) { 
        doctorMenuMedicineService.update(doctorMenuMedicine); 
        return "forward:list.action"; 
    } 
 
    @RequestMapping("/updateSelective") 
    public String updateSelective(DoctorMenuMedicine doctorMenuMedicine) { 
        doctorMenuMedicineService.updateSelective(doctorMenuMedicine); 
        return "forward:list.action"; 
    } 
 
    @RequestMapping("/load") 
    public String load(Integer mdId, Model model) { 
        DoctorMenuMedicine doctorMenuMedicine = doctorMenuMedicineService.findById(mdId); 
        model.addAttribute("doctorMenuMedicine",doctorMenuMedicine);
        List all = doctorMenuService.findAll();
        List all1 = medicineCodeService.findAll();
        model.addAttribute("dm",all);
        model.addAttribute("mc",all1);
        return "doctorMenuMedicine/edit"; 
    }
    @RequestMapping("/load2")
    public String load2( Model model){
        List all = doctorMenuService.findAll();
        List all1 = medicineCodeService.findAll();
        model.addAttribute("dm",all);
        model.addAttribute("mc",all1);
        return "doctorMenuMedicine/add";
    }
 
    @RequestMapping("/list") 
    public String list(Model model, Integer id, HttpSession session) throws IOException {
        List list1=null;
        if (id==null){
            int medID = (int) session.getAttribute("MedID");
             list1 = doctorMenuMedicineService.findByMid(medID);
        }

        if (id!=null){
            session.setAttribute("MedID",id);
             list1 = doctorMenuMedicineService.findByMid(id);
        }
//        List<DoctorMenuMedicine> list = doctorMenuMedicineService.findAll();
        List all = doctorMenuService.findAll();
        List all1 = medicineCodeService.findAll();
        model.addAttribute("dm",all);
        model.addAttribute("mc",all1);
        model.addAttribute("list",list1);
        return "doctorMenuMedicine/list"; 
    }
    @RequestMapping("/lists")
    public String lists(Model model, Integer id, HttpSession session,int userId) throws IOException {
        BaseUser bucct = (BaseUser) session.getAttribute("bucct");
        BaseUser byId = baseUserService.findById(bucct.getUserId());
        BaseUser byId1 = baseUserService.findById(userId);
        if (byId.getDeptId()==byId1.getDeptId()){
            List<DoctorMenuMedicine> list1=null;
            if (id==null){
                int medID = (int) session.getAttribute("MedID");
                list1 =  doctorMenuMedicineService.findByMid(medID);
            }

            if (id!=null){
                session.setAttribute("MedID",id);
                list1 =doctorMenuMedicineService.findByMid(id);
            }
//        List<DoctorMenuMedicine> list = doctorMenuMedicineService.findAll();
            List all = doctorMenuService.findAll();
            List all1 = medicineCodeService.findAll();
            model.addAttribute("dm",all);
            model.addAttribute("mc",all1);
            model.addAttribute("list",list1);
            return "doctorMenuMedicine/list";
        }
//        List<BaseRole> list = baseUserService.find(bucct.getUserId());
//        List<BaseRole> list2 = baseUserService.find(userId);
//        for (int i = 0; i < list.size(); i++) {
//            for (int j = 0; j < list2.size(); j++) {
//                Integer rid = list2.get(j).getRid();
//                Integer rid1 = list.get(i).getRid();
//                if (list.get(i).getRid()==list2.get(j).getRid()){
//                    List<DoctorMenuMedicine> list1=null;
//                    if (id==null){
//                        int medID = (int) session.getAttribute("MedID");
//                        list1 = doctorMenuMedicineService.findByMid(medID);
//                    }
//
//                    if (id!=null){
//                        session.setAttribute("MedID",id);
//                        list1 = doctorMenuMedicineService.findByMid(id);
//                    }
////        List<DoctorMenuMedicine> list = doctorMenuMedicineService.findAll();
//                    List all = doctorMenuService.findAll();
//                    List all1 = medicineCodeService.findAll();
//                    model.addAttribute("dm",all);
//                    model.addAttribute("mc",all1);
//                    model.addAttribute("list",list1);
//                    return "doctorMenuMedicine/list";
//
//                }
//            }
//        }
        return "doctorMenu/flag";

    }
 
    @RequestMapping("/ajaxList") 
    public void ajaxList(HttpServletResponse response) throws IOException { 
        List<DoctorMenuMedicine> list = doctorMenuMedicineService.findAll(); 
        String s = JSON.toJSONString(list); 
        response.getWriter().write(s); 
    }
    @RequestMapping("/ajaxxl")
    public void ajaxxl(HttpServletResponse response,Integer a) throws IOException {
        List<DoctorMenuMedicine> list = doctorMenuMedicineService.findAllByMenuId(a);
        String s = JSON.toJSONString(list);
        response.getWriter().write(s);
    }
 
    @RequestMapping("/search") 
    public String search(DoctorMenuMedicine doctorMenuMedicine,Model model) { 
        List<DoctorMenuMedicine> list = doctorMenuMedicineService.search(doctorMenuMedicine); 
        model.addAttribute("list",list);
        List all = doctorMenuService.findAll();
        List all1 = medicineCodeService.findAll();
        model.addAttribute("dm",all);
        model.addAttribute("mc",all1);
        model.addAttribute("searchObject",doctorMenuMedicine); 
        return "doctorMenuMedicine/list"; 
    } 
 
} 
