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

    public int boardCount() {
        return sql.selectOne("Board.count");
    }

    public void save(BoardDTO boardDTO) {
        System.out.println("BoardRepository.save");
        sql.insert("Board.save", boardDTO);
    }

    public BoardDTO findById(Long id) {
        return sql.selectOne("Board.findById", id);
    }


    public void delete(Long id) {
        sql.delete("Board.delete", id);
    }

    public void update(BoardDTO boardDTO) {
        System.out.println("boardDTO = " + boardDTO);
        sql.update("Board.update", boardDTO);
    }
}
