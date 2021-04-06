package com.flo.alwaysbom.community.event.controller;


import com.flo.alwaysbom.community.event.service.EventService;
import com.flo.alwaysbom.util.CloudFileHandler;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequiredArgsConstructor
public class EventController {
    private final CloudFileHandler fileHandler;
    private final EventService servise;

    @GetMapping("/lilililil")
    public String lIlIlIlIlIlIlIlIlI(){

        return "/community/eventList";
    }

}
