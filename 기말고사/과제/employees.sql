-- 부서
CREATE TABLE "departments" (
	"dept_no" CHAR(4) NOT NULL -- 부서번호,
	"dept_name" VARCHAR(40) NOT NULL -- 부서명
);

-- 부서
ALTER TABLE "departments"
	ADD CONSTRAINT "PK_departments" -- 부서 기본키
	PRIMARY KEY (
		"dept_no" -- 부서번호
	);

-- 부서 유니크 인덱스
CREATE UNIQUE INDEX "UIX_departments"
	ON "departments" ( -- 부서
		"dept_name" ASC -- 부서명
	);

-- 직원
CREATE TABLE "employees" (
	"emp_no" INTEGER(11) NOT NULL -- 직원번호,
	"birth_date" DATE NOT NULL -- 생일,
	"first_name" VARCHAR(14) NOT NULL -- 이름,
	"last_name" VARCHAR(16) NOT NULL -- 성,
	"gender" enum('M', 'F') NOT NULL -- 성별,
	"hire_date" DATE NOT NULL -- 고용일
);

-- 직원
ALTER TABLE "employees"
	ADD CONSTRAINT "PK_employees" -- 직원 기본키
	PRIMARY KEY (
		"emp_no" -- 직원번호
	);

-- 부서_직원
CREATE TABLE "dept_emp" (
	"emp_no" INTEGER(11) NOT NULL -- 직원번호,
	"dept_no" CHAR(4) NOT NULL -- 부서번호,
	"from_date" DATE NOT NULL -- 시작일,
	"to_date" DATE NOT NULL -- 종료일
);

-- 부서_직원
ALTER TABLE "dept_emp"
	ADD CONSTRAINT "PK_dept_emp" -- 부서_직원 기본키
	PRIMARY KEY (
		"emp_no",  -- 직원번호
		"dept_no"  -- 부서번호
	);

-- 부서_관리자
CREATE TABLE "dept_manager" (
	"dept_no" CHAR(4) DEFAULT 'NULL' -- 부서번호,
	"emp_no" INTEGER(11) NOT NULL -- 직원번호,
	"from_date" DATE NOT NULL -- 시작일,
	"to_date" DATE NOT NULL -- 종료일
);

-- 부서_관리자
ALTER TABLE "dept_manager"
	ADD CONSTRAINT "PK_dept_manager" -- 부서_관리자 기본키
	PRIMARY KEY (
		"dept_no", -- 부서번호
		"emp_no"   -- 직원번호
	);

-- 급여목록
CREATE TABLE "salaries" (
	"emp_no" INTEGER(11) NOT NULL -- 직원번호,
	"from_date" DATE NOT NULL -- 시작일,
	"salary" INTEGER(11) NOT NULL -- 급여,
	"to_date" DATE NOT NULL -- 종료일
);

-- 급여목록
ALTER TABLE "salaries"
	ADD CONSTRAINT "PK_salaries" -- 급여목록 기본키
	PRIMARY KEY (
		"emp_no",    -- 직원번호
		"from_date"  -- 시작일
	);

-- 제목목록
CREATE TABLE "titles" (
	"emp_no" INTEGER(11) NOT NULL -- 직원번호,
	"title" VARCHAR(50) NOT NULL -- 제목,
	"from_date" DATE NOT NULL -- 시작일,
	"to_date" DATE DEFAULT 'NULL' -- 종료일
);

-- 제목목록
ALTER TABLE "titles"
	ADD CONSTRAINT "PK_titles" -- 제목목록 기본키
	PRIMARY KEY (
		"emp_no",    -- 직원번호
		"title",     -- 제목
		"from_date"  -- 시작일
	);

-- 부서_직원
ALTER TABLE "dept_emp"
	ADD CONSTRAINT "FK_employees_TO_dept_emp" -- 직원 -> 부서_직원
	FOREIGN KEY (
		"emp_no" -- 직원번호
	)
	REFERENCES "employees" ( -- 직원
		"emp_no" -- 직원번호
	);

-- 부서_직원
ALTER TABLE "dept_emp"
	ADD CONSTRAINT "FK_departments_TO_dept_emp" -- 부서 -> 부서_직원
	FOREIGN KEY (
		"dept_no" -- 부서번호
	)
	REFERENCES "departments" ( -- 부서
		"dept_no" -- 부서번호
	);

-- 부서_관리자
ALTER TABLE "dept_manager"
	ADD CONSTRAINT "FK_departments_TO_dept_manager" -- 부서 -> 부서_관리자
	FOREIGN KEY (
		"dept_no" -- 부서번호
	)
	REFERENCES "departments" ( -- 부서
		"dept_no" -- 부서번호
	);

-- 부서_관리자
ALTER TABLE "dept_manager"
	ADD CONSTRAINT "FK_employees_TO_dept_manager" -- 직원 -> 부서_관리자
	FOREIGN KEY (
		"emp_no" -- 직원번호
	)
	REFERENCES "employees" ( -- 직원
		"emp_no" -- 직원번호
	);

-- 급여목록
ALTER TABLE "salaries"
	ADD CONSTRAINT "FK_employees_TO_salaries" -- 직원 -> 급여목록
	FOREIGN KEY (
		"emp_no" -- 직원번호
	)
	REFERENCES "employees" ( -- 직원
		"emp_no" -- 직원번호
	);

-- 제목목록
ALTER TABLE "titles"
	ADD CONSTRAINT "FK_employees_TO_titles" -- 직원 -> 제목목록
	FOREIGN KEY (
		"emp_no" -- 직원번호
	)
	REFERENCES "employees" ( -- 직원
		"emp_no" -- 직원번호
	);
