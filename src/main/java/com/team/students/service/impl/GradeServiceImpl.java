package com.team.students.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.team.students.entity.Grade;
import com.team.students.entity.GradeExample;
import com.team.students.mapper.GradeMapper;
import com.team.students.service.GradeService;
import com.team.students.until.GradePage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GradeServiceImpl implements GradeService {
    @Autowired
    private GradeMapper gradeMapper;

    @Override
    public List<Grade> getAllGrade() {
        return gradeMapper.selectByExample(new GradeExample());
    }

    @Override
    public PageInfo<Grade> getAllGradePage(GradePage gradePage) {
        //开启分页支持
        PageHelper.startPage(gradePage.getPage(), gradePage.getPageSize());
        //调用dao层 查询所有学生
        List<Grade> list = gradeMapper.selectByExample(new GradeExample());
        //创建PageInfo对象 获取分页信息
        PageInfo<Grade> pageInfo = new PageInfo<>(list);

        return pageInfo;
    }
}
