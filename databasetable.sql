CREATE DATABASE IF NOT EXISTS teachermanage;
CREATE TABLE user (
  id INT PRIMARY KEY AUTO_INCREMENT,
  username VARCHAR(50) NOT NULL UNIQUE,
  password VARCHAR(50) NOT NULL,
  real_name VARCHAR(50)
);

-- 先插一个管理员
INSERT INTO user(username,password,real_name) VALUES('admin','123456','管理员');
CREATE TABLE category(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20),
    status INT -- 默认1，查时查1
);

CREATE TABLE teachers(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20),
    sex INT,            -- 1 男  0 女（你可自己约定）
    work_name VARCHAR(20),
    status INT,         -- 1 在职 0 停聘
    cid INT,            -- 所属院系id
    del INT             -- 0 未删除 1 已删除
);
INSERT INTO category(name,status) VALUES('计算机学院',1),('数学学院',1);