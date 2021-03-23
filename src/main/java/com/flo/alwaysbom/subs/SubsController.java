package com.flo.alwaysbom.subs;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SubsController {

    private SubsController subsController;

//    public SubsController(SubsController subsController) {
//      this.subsController = subsController;
//       System.out.println(">>IndexController() 객체생성");
//   }

    @GetMapping("goIndex")
    public String goIndex () {
        System.out.println("여기");
        return "subs/main";
    }








}
