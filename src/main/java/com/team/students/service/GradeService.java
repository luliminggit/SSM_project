package com.team.students.service;

import com.github.pagehelper.PageInfo;
import com.team.students.entity.Grade;
import com.team.students.until.GradePage;

import java.util.List;

public interface GradeService {

    public List<Grade> getAllGrade();

    public PageInfo<Grade> getAllGradePage(GradePage gradePage);
}
