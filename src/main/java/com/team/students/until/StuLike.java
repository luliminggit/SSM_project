package com.team.students.until;

public class StuLike {
    private String name;
    private Byte startAge;
    private Byte endAge;
    private Integer page = 1;
    private Integer pageSize = 4;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Byte getStartAge() {
        return startAge;
    }

    public void setStartAge(Byte startAge) {
        this.startAge = startAge;
    }

    public Byte getEndAge() {
        return endAge;
    }

    public void setEndAge(Byte endAge) {
        this.endAge = endAge;
    }

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }
}
