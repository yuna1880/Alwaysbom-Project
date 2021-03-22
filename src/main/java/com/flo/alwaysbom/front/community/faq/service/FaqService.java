package com.flo.alwaysbom.front.community.faq.service;

import com.flo.alwaysbom.front.community.faq.dao.FaqDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FaqService {
    @Autowired
    private final FaqDao faqDao;

    public FaqService(FaqDao faqDao) {
        this.faqDao = faqDao;
    }


}
