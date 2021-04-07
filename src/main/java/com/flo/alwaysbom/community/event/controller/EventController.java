package com.flo.alwaysbom.community.event.controller;


import com.flo.alwaysbom.community.event.service.EventService;
import com.flo.alwaysbom.community.event.vo.EventVo;
import com.flo.alwaysbom.util.CloudFileHandler;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class EventController {
    private final CloudFileHandler fileHandler;
    private final EventService servise;

    @GetMapping("/community/event/eventlist")
    public String eventlist(Model model){
        List<EventVo> list = servise.eventList();
        model.addAttribute("eventList", list);
        return "community/eventList";
    }

    @GetMapping("/community/event/{idx}")
    public String eventDetail(@PathVariable("idx") Integer idx, Model model){
        EventVo vo = servise.eventDetail(idx);
        model.addAttribute("eventVo", vo);
        return "community/eventDetail";
    }
}
