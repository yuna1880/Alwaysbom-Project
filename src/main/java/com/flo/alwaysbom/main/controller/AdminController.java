package com.flo.alwaysbom.main.controller;

import com.flo.alwaysbom.main.service.MainService;
import com.flo.alwaysbom.main.vo.MainVo;
import com.flo.alwaysbom.util.FileHandler;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class AdminController {

    private final MainService mainService;
    private final FileHandler fileHandler;

    @GetMapping("/admin/main")
    public String main(Model model) {
        List<MainVo> images = mainService.findImages();

        model.addAttribute("images", images);

        return "main/b_index";
    }

}
