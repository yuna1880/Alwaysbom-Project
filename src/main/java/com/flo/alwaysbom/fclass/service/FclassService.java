package com.flo.alwaysbom.fclass.service;

import com.flo.alwaysbom.fclass.dao.FclassDao;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class FclassService {

    private final FclassDao dao;

}
