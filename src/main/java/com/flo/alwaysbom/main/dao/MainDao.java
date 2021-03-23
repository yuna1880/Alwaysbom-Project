package com.flo.alwaysbom.main.dao;

import com.flo.alwaysbom.main.vo.MainVo;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class MainDao {

    private final SqlSessionTemplate sessionTemplate;

    public void addImage(MainVo mainVo) {
        sessionTemplate.insert("main.addImage", mainVo);
    }

    public void updateImage(MainVo mainVo) {
        sessionTemplate.update("main.updateImage", mainVo);
    }

    public void deleteImage(int imageNum) {
        sessionTemplate.delete("main.deleteImage", imageNum);
    }

    public List<MainVo> findImages() {
        return sessionTemplate.selectList("main.findImages");
    }


}
