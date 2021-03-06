CREATE TABLE "CALENDAR" (
	"CALD_ID"	NUMBER		NOT NULL,
	"EMP_ID"	NUMBER		NOT NULL,
	"CALD_TITLE"	VARCHAR2(50)		NOT NULL,
	"CALD_WRITER"	VARCHAR2(50)		NOT NULL,
	"CALD_DESCRIPTION"	VARCHAR2(1000)		NULL,
	"CALD_START"	DATE		NOT NULL,
	"CALD_END"	DATE		NOT NULL,
	"CALD_COLOR"	VARCHAR(20)		NULL
);

COMMENT ON COLUMN "CALENDAR"."CALD_ID" IS '일정번호 시퀀스';

COMMENT ON COLUMN "CALENDAR"."EMP_ID" IS '사원번호 - 입사년월일 + 시퀀스(1~99)
EX)2022051801';

COMMENT ON COLUMN "CALENDAR"."CALD_TITLE" IS '일정제목';

COMMENT ON COLUMN "CALENDAR"."CALD_WRITER" IS '작성자';

COMMENT ON COLUMN "CALENDAR"."CALD_DESCRIPTION" IS '일정내용';

COMMENT ON COLUMN "CALENDAR"."CALD_START" IS '일정시작일';

COMMENT ON COLUMN "CALENDAR"."CALD_END" IS '일정종료일';

COMMENT ON COLUMN "CALENDAR"."CALD_COLOR" IS '색상';

CREATE TABLE "CHAT" (
	"CHAT_ID"	VARCHAR(10)		NOT NULL,
	"ROOM_ID"	VARCHAR(5)		NOT NULL,
	"EMP_ID"	NUMBER		NULL,
	"CHAT_CON"	CLOB		NULL
);

COMMENT ON COLUMN "CHAT"."CHAT_ID" IS '사원이 친 채팅을 구분하기 위한 컬럼';

COMMENT ON COLUMN "CHAT"."EMP_ID" IS '채팅을 입력한 사원을 구분하기 위한 컬럼';

COMMENT ON COLUMN "CHAT"."CHAT_CON" IS '채팅 내용을 저장하기 위한 컬럼';

CREATE TABLE "APPROVAL" (
	"APPRO_NO"	VARCHAR2(100)		NOT NULL,
	"APPRO_LINE_NO"	NUMBER		NOT NULL,
	"DOC_FORM_NO"	VARCHAR2(100)		NOT NULL,
	"EMP_ID"	NUMBER		NOT NULL,
	"APPRO_EMPNAME"	VARCHAR2(50)		NULL,
	"APPRO_TITLE"	VARCHAR2(100)		NOT NULL,
	"APPRO_CONTENT"	CLOB		NULL,
	"APPRO_REGDATE"	DATE	DEFAULT SYSDATE	NULL,
	"APPRO_STATUS"	VARCHAR2(20)		NULL,
	"APPRO_STATUS_NO"	NUMBER		NULL,
	"APPRO_TYPE"	VARCHAR2(50)		NULL,
	"APPRO_REFER"	VARCHAR2(1000)		NULL
);

COMMENT ON COLUMN "APPROVAL"."APPRO_NO" IS '문서번호';

COMMENT ON COLUMN "APPROVAL"."APPRO_LINE_NO" IS '결재라인번호';

COMMENT ON COLUMN "APPROVAL"."DOC_FORM_NO" IS '양식폼번호';

COMMENT ON COLUMN "APPROVAL"."EMP_ID" IS '사원번호 - 입사년월일 + 시퀀스(1~99)
EX)2022051801';

COMMENT ON COLUMN "APPROVAL"."APPRO_EMPNAME" IS '기안자';

COMMENT ON COLUMN "APPROVAL"."APPRO_TITLE" IS '문서제목';

COMMENT ON COLUMN "APPROVAL"."APPRO_CONTENT" IS '문서내용';

COMMENT ON COLUMN "APPROVAL"."APPRO_REGDATE" IS '문서작성일';

COMMENT ON COLUMN "APPROVAL"."APPRO_STATUS" IS '결재상태';

COMMENT ON COLUMN "APPROVAL"."APPRO_STATUS_NO" IS '결재상태
(결재대기/진행/반려/완료/임시저장)
결재대기 - 1
진행 - 2
반려 - 3
완료 - 4
임시저장 - 5
참조 - 6';

COMMENT ON COLUMN "APPROVAL"."APPRO_TYPE" IS '결재분류 
본인이 올린 문서이면 - 상신
아니라면 - 송신';

COMMENT ON COLUMN "APPROVAL"."APPRO_REFER" IS '결재라인 참조자 reference';

CREATE TABLE "RESERVATION" (
	"RESV_ID"	NUMBER		NOT NULL,
	"EMP_ID"	NUMBER		NOT NULL,
	"RESV_ROOM_ID"	VARCHAR(20)		NOT NULL,
	"RESV_TITLE"	VARCHAR2(50)		NOT NULL,
	"RESV_WRITER"	VARCHAR2(50)		NOT NULL,
	"RESV_DESCRIPTION"	VARCHAR2(1000)		NULL,
	"RESV_START"	DATE		NOT NULL,
	"RESV_END"	DATE		NOT NULL
);

COMMENT ON COLUMN "RESERVATION"."RESV_ID" IS '예약번호 시퀀스';

COMMENT ON COLUMN "RESERVATION"."EMP_ID" IS '사원번호 - 입사년월일 + 시퀀스(1~99)
EX)2022051801';

COMMENT ON COLUMN "RESERVATION"."RESV_ROOM_ID" IS '회의실 아이디';

COMMENT ON COLUMN "RESERVATION"."RESV_TITLE" IS '일정제목';

COMMENT ON COLUMN "RESERVATION"."RESV_WRITER" IS '작성자';

COMMENT ON COLUMN "RESERVATION"."RESV_DESCRIPTION" IS '내용';

COMMENT ON COLUMN "RESERVATION"."RESV_START" IS '일정시작일';

COMMENT ON COLUMN "RESERVATION"."RESV_END" IS '일정종료일';

CREATE TABLE "FILELIST" (
	"FLIST_SEQ"	NUMBER		NOT NULL,
	"EBOARD_GUBUN"	CHAR(3)		NULL,
	"EBOARD_NO"	NUMBER		NOT NULL,
	"FLIST_UUID"	VARCHAR2(200)		NOT NULL,
	"FLIST_ORIGINNAME"	VARCHAR2(200)		NOT NULL,
	"FLIST_SIZE"	NUMBER		NOT NULL,
	"FLIST_UPLOADPATH"	VARCHAR2(1000)		NOT NULL
);

COMMENT ON COLUMN "FILELIST"."FLIST_SEQ" IS '각 파일을 구분하기 위한 시퀀스값';

COMMENT ON COLUMN "FILELIST"."FLIST_UUID" IS '이름이 동일한 파일을 구분하기 위한 UUID';

COMMENT ON COLUMN "FILELIST"."FLIST_ORIGINNAME" IS '사용자가 업로드한 실제 파일명';

COMMENT ON COLUMN "FILELIST"."FLIST_UPLOADPATH" IS '실제 파일이 업로드된 경로값';

CREATE TABLE "APPROVAL_LINE" (
	"APPRO_LINE_NO"	NUMBER		NOT NULL,
	"APPRO_LINE"	CLOB		NOT NULL
);

COMMENT ON COLUMN "APPROVAL_LINE"."APPRO_LINE_NO" IS '결재라인번호';

COMMENT ON COLUMN "APPROVAL_LINE"."APPRO_LINE" IS '결재선 순서를 JSON Array로 받음';

CREATE TABLE "RESERVATION_ROOM" (
	"RESV_ROOM_ID"	VARCHAR(20)		NOT NULL,
	"RESV_ROOM_TITLE"	VARCHAR2(50)		NOT NULL,
	"RESV_ROOM_EVENTCOLOR"	VARCHAR2(20)		NULL
);

COMMENT ON COLUMN "RESERVATION_ROOM"."RESV_ROOM_ID" IS '회의실 아이디';

COMMENT ON COLUMN "RESERVATION_ROOM"."RESV_ROOM_TITLE" IS '회의실 이름';

COMMENT ON COLUMN "RESERVATION_ROOM"."RESV_ROOM_EVENTCOLOR" IS '회의실 색생
NULL 이면 파란색';

CREATE TABLE "CHAT_ROOM" (
	"ROOM_ID"	VARCHAR(5)		NULL,
	"ROOM_NAME"	VARCHAR(30)		NULL,
	"ROOM_MEM"	BLOB		NULL
);

COMMENT ON COLUMN "CHAT_ROOM"."ROOM_ID" IS '채팅방을 분류하기 위한 칼럼';

COMMENT ON COLUMN "CHAT_ROOM"."ROOM_NAME" IS '채팅방의 이름이 되는 칼럼';

COMMENT ON COLUMN "CHAT_ROOM"."ROOM_MEM" IS '채팅방에 구성원을 저장하는 컬럼
JSONObject 타입으로 0번은 관리자로
채팅 입장, 퇴장 등의 이벤트를 표시해준다.';

CREATE TABLE "ANN_USE" (
	"ANN_USE_NO"	NUMBER		NOT NULL,
	"ANN_USE_DAYS"	NUMBER		NULL,
	"ANN_USE_CONTENT"	VARCHAR2(100)		NULL,
	"ANN_USE_PERIOD"	VARCHAR2(50)		NULL,
	"EMP_ID"	NUMBER		NOT NULL,
	"ANN_USE_DATE"	DATE		NULL
);

COMMENT ON COLUMN "ANN_USE"."ANN_USE_NO" IS 'SEQUENCE';

COMMENT ON COLUMN "ANN_USE"."ANN_USE_DAYS" IS '결재 문서의  사용일 수';

COMMENT ON COLUMN "ANN_USE"."ANN_USE_CONTENT" IS '결재 문서에 내용';

COMMENT ON COLUMN "ANN_USE"."ANN_USE_PERIOD" IS '결재 문서의 연차 기간';

COMMENT ON COLUMN "ANN_USE"."EMP_ID" IS '사원번호 - 입사년월일 + 시퀀스(1~99)
EX)2022051801';

COMMENT ON COLUMN "ANN_USE"."ANN_USE_DATE" IS '결재 문서의 연차 시작일';

CREATE TABLE "DOCUMENT_FORM" (
	"DOC_FORM_NO"	VARCHAR2(100)		NOT NULL,
	"DOC_FORM_TEMPLATE"	CLOB		NULL,
	"DOC_FORM_DATE"	DATE		NULL,
	"DOC_FORM_NAME"	VARCHAR2(50)		NULL
);

COMMENT ON COLUMN "DOCUMENT_FORM"."DOC_FORM_TEMPLATE" IS 'html로 되어있는 폼양식';

COMMENT ON COLUMN "DOCUMENT_FORM"."DOC_FORM_DATE" IS '폼생성일자';

COMMENT ON COLUMN "DOCUMENT_FORM"."DOC_FORM_NAME" IS '양식명';

CREATE TABLE "EMP" (
	"EMP_ID"	NUMBER		NOT NULL,
	"EMP_PASSWORD"	VARCHAR2(100)		NOT NULL,
	"EMP_NAME"	VARCHAR2(20)		NOT NULL,
	"RANK_NO"	CHAR(2)		NULL,
	"DEPT_NO"	CHAR(2)		NULL,
	"STATE_NO"	CHAR(2)		NOT NULL,
	"EMP_ADDRESS"	VARCHAR2(50)		NOT NULL,
	"EMP_PHONE"	VARCHAR2(15)		NULL,
	"EMP_AUTH"	VARCHAR2(10)	DEFAULT 'ROLE_USER'	NOT NULL,
	"EMP_EMAIL"	VARCHAR2(50)		NOT NULL,
	"EMP_NFC"	NUMBER		NOT NULL,
	"EMP_REGDATE"	DATE		NOT NULL,
	"EMP_IN_TIME"	DATE		NULL,
	"EMP_OUT_TIME"	DATE		NULL,
	"EMP_WORK_DAYS"	NUMBER	DEFAULT 0	NOT NULL,
	"EMP_ANN_REST"	NUMBER	DEFAULT 0	NOT NULL
);

COMMENT ON COLUMN "EMP"."EMP_ID" IS '사원번호 - 입사년월일 + 시퀀스(1~99)
EX)2022051801';

COMMENT ON COLUMN "EMP"."EMP_PASSWORD" IS '비밀번호';

COMMENT ON COLUMN "EMP"."EMP_NAME" IS '사원 이름';

COMMENT ON COLUMN "EMP"."RANK_NO" IS '직급 번호';

COMMENT ON COLUMN "EMP"."DEPT_NO" IS '부서번호';

COMMENT ON COLUMN "EMP"."STATE_NO" IS '재직/휴직/퇴사';

COMMENT ON COLUMN "EMP"."EMP_ADDRESS" IS '자택 주소';

COMMENT ON COLUMN "EMP"."EMP_PHONE" IS '휴대폰 번호';

COMMENT ON COLUMN "EMP"."EMP_AUTH" IS '권한(일반사용자/인사관리자/시스템관리자)';

COMMENT ON COLUMN "EMP"."EMP_EMAIL" IS '메일 주소';

COMMENT ON COLUMN "EMP"."EMP_NFC" IS 'NFC 번호';

COMMENT ON COLUMN "EMP"."EMP_REGDATE" IS '입사일';

COMMENT ON COLUMN "EMP"."EMP_IN_TIME" IS '출근 시간';

COMMENT ON COLUMN "EMP"."EMP_OUT_TIME" IS '퇴근시간';

COMMENT ON COLUMN "EMP"."EMP_WORK_DAYS" IS '출근 일수';

COMMENT ON COLUMN "EMP"."EMP_ANN_REST" IS '잔여 연차';

CREATE TABLE "CATEGORY" (
	"CGORY_NO"	CHAR(3)		NOT NULL,
	"CGORY_NAME"	VARCHAR2(20)		NULL,
	"CGORY_REF"	CHAR(3)		NULL
);

COMMENT ON COLUMN "CATEGORY"."CGORY_NO" IS '카테고리 번호
101 필독
102 일반
103 인사
104 일정';

COMMENT ON COLUMN "CATEGORY"."CGORY_NAME" IS '일반, 필독, 일정, 인사';

COMMENT ON COLUMN "CATEGORY"."CGORY_REF" IS '어느 게시판의 카테고리인지 참조할 수 있는 컬럼 

100 공지
200 자료';

CREATE TABLE "RANK" (
	"RANK_NO"	CHAR(2)		NULL,
	"RANK_NAME"	VARCHAR2(10)		NULL
);

COMMENT ON COLUMN "RANK"."RANK_NO" IS '01 - 사원
02 - 대리
03 - 과장
04 - 차장
05 - 부장
06 - 대표';

COMMENT ON COLUMN "RANK"."RANK_NAME" IS '사원/대리/과장/차장/부장/대표';

CREATE TABLE "DEPT" (
	"DEPT_NO"	CHAR(2)		NULL,
	"DEPT_NAME"	VARCHAR2(20)		NULL
);

COMMENT ON COLUMN "DEPT"."DEPT_NO" IS '부서 구분
01 - 인사부 
02 - 관리부
03 - 개발부
04 - 영업부';

COMMENT ON COLUMN "DEPT"."DEPT_NAME" IS '부서명';

CREATE TABLE "ENTRBOARD" (
	"EBOARD_NO"	NUMBER		NOT NULL,
	"CATEGORY_NO"	CHAR(3)		NOT NULL,
	"EMP_ID"	NUMBER		NOT NULL,
	"EBOARD_GUBUN"	CHAR(3)		NOT NULL,
	"EMP_NAME"	VARCHAR2(20)		NOT NULL,
	"EBOARD_TITLE"	VARCHAR2(200)		NULL,
	"EBOARD_CONTENT"	VARCHAR2(4000)		NULL,
	"EBOARD_READCOUNT"	NUMBER		NOT NULL,
	"EBOARD_REGDATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"EBOARD_DELFLAG"	CHAR(1)	DEFAULT 'N'	NOT NULL
);

COMMENT ON COLUMN "ENTRBOARD"."EBOARD_NO" IS '각 글을 구분할 수 있는 시퀀스값';

COMMENT ON COLUMN "ENTRBOARD"."EMP_ID" IS '사원번호 - 입사년월일 + 시퀀스(1~99)
EX)2022051801';

COMMENT ON COLUMN "ENTRBOARD"."EBOARD_TITLE" IS '공지게시글의 제목';

COMMENT ON COLUMN "ENTRBOARD"."EBOARD_CONTENT" IS '공지게시글의 내용';

COMMENT ON COLUMN "ENTRBOARD"."EBOARD_DELFLAG" IS '글의 숨김여부 
숨김 Y, 보임 N';

CREATE TABLE "SIGN" (
	"SIGN_NO"	NUMBER		NOT NULL,
	"EMP_ID"	NUMBER		NOT NULL,
	"SIGN_REGDATE"	DATE		NULL,
	"SIGN_NAME"	VARCHAR2(100)		NULL,
	"SIGN_IMG"	BLOB		NULL
);

COMMENT ON COLUMN "SIGN"."SIGN_NO" IS '서명이미지번호';

COMMENT ON COLUMN "SIGN"."EMP_ID" IS '사원번호 - 입사년월일 + 시퀀스(1~99)
EX)2022051801';

COMMENT ON COLUMN "SIGN"."SIGN_REGDATE" IS '서명생성일';

COMMENT ON COLUMN "SIGN"."SIGN_NAME" IS '서명이미지명';

COMMENT ON COLUMN "SIGN"."SIGN_IMG" IS '서명이미지';

CREATE TABLE "ANN_ADD" (
	"ANN_ADD_NO"	NUMBER		NOT NULL,
	"EMP_ID"	NUMBER		NOT NULL,
	"ANN_ADD_CONTENT"	VARCHAR2(50)		NULL,
	"ANN_ADD_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"ANN_ADD_DAYS"	NUMBER		NULL
);

COMMENT ON COLUMN "ANN_ADD"."ANN_ADD_NO" IS 'SEQUENCE';

COMMENT ON COLUMN "ANN_ADD"."EMP_ID" IS '사원번호 - 입사년월일 + 시퀀스(1~99)
EX)2022051801';

COMMENT ON COLUMN "ANN_ADD"."ANN_ADD_CONTENT" IS '연차 부여시  작성된 내용';

COMMENT ON COLUMN "ANN_ADD"."ANN_ADD_DATE" IS 'SYSDATE';

COMMENT ON COLUMN "ANN_ADD"."ANN_ADD_DAYS" IS '연차 부여시  작성된 발생일 수';

CREATE TABLE "EBOARD_GUBUN" (
	"GONGJI"	CHAR(3)		NOT NULL,
	"JARYO"	CHAR(3)		NOT NULL
);

COMMENT ON COLUMN "EBOARD_GUBUN"."GONGJI" IS '공지게시글 100';

COMMENT ON COLUMN "EBOARD_GUBUN"."JARYO" IS '자료게시글 200';

CREATE TABLE "CHAT_FILE" (
	"FILE_CHAT_SEQ"	VARCHAR(10)		NOT NULL,
	"FILE_CHAT_UUID"	VARCHAR(200)	NOT NULL,
	"FILE_CHAT_ORIGINNM"	VARCHAR(200)	NOT NULL,
	"FILE_CHAT_TYPE"	VARCHAR(10)	NOT NULL,
	"FL_UPLOADPATH"	VARCHAR(100)		NOT NULL
);

COMMENT ON COLUMN "CHAT_FILE"."FILE_CHAT_SEQ" IS '각 파일을 구분하기 위한 시퀀스값';

COMMENT ON COLUMN "CHAT_FILE"."FILE_CHAT_UUID" IS '이름이 동일한 파일을 구분하기 위한 UUID';

COMMENT ON COLUMN "CHAT_FILE"."FILE_CHAT_ORIGINNM" IS '사용자가 업로드한 실제 파일명';

COMMENT ON COLUMN "CHAT_FILE"."FILE_CHAT_TYPE" IS '업로드된 파일의 확장자';

COMMENT ON COLUMN "CHAT_FILE"."FL_UPLOADPATH" IS '실제 파일이 업로드된 경로값';

COMMENT ON TABLE "CHAT_FILE" IS '채팅_파일';

COMMENT ON COLUMN "CHAT_FILE"."FILE_CHAT_SEQ" IS '각 파일을 구분하기 위한 시퀀스값';

COMMENT ON COLUMN "CHAT_FILE"."FILE_CHAT_UUID" IS '이름이 동일한 파일을 구분하기 위한 UUID';

COMMENT ON COLUMN "CHAT_FILE"."FILE_CHAT_ORIGINNM" IS '사용자가 업로드한 실제 파일명';

COMMENT ON COLUMN "CHAT_FILE"."FILE_CHAT_TYPE" IS '업로드된 파일의 확장자';

COMMENT ON COLUMN "CHAT_FILE"."FL_UPLOADPATH" IS '실제 파일이 업로드된 경로값';

CREATE TABLE "FIND_CHAT_ROOM" (
	"EMP_ID"	VARCHAR(20)		NOT NULL,
	"ROOM_ID"	VARCHAR(5)		NULL
);

COMMENT ON COLUMN "FIND_CHAT_ROOM"."ROOM_ID" IS '채팅방을 분류하기 위한 칼럼';

CREATE TABLE "STATE" (
	"STATE_NO"	CHAR(2)		NOT NULL,
	"STATE_NAME"	VARCHAR(10)		NOT NULL
);

COMMENT ON COLUMN "STATE"."STATE_NO" IS '재직 상태 구분
01 - 재직
02 - 휴직
03 - 퇴사';

COMMENT ON COLUMN "STATE"."STATE_NAME" IS '재직/휴직/퇴사';

ALTER TABLE "CALENDAR" ADD CONSTRAINT "PK_CALENDAR" PRIMARY KEY (
	"CALD_ID"
);

ALTER TABLE "CHAT" ADD CONSTRAINT "PK_CHAT" PRIMARY KEY (
	"CHAT_ID",
	"ROOM_ID"
);

ALTER TABLE "APPROVAL" ADD CONSTRAINT "PK_APPROVAL" PRIMARY KEY (
	"APPRO_NO",
	"APPRO_LINE_NO",
	"DOC_FORM_NO"
);

ALTER TABLE "RESERVATION" ADD CONSTRAINT "PK_RESERVATION" PRIMARY KEY (
	"RESV_ID"
);

ALTER TABLE "FILELIST" ADD CONSTRAINT "PK_FILELIST" PRIMARY KEY (
	"FLIST_SEQ"
);

ALTER TABLE "APPROVAL_LINE" ADD CONSTRAINT "PK_APPROVAL_LINE" PRIMARY KEY (
	"APPRO_LINE_NO"
);

ALTER TABLE "RESERVATION_ROOM" ADD CONSTRAINT "PK_RESERVATION_ROOM" PRIMARY KEY (
	"RESV_ROOM_ID"
);

ALTER TABLE "CHAT_ROOM" ADD CONSTRAINT "PK_CHAT_ROOM" PRIMARY KEY (
	"ROOM_ID"
);

ALTER TABLE "ANN_USE" ADD CONSTRAINT "PK_ANN_USE" PRIMARY KEY (
	"ANN_USE_NO"
);

ALTER TABLE "DOCUMENT_FORM" ADD CONSTRAINT "PK_DOCUMENT_FORM" PRIMARY KEY (
	"DOC_FORM_NO"
);

ALTER TABLE "EMP" ADD CONSTRAINT "PK_EMP" PRIMARY KEY (
	"EMP_ID"
);

ALTER TABLE "CATEGORY" ADD CONSTRAINT "PK_CATEGORY" PRIMARY KEY (
	"CGORY_NO"
);

ALTER TABLE "RANK" ADD CONSTRAINT "PK_RANK" PRIMARY KEY (
	"RANK_NO"
);

ALTER TABLE "DEPT" ADD CONSTRAINT "PK_DEPT" PRIMARY KEY (
	"DEPT_NO"
);

ALTER TABLE "ENTRBOARD" ADD CONSTRAINT "PK_ENTRBOARD" PRIMARY KEY (
	"EBOARD_NO"
);

ALTER TABLE "SIGN" ADD CONSTRAINT "PK_SIGN" PRIMARY KEY (
	"SIGN_NO",
	"EMP_ID"
);

ALTER TABLE "ANN_ADD" ADD CONSTRAINT "PK_ANN_ADD" PRIMARY KEY (
	"ANN_ADD_NO"
);

ALTER TABLE "CHAT_FILE" ADD CONSTRAINT "PK_CHAT_FILE" PRIMARY KEY (
	"FILE_CHAT_SEQ"
);

ALTER TABLE "STATE" ADD CONSTRAINT "PK_STATE" PRIMARY KEY (
	"STATE_NO"
);

ALTER TABLE "CALENDAR" ADD CONSTRAINT "FK_EMP_TO_CALENDAR_1" FOREIGN KEY (
	"EMP_ID"
)
REFERENCES "EMP" (
	"EMP_ID"
);

ALTER TABLE "CHAT" ADD CONSTRAINT "FK_CHAT_ROOM_TO_CHAT_1" FOREIGN KEY (
	"ROOM_ID"
)
REFERENCES "CHAT_ROOM" (
	"ROOM_ID"
);

ALTER TABLE "APPROVAL" ADD CONSTRAINT "FK_APPROVAL_LINE_TO_APPROVAL_1" FOREIGN KEY (
	"APPRO_LINE_NO"
)
REFERENCES "APPROVAL_LINE" (
	"APPRO_LINE_NO"
);

ALTER TABLE "APPROVAL" ADD CONSTRAINT "FK_DOCUMENT_FORM_TO_APPROVAL_1" FOREIGN KEY (
	"DOC_FORM_NO"
)
REFERENCES "DOCUMENT_FORM" (
	"DOC_FORM_NO"
);

ALTER TABLE "APPROVAL" ADD CONSTRAINT "FK_EMP_TO_APPROVAL_1" FOREIGN KEY (
	"EMP_ID"
)
REFERENCES "EMP" (
	"EMP_ID"
);

ALTER TABLE "RESERVATION" ADD CONSTRAINT "FK_EMP_TO_RESERVATION_1" FOREIGN KEY (
	"EMP_ID"
)
REFERENCES "EMP" (
	"EMP_ID"
);

ALTER TABLE "RESERVATION" ADD CONSTRAINT "FK_RESERVATION_ROOM_TO_RESERVATION_1" FOREIGN KEY (
	"RESV_ROOM_ID"
)
REFERENCES "RESERVATION_ROOM" (
	"RESV_ROOM_ID"
);

ALTER TABLE "ANN_USE" ADD CONSTRAINT "FK_EMP_TO_ANN_USE_1" FOREIGN KEY (
	"EMP_ID"
)
REFERENCES "EMP" (
	"EMP_ID"
);

ALTER TABLE "EMP" ADD CONSTRAINT "FK_RANK_TO_EMP_1" FOREIGN KEY (
	"RANK_NO"
)
REFERENCES "RANK" (
	"RANK_NO"
);

ALTER TABLE "EMP" ADD CONSTRAINT "FK_DEPT_TO_EMP_1" FOREIGN KEY (
	"DEPT_NO"
)
REFERENCES "DEPT" (
	"DEPT_NO"
);

ALTER TABLE "EMP" ADD CONSTRAINT "FK_STATE_TO_EMP_1" FOREIGN KEY (
	"STATE_NO"
)
REFERENCES "STATE" (
	"STATE_NO"
);

ALTER TABLE "ENTRBOARD" ADD CONSTRAINT "FK_CATEGORY_TO_ENTRBOARD_1" FOREIGN KEY (
	"CATEGORY_NO"
)
REFERENCES "CATEGORY" (
	"CGORY_NO"
);

ALTER TABLE "ENTRBOARD" ADD CONSTRAINT "FK_EMP_TO_ENTRBOARD_1" FOREIGN KEY (
	"EMP_ID"
)
REFERENCES "EMP" (
	"EMP_ID"
);

ALTER TABLE "SIGN" ADD CONSTRAINT "FK_EMP_TO_SIGN_1" FOREIGN KEY (
	"EMP_ID"
)
REFERENCES "EMP" (
	"EMP_ID"
);

ALTER TABLE "ANN_ADD" ADD CONSTRAINT "FK_EMP_TO_ANN_ADD_1" FOREIGN KEY (
	"EMP_ID"
)
REFERENCES "EMP" (
	"EMP_ID"
);

ALTER TABLE "FIND_CHAT_ROOM" ADD CONSTRAINT "FK_CHAT_ROOM_TO_FIND_CHAT_ROOM_1" FOREIGN KEY (
	"ROOM_ID"
)
REFERENCES "CHAT_ROOM" (
	"ROOM_ID"
);

COMMENT ON TABLE "EMP" IS '사원';
COMMENT ON TABLE "ENTRBOARD" IS '게시판';
COMMENT ON TABLE "FILELIST" IS '파일리스트';
COMMENT ON TABLE "CATEGORY" IS '카테고리';
COMMENT ON TABLE "EBOARD_GUBUN" IS '구분';
COMMENT ON TABLE "DEPT" IS '부서';
COMMENT ON TABLE "RANK" IS '직급';
COMMENT ON TABLE "STATE" IS '상태';
COMMENT ON TABLE "RESERVATION" IS '회의실예약';
COMMENT ON TABLE "RESERVATION_ROOM" IS '회의실';
COMMENT ON TABLE "CALENDAR" IS '캘린더';
COMMENT ON TABLE "ANN_USE" IS '연차사용내역';
COMMENT ON TABLE "ANN_ADD" IS '연차부여내역';
COMMENT ON TABLE "APPROVAL" IS '전자결재';
COMMENT ON TABLE "APPROVAL_LINE" IS '결재라인';
COMMENT ON TABLE "DOCUMENT_FORM" IS '결재양식폼';
COMMENT ON TABLE "SIGN" IS '서명';
COMMENT ON TABLE "CHAT" IS '채팅';
COMMENT ON TABLE "CHAT_ROOM" IS '채팅방';
COMMENT ON TABLE "FIND_CHAT_ROOM" IS '내_채팅방_리스트';
COMMENT ON TABLE "CHAT_FILE" IS '채팅_파일';