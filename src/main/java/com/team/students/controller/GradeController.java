package com.team.students.controller;

import com.github.pagehelper.PageInfo;
import com.team.students.entity.Grade;
import com.team.students.service.GradeService;
import com.team.students.until.GradePage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class GradeController {
    @Autowired
    private GradeService gradeService;

    @RequestMapping(value = "getAllGrade")
    public String getAll(Model model) {
        List<Grade> allGrade = gradeService.getAllGrade();
        model.addAttribute("allGrade", allGrade);
        return "addStudents";
    }

    @RequestMapping(value = "showGrade")
    public String getAllGradePage(GradePage gradePage, Model model) {
        PageInfo<Grade> pageInfo = gradeService.getAllGradePage(gradePage);
        model.addAttribute("pageInfo", pageInfo);
        return "showGrade";

    }

}
