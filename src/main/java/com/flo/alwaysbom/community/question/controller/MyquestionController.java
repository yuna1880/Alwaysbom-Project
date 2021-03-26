package com.flo.alwaysbom.community.question.controller;

import com.flo.alwaysbom.community.question.service.QuestionServise;
import com.flo.alwaysbom.community.question.vo.QuestionVo;
import com.flo.alwaysbom.util.FileHandler;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@Controller
@RequiredArgsConstructor
public class MyquestionController {
    private final FileHandler fileHandler;
    private final QuestionServise servise;
    // 여기부터는 로그인 회원 정보 받기
    @GetMapping("/question/create")
    public String question(){
        return "community/myquestion";
    }

    @PostMapping("/question/api/writeQuest")
    @ResponseBody
    public Boolean addQuestion(QuestionVo vo, MultipartFile file) throws IOException {
        vo.setImage(fileHandler.uploadFile(file, null, "community/question"));
        servise.addQuestion(vo);
        System.out.println(vo);
        return true;
    }
}
