package com.its.memberBoard.controller;

import com.its.memberBoard.dto.MemberDTO;
import com.its.memberBoard.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/member")
public class MemberController {
    @Autowired
    private MemberService memberService;

    @GetMapping("/save")
    public String saveForm() {
        return "/memberPages/save";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute MemberDTO memberDTO) throws IOException {
        System.out.println("MemberController.save");
        System.out.println("memberDTO = " + memberDTO);

        boolean saveResult = memberService.save(memberDTO);
        return "/memberPages/login";
    }

    @PostMapping("/duplicate-check")
    public @ResponseBody String duplicateCheck(@RequestParam("memberId") String memberId) {
        System.out.println("MemberController.duplicateCheck");
        System.out.println("memberId = " + memberId);
        String checkResult = memberService.duplicateCheck(memberId);
        System.out.println("checkResult = " + checkResult);
        return checkResult;
    }

    @GetMapping("/login")
    public String loginForm() {
        return "/memberPages/login";
    }

    @PostMapping("/login")
    public String login(@ModelAttribute MemberDTO memberDTO, HttpSession session) {
        MemberDTO loginMember = memberService.login(memberDTO);
        System.out.println("loginMember = " + loginMember);
        if (loginMember != null) {
            System.out.println("로그인 성공");
            session.setAttribute("loginMemberId", loginMember.getMemberId());
            session.setAttribute("loginId", loginMember.getId());
            return "redirect:/board/paging";
        } else {
            System.out.println("로그인 실패");
            return "/memberPages/login";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        System.out.println("로그아웃 성공");
        return "index";
    }

    @GetMapping("/admin")
    public String admin() {
        return "/memberPages/admin";
    }

    @GetMapping("/findAll")
    public String findAll(Model model) {
        List<MemberDTO> memberDTOList = memberService.findAll();
        model.addAttribute("memberList", memberDTOList);
        return "/memberPages/list";
    }

    @GetMapping("/detail")
    public String findById(@RequestParam("id") Long id, Model model) {
        MemberDTO memberDTO = memberService.findById(id);
        model.addAttribute("member", memberDTO);
        return "/memberPages/detail";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("id") Long id) {
        memberService.delete(id);
        return "redirect:/member/findAll";
    }

    @GetMapping("/main")
    public String main() {
        return "/memberPages/main";
    }

    @GetMapping("/update")
    public String updateForm(HttpSession session, Model model) {
        Long updateId = (Long) session.getAttribute("loginId");
        System.out.println("updateId = " + updateId);
        MemberDTO memberDTO = memberService.findById(updateId);
        model.addAttribute("updateMember", memberDTO);
        return "/memberPages/update";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute MemberDTO memberDTO, HttpSession session) {
        System.out.println("MemberController.update");
        memberService.update(memberDTO);
        return "redirect:/member/detail?id=" + session.getAttribute("loginId");
    }
}
