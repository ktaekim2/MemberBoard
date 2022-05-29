package com.its.memberBoard.service;

import com.its.memberBoard.dto.MemberDTO;
import com.its.memberBoard.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;

@Service
public class MemberService {
    @Autowired
    private MemberRepository memberRepository;

    public boolean save(MemberDTO memberDTO) throws IOException {
        System.out.println("MemberService.save");
        System.out.println("memberDTO = " + memberDTO);

        MultipartFile memberProfileFile = memberDTO.getMemberProfileFile();
        String memberProfile = memberProfileFile.getOriginalFilename();
        memberProfile = System.currentTimeMillis() + "-" + memberProfile;
        memberDTO.setMemberProfile(memberProfile);
        String savePath = "D:\\spring_img\\" + memberProfile;
        if (!memberProfileFile.isEmpty())
            memberProfileFile.transferTo(new File(savePath));
        int saveResult = memberRepository.save(memberDTO);
        if (saveResult > 0)
            return true;
        else
            return false;
    }

    public String duplicateCheck(String memberId) {
        System.out.println("MemberService.duplicateCheck");
        System.out.println("memberId = " + memberId);

        String checkResult = memberRepository.duplicateCheck(memberId);
        System.out.println("checkResult = " + checkResult);
        if (checkResult == null) // 중복 아이디가 select해서 존재하지 않기 때문에 null 리턴
            return "ok";
        else
            return "no";
    }

    public MemberDTO login(MemberDTO memberDTO) {
        System.out.println("MemberService.login");
        System.out.println("memberDTO = " + memberDTO);

        return memberRepository.login(memberDTO);
    }

    public List<MemberDTO> findAll() {
        return memberRepository.findAll();
    }

    public MemberDTO findById(Long id) {
        return memberRepository.findById(id);
    }

    public void delete(Long id) {
        memberRepository.delete(id);
    }


    public void update(MemberDTO memberDTO) {
        memberRepository.update(memberDTO);
    }
}
