package com.flo.alwaysbom.main.service;

import com.flo.alwaysbom.main.dao.MainDao;
import com.flo.alwaysbom.main.vo.MainVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MainService {

    private final MainDao mainDao;

    public void addImage(MainVo mainVo) {
        mainDao.addImage(mainVo);
    }

    public void updateImage(MainVo mainVo) {
        mainDao.updateImage(mainVo);
    }

    public void deleteImage(int imageNum) {
        mainDao.deleteImage(imageNum);
    }

    public List<MainVo> findImages() {
        return mainDao.findImages();
    }
}
