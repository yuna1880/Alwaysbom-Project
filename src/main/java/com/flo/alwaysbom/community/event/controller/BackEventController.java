package com.flo.alwaysbom.community.event.controller;


import com.flo.alwaysbom.community.event.service.EventService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequiredArgsConstructor
public class BackEventController {
    private final EventService servise;
    @GetMapping("/qq")
    public String lIlIlIlIlIlIlIlIlI(){
        return "/community/b_EventList";
    }

    @GetMapping("/admin/community/addEventList")
    public String addEventList(){
        return "/community/b_addEventClass";
    }


}
