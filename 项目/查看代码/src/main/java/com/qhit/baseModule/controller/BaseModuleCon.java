package com.qhit.baseModule.controller;

import com.alibaba.fastjson.JSONObject;
import com.qhit.baseModule.pojo.BaseModule;
import com.qhit.baseModule.service.IBaseModuleService;
import com.qhit.baseModule.service.impl.BaseModuleServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Created by 16682 on 2018/11/29.
 */
@Controller

@RequestMapping("/baseModule")
public class BaseModuleCon {
    IBaseModuleService service = new BaseModuleServiceImpl();
    @RequestMapping("/list")
    public String list(Model model) {
        List all = service.findAll();
        model.addAttribute("list",all);
        return "/baseModule/list";
    }
    @RequestMapping("/insert")
    public String add (BaseModule baseModule){
        service.insert(baseModule);
        return "forward:list.action";
    }
    @RequestMapping("/delete")
    public String Delete (BaseModule baseModule){
        service.delete(baseModule.getMid());
        return "forward:list.action";
    }
    @RequestMapping("/load")
    public String load (BaseModule baseModule, Model model){
        BaseModule byId = service.findById(baseModule.getMid());
        model.addAttribute("baseModule",byId);
        return "/baseModule/edit";
    }
    @RequestMapping("/update")
    public String Update (BaseModule baseModule){
        service.updateSelective(baseModule);
        return "forward:list.action";
    }
    @RequestMapping("/lists")
    public String lists (BaseModule baseModule,Model model){
        List<BaseModuleCon> all = service.find(baseModule);
        model.addAttribute("list",all);
        model.addAttribute("searchObject",baseModule);
        return "/baseModule/list";
    }
    @RequestMapping("/toplist")
    public void toplist (HttpServletResponse response) throws IOException {
        List<BaseModuleCon> all = service.findAll();
        String s = JSONObject.toJSONString(all);
        response.getWriter().write(s);
    }


}
