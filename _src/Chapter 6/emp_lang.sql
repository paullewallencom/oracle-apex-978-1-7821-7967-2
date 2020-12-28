create table EMP_LANG
(
  empno    NUMBER(4) not null,
  ename    VARCHAR2(10),
  job_no   NUMBER,
  mgr      NUMBER(4),
  hiredate DATE,
  sal      NUMBER(7,2),
  comm     NUMBER(7,2),
  deptno   NUMBER(2)
);