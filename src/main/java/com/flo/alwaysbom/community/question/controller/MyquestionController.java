package com.flo.alwaysbom.community.question.controller;

import com.flo.alwaysbom.community.question.service.QuestionServise;
import com.flo.alwaysbom.community.question.vo.QuestionVo;
import com.flo.alwaysbom.util.CloudFileHandler;
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
    private final CloudFileHandler fileHandler;
    private final QuestionServise servise;
    // 여기부터는 로그인 회원 정보 받기
    @GetMapping("/question/create")
    public String question(){
        return "community/myquestion";
    }

    @PostMapping("/admin/question/api/writeQuest")
    @ResponseBody
    public Boolean addQuestion(QuestionVo vo, MultipartFile file) throws IOException {
        if(vo.getEmailSend() == null){
            vo.setEmailSend(0);
        }
        vo.setImage(fileHandler.uploadFile(file, null, "community/question"));
//        if(vo.getEmailSend() == null || vo.getEmailSend().equals("null")){
//            vo.setEmailSend(0);
//        }
        servise.addQuestion(vo);
        System.out.println(vo);
        return true;
    }
}
