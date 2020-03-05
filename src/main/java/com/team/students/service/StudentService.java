package com.team.students.service;

import com.github.pagehelper.PageInfo;
import com.team.students.entity.Students;
import com.team.students.until.StuLike;
import com.team.students.until.StudentByLike;

import java.util.List;

public interface StudentService {
    //分页查询
    public PageInfo<Students> getAllStudents(StuLike stuLike);

    //删除
    public int deleteStudents(int xh);

    //查询单条
    public Students getOneStudents(int xh);

    //修改
    public int updateStudents(Students students);

    //添加
    public int addStudents(Students students);

    //分页模糊查询（）
    public PageInfo<Students> getLikeStu(StudentByLike studentByLike);
}
