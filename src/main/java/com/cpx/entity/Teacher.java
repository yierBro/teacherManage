package com.cpx.entity;

public class Teacher {
    private Integer id;
    private String name;
    private Integer sex;       // 1男 0女
    private String workName;
    private Integer status;    // 1在职 0停聘
    private Integer cid;       // 院系id
    private String cname;       // 院系name

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    private Integer del;       // 0未删除 1已删除

    public Integer getId() { return id; }
    public void setId(Integer id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public Integer getSex() { return sex; }
    public void setSex(Integer sex) { this.sex = sex; }

    public String getWorkName() { return workName; }
    public void setWorkName(String workName) { this.workName = workName; }

    public Integer getStatus() { return status; }
    public void setStatus(Integer status) { this.status = status; }

    public Integer getCid() { return cid; }
    public void setCid(Integer cid) { this.cid = cid; }

    public Integer getDel() { return del; }
    public void setDel(Integer del) { this.del = del; }
}
