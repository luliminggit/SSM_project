package com.team.students.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.team.students.entity.Students;
import com.team.students.entity.StudentsExample;
import com.team.students.mapper.StudentsMapper;
import com.team.students.service.StudentService;
import com.team.students.until.StuLike;
import com.team.students.until.StudentByLike;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentServiceImpl implements StudentService {
    @Autowired
    private StudentsMapper studentsMapper;

    @Override
    public PageInfo<Students> getAllStudents(StuLike stuLike) {
        //1.开启分页支持
        PageHelper.startPage(stuLike.getPage(), stuLike.getPageSize());

        StudentsExample studentsExample = new StudentsExample();
        //创建查询条件
        StudentsExample.Criteria criteria = studentsExample.createCriteria();
        if (stuLike.getName() != null && !stuLike.getName().equals("")) {
            criteria.andNameLike("%" + stuLike.getName() + "%");
        }
        if (stuLike.getStartAge() != null) {
            criteria.andAgeGreaterThanOrEqualTo(stuLike.getStartAge());
        }
        if (stuLike.getEndAge() != null) {
            criteria.andAgeLessThanOrEqualTo(stuLike.getEndAge());
        }
        List<Students> list = studentsMapper.selectByExample(studentsExample);
        PageInfo<Students> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    @Override
    public int deleteStudents(int xh) {
        return studentsMapper.deleteByPrimaryKey(xh);
    }

    @Override
    public Students getOneStudents(int xh) {
        return studentsMapper.selectByPrimaryKey(xh);
    }

    @Override
    public int updateStudents(Students students) {

        return studentsMapper.updateByPrimaryKey(students);
    }

    @Override
    public int addStudents(Students students) {
        return studentsMapper.insert(students);
    }

    //分页模糊查询
    @Override
    public PageInfo<Students> getLikeStu(StudentByLike studentByLike) {
        //1.开启分页支持
        PageHelper.startPage(studentByLike.getPage(), studentByLike.getPageSize());
        //带条件查询学生信息
        List<Students> list = studentsMapper.getLikeStudents(studentByLike);
        //创建对象 将查询到的信息 存在当前页
        PageInfo<Students> pageInfo = new PageInfo<>(list);

        return pageInfo;
    }
}
