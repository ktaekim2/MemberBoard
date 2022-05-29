package com.its.memberBoard.service;

import com.its.memberBoard.dto.BoardDTO;
import com.its.memberBoard.repository.BoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class BoardService {
    @Autowired
    private BoardRepository boardRepository;

    private static final int PAGE_LIMIT = 5;
    private static final int BLOCK_LIMIT = 5;

    public List<BoardDTO> pagingList(int page) {
        int pagingStart = (page - 1) * PAGE_LIMIT;
        Map<String, Integer> pagingParam = new HashMap<>();
        pagingParam.put("start", pagingStart);
        pagingParam.put("limit", PAGE_LIMIT);
        List<BoardDTO> pagingList = boardRepository.pagingList(pagingParam);
        return pagingList;
    }
}
