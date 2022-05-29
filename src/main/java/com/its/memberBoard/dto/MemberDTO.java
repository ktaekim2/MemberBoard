package com.its.memberBoard.dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Data
public class MemberDTO {
    private Long id;
    private String memberId;
    private String memberPassword;
    private String memberName;
    private String memberEmail;
    private String memberMobile;
    private String memberProfile;
    private MultipartFile memberProfileFile; // save.jsp에서 컨트롤러로 넘어올 때 파일을 담아오는 용도
}
