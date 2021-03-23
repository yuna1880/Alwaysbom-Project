package com.flo.alwaysbom.fclass.controller;

import com.flo.alwaysbom.fclass.service.BranchService;
import com.flo.alwaysbom.fclass.vo.BranchVo;
import com.flo.alwaysbom.util.FileHandler;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import java.io.IOException;

@Controller
@RequiredArgsConstructor
public class BackFclassController {
    private final BranchService branchService;
    private final FileHandler fileHandler;

    @GetMapping("admin/fclass/detail")
    public String goDetail(int branchIdx, int fclassIdx ) {

        return "b_detail";
    }
    @GetMapping("admin/fclass/branch")
    public String goBranch() {
        return "b_branch";
    }

    @GetMapping("admin/fclass/list")
    public String goList() {
        return "b_classList";
    }

    @PostMapping("/fclass/api/addbranch")
    @ResponseBody
    public BranchVo addBranch(BranchVo vo, MultipartFile file) throws IOException {
        vo.setMapImage(fileHandler.uploadFile(file, null, "fclass/branch"));
        branchService.addBranch(vo);
        return vo;
    }
}
