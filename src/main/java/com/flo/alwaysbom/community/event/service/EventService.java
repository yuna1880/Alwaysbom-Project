package com.flo.alwaysbom.community.event.service;


import com.flo.alwaysbom.community.event.dao.EventDao;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class EventService {
    private final EventDao reviewDao;


}
