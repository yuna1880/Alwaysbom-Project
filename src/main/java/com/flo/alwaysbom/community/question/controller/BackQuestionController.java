package com.flo.alwaysbom.community.question.controller;

import com.flo.alwaysbom.community.question.service.QuestionServise;
import com.flo.alwaysbom.community.question.vo.QuestionVo;
import com.flo.alwaysbom.util.CloudFileHandler;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class BackQuestionController {
    private final CloudFileHandler fileHandler;
    private final QuestionServise servise;
    // 여기부터는 로그인 회원 정보 받기
    @GetMapping("/admin/community/question")
    public String question(Model model, String answer){
        List<QuestionVo> list = null;
        if(answer != null && answer.equals("answer")){
            list = servise.answer();
            model.addAttribute("questlist",list);
            return "community/b_question";
        }
        list = servise.noAnswer();
        model.addAttribute("questlist",list);
        return "community/b_question";
    }

//    @PostMapping("/admin/question/api/writeQuest")
//    @ResponseBody
//    public Boolean addQuestion(QuestionVo vo, MultipartFile file) throws IOException {
//        vo.setImage(fileHandler.uploadFile(file, null, "community/question"));
////        if(vo.getEmailSend() == null || vo.getEmailSend().equals("null")){
////            vo.setEmailSend(0);
////        }
//        servise.addQuestion(vo);
//        System.out.println(vo);
//        return true;
//    }

    // 1:1문의 관리자 답변
    @PostMapping("/admin/question/api/addAnswer")
    @ResponseBody
    public boolean addAnswer(QuestionVo vo){
        servise.updateAnswer(vo);
        return true;
    }

    // 1:1문의 관리자 삭제
    @GetMapping("/admin/question/api/deleteAnswer")
    public String deleteAnswer(Integer idx){
        servise.deleteAnswer(idx);
        return "redirect:/admin/community/question";
    }
}
