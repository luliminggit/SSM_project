package com.team.students.controller;

import com.github.pagehelper.PageInfo;
import com.team.students.entity.Grade;
import com.team.students.entity.Students;
import com.team.students.service.GradeService;
import com.team.students.service.StudentService;
import com.team.students.service.impl.StudentServiceImpl;
import com.team.students.until.StuLike;
import com.team.students.until.StudentByLike;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
public class StudentController {
    //引用业务
    @Autowired(required = false)
    private StudentService studentService;

    @Autowired(required = false)
    private GradeService gradeService;

    @RequestMapping(value = "showStudents")
    public String getAllstu(StuLike stuLik, Model model) {

        PageInfo<Students> pageInfo = studentService.getAllStudents(stuLik);
        List<Grade> allGrade = gradeService.getAllGrade();
        model.addAttribute("allGrade", allGrade);
        model.addAttribute("pageInfo", pageInfo);
        model.addAttribute("stuLik", stuLik);
        return "showStudents";
    }

    @RequestMapping(value = "deleteStudents")
    public String deletestu(Integer xh) {
        int i = studentService.deleteStudents(xh);
        if (i > 0) {
            return "redirect:showStudents";
        } else {
            return "redirect:showStudents";
        }

    }

    @RequestMapping(value = "getStudents")
    public String getOneStu(Integer xh, Model model) {
        Students oneStudents = studentService.getOneStudents(xh);
        List<Grade> allGrade = gradeService.getAllGrade();
        model.addAttribute("oneStudents", oneStudents);
        model.addAttribute("allGrade", allGrade);

        return "getOneStudents";
    }


    @RequestMapping(value = "updateStudents")
    public String updateStu(Students students) {
        int i = studentService.updateStudents(students);
        if (i > 0) {
            return "redirect:showStudents";
        } else {
            return "redirect:showStudents";
        }

    }


    @RequestMapping(value = "addStudents")
    public String addStu(Students students) {
        int i = studentService.addStudents(students);
        if (i > 0) {


            return "redirect:showStudents?action=add";

        } else {

            return "redirect:showStudents";
        }
    }


    @RequestMapping(value = "getLikeStu")
    public String getLikeStu(StudentByLike studentByLike, Model model) {
        //掉业务
        PageInfo<Students> likeStu = studentService.getLikeStu(studentByLike);
        System.out.println(likeStu);

        //将对像信息保存到视图
        model.addAttribute("likeStu", likeStu);
        model.addAttribute("studentByLike", studentByLike);
        return "getLikeStu";
    }


}
