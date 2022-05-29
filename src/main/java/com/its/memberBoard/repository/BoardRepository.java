package com.its.memberBoard.repository;

import com.its.memberBoard.dto.BoardDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class BoardRepository {
    @Autowired
    private SqlSessionTemplate sql;

    public List<BoardDTO> pagingList(Map<String, Integer> pagingParam) {
        return sql.selectList("Board.pagingList", pagingParam);
        // mapper에서 넘어온 DTO 객체를 selectList가 ArrayList로 만들어서 리턴함.
    }
}
