package com.flo.alwaysbom.flower.controller;

import com.flo.alwaysbom.flower.service.FlowerService;
import com.flo.alwaysbom.flower.vo.FlowerVo;
import com.flo.alwaysbom.util.CloudFileHandler;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class BackFlowerController {

    private final FlowerService flowerService;
    private final CloudFileHandler fileHandler;

    @GetMapping("/admin/flower")
    public String goIndex() {
        return "flower/b_flowerManager";
    }

    @GetMapping("/admin/flowerAddForm")
    public String goInsertForm() {
        return "flower/b_addForm";
    }

    @PostMapping("/admin/addFlower")
    public String addFlower(FlowerVo vo, List<MultipartFile> file) throws IOException {
        vo.setImage1(fileHandler.uploadFile(file.get(0), null, "flower"));
        vo.setImage2(fileHandler.uploadFile(file.get(1), null, "flower"));
        vo.setImage3(fileHandler.uploadFile(file.get(2), null, "flower"));
        System.out.println("vo = " + vo);
        flowerService.addFlower(vo);
        return "redirect:/admin/flowerList";
    }

    @GetMapping("/admin/flowerList")
    public String findAll(Model model) {
        System.out.println("findAll() 실행");
        List<FlowerVo> list = flowerService.findAll();
        model.addAttribute("list", list);
        return "flower/b_flowerList";
    }

}
