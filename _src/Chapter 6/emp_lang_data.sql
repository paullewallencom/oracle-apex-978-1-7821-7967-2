insert into EMP_LANG (empno, ename, job_no, mgr, hiredate, sal, comm, deptno)
values (7839, 'KING', 1, null, to_date('17-11-1981', 'dd-mm-yyyy'), 5000, null, 10);
insert into EMP_LANG (empno, ename, job_no, mgr, hiredate, sal, comm, deptno)
values (7698, 'BLAKE', 2, 7839, to_date('01-05-1981', 'dd-mm-yyyy'), 2850, null, 30);
insert into EMP_LANG (empno, ename, job_no, mgr, hiredate, sal, comm, deptno)
values (7782, 'CLARK', 2, 7839, to_date('09-06-1981', 'dd-mm-yyyy'), 2450, null, 10);
insert into EMP_LANG (empno, ename, job_no, mgr, hiredate, sal, comm, deptno)
values (7566, 'JONES', 2, 7839, to_date('02-04-1981', 'dd-mm-yyyy'), 2975, null, 20);
insert into EMP_LANG (empno, ename, job_no, mgr, hiredate, sal, comm, deptno)
values (7788, 'SCOTT', 3, 7566, to_date('09-12-1982', 'dd-mm-yyyy'), 3200, null, 20);
insert into EMP_LANG (empno, ename, job_no, mgr, hiredate, sal, comm, deptno)
values (7902, 'FORD', 3, 7566, to_date('03-12-1981', 'dd-mm-yyyy'), 3000, null, 20);
insert into EMP_LANG (empno, ename, job_no, mgr, hiredate, sal, comm, deptno)
values (7369, 'SMITH', 4, 7902, to_date('17-12-1980', 'dd-mm-yyyy'), 1900, null, 20);
insert into EMP_LANG (empno, ename, job_no, mgr, hiredate, sal, comm, deptno)
values (7499, 'ALLEN', 5, 7698, to_date('20-02-1981', 'dd-mm-yyyy'), 1600, 300, 30);
insert into EMP_LANG (empno, ename, job_no, mgr, hiredate, sal, comm, deptno)
values (7521, 'WARD', 5, 7698, to_date('22-02-1981', 'dd-mm-yyyy'), 1250, 500, 30);
insert into EMP_LANG (empno, ename, job_no, mgr, hiredate, sal, comm, deptno)
values (7654, 'MARTIN', 5, 7698, to_date('28-09-1981', 'dd-mm-yyyy'), 1250, 1400, 30);
insert into EMP_LANG (empno, ename, job_no, mgr, hiredate, sal, comm, deptno)
values (7844, 'TURNER', 5, 7698, to_date('08-09-1981', 'dd-mm-yyyy'), 1500, 0, 30);
insert into EMP_LANG (empno, ename, job_no, mgr, hiredate, sal, comm, deptno)
values (7876, 'ADAMS', 4, 7788, to_date('12-01-1983', 'dd-mm-yyyy'), 1100, null, 20);
insert into EMP_LANG (empno, ename, job_no, mgr, hiredate, sal, comm, deptno)
values (7900, 'JAMES', 4, 7698, to_date('03-12-1981', 'dd-mm-yyyy'), 950, null, 30);
insert into EMP_LANG (empno, ename, job_no, mgr, hiredate, sal, comm, deptno)
values (7934, 'MILLER', 4, 7782, to_date('23-01-1982', 'dd-mm-yyyy'), 1300, null, 10);
commit;
