package com.flo.alwaysbom.front.fclass.service;

import com.flo.alwaysbom.front.fclass.dao.FclassDao;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class FclassService {

    private final FclassDao dao;

}
