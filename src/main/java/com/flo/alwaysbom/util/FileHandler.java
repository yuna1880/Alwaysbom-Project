package com.flo.alwaysbom.util;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Component
@RequiredArgsConstructor
public class FileHandler {

    private final ServletContext context;

    public String uploadFile(MultipartFile file, String dbName, String uploadFolder) throws IOException {
        if (!file.isEmpty()) {
            String oriName = file.getOriginalFilename();
            int dotIndex = oriName.lastIndexOf("."); //adf..sf.d.sdafdfd.jpg
            if (dotIndex >= 0 && dotIndex < oriName.length() - 1) {
                String ext = oriName.substring(dotIndex);
                String fileName = UUID.randomUUID().toString() + ext;

                File folder = new File("static/upload", uploadFolder);
                String folderPath = context.getRealPath(folder.getPath());
                System.out.println(folderPath);
                //폴더가 있는지 체크
                File f = new File(folderPath);
                if (!f.exists()) {
                    f.mkdirs();
                }

                file.transferTo(new File(folderPath, fileName));

                //기존 파일이 있다면 지우겠다
                if (dbName != null) {
                    File dbFile = new File(folderPath, dbName);
                    if (dbFile.exists()) {
                        dbFile.delete();
                    }
                }

                return new File(new File("/", uploadFolder), fileName).getPath().substring(1);
            } else {
                System.out.println(".이 없거나 확장자의 길이가 1보다 작습니다");
                return null;
            }
        } else {
            return dbName;
        }
    }
}
