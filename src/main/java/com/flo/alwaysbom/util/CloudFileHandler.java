package com.flo.alwaysbom.util;

import com.google.auth.oauth2.ServiceAccountCredentials;
import com.google.cloud.storage.*;
import org.springframework.core.io.DefaultResourceLoader;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class CloudFileHandler implements FileHandler {

    private final String BUCKET_NAME = "upload.alwaysbom.xyz";
    private final Storage storage;

    public CloudFileHandler() throws IOException {
        Resource resource = new DefaultResourceLoader().getResource("classpath:storage-credential.json");
        this.storage = StorageOptions.newBuilder()
                .setCredentials(ServiceAccountCredentials.fromStream(resource.getInputStream()))
                .build()
                .getService();
    }

    public String uploadFile(MultipartFile file, String dbName, String uploadFolder) throws IOException {
        if (!file.isEmpty()) {

            String oriName = file.getOriginalFilename();
            int dotIndex = oriName.lastIndexOf("."); //adf..sf.d.sdafdfd.jpg
            if (dotIndex >= 0 && dotIndex < oriName.length() - 1) {
                String fileName = new File(new File("/", uploadFolder), oriName).getPath().substring(1);

                List<Acl> acls = new ArrayList<>();
                acls.add(Acl.of(Acl.User.ofAllUsers(), Acl.Role.READER));
                Blob blob = storage.create(BlobInfo.newBuilder(BUCKET_NAME, fileName).setAcl(acls).build(), file.getBytes());

                return blob.getMediaLink();
            } else {
                System.out.println(".이 없거나 확장자의 길이가 1보다 작습니다");
                return null;
            }
        } else {
            return dbName;
        }
    }
}
