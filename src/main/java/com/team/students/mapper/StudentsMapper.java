package com.team.students.mapper;

import com.github.pagehelper.PageInfo;
import com.team.students.entity.Students;
import com.team.students.entity.StudentsExample;
import com.team.students.until.StudentByLike;

import java.util.List;

public interface StudentsMapper {
    int deleteByPrimaryKey(Integer xh);

    int insert(Students record);

    int insertSelective(Students record);

    List<Students> selectByExample(StudentsExample example);

    Students selectByPrimaryKey(Integer xh);

    int updateByPrimaryKeySelective(Students record);

    int updateByPrimaryKey(Students record);

    List<Students> getLikeStudents(StudentByLike studentByLike);
}