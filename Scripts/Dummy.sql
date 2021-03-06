DROP TABLE CHAT;
DROP TABLE CHAT_FILE ;
DROP TABLE CHAT_ROOM ;

DROP SEQUENCE SEQ_CHAT_FILE;
DROP SEQUENCE SEQ_CHAT_ROOM ;
DROP SEQUENCE SEQ_CHAT ;

CREATE TABLE CHAT_ROOM (
	"ROOM_ID"	VARCHAR(5)		NOT NULL,
	"ROOM_NAME"	VARCHAR(30)		NOT NULL,
	"ROOM_MEM"	CLOB			NOT NULL
);

ALTER TABLE CHAT_ROOM ADD CONSTRAINTS CHAT_ROOM_PK PRIMARY KEY(ROOM_ID);

ALTER TABLE CHAT_ROOM ADD CONSTRAINT CHAT_ROOM_CHECK CHECK(ROOM_MEM IS JSON);

COMMENT ON COLUMN "CHAT_ROOM"."ROOM_ID" IS '채팅방을 분류하기 위한 칼럼';

COMMENT ON COLUMN "CHAT_ROOM"."ROOM_NAME" IS '채팅방의 이름이 되는 칼럼';

COMMENT ON COLUMN "CHAT_ROOM"."ROOM_MEM" IS '채팅방에 구성원을 저장하는 컬럼';

CREATE TABLE CHAT (
	"CHAT_ID"	VARCHAR(10)		NOT NULL,
	"ROOM_ID"	VARCHAR(5)		NOT NULL,
	"EMP_ID"	NUMBER		NOT NULL,
	"CHAT_CON"	CLOB		NOT NULL,
	"CHAT_TIME"	DATE		NOT NULL,
	"CHAT_TYPE" CHAR(1) 	NOT NULL
);

COMMENT ON TABLE "CHAT" IS '채팅';

COMMENT ON COLUMN "CHAT"."CHAT_ID" IS '사원이 친 채팅을 구분하기 위한 컬럼';

COMMENT ON COLUMN "CHAT"."EMP_ID" IS '채팅을 입력한 사원을 구분하기 위한 컬럼';

COMMENT ON COLUMN "CHAT"."CHAT_CON" IS '채팅 내용을 저장하기 위한 컬럼';

COMMENT ON COLUMN "CHAT"."CHAT_TIME" IS '채팅방에 입장한 사람은 이전 채팅은 못보게 해주는 컬럼';

COMMENT ON COLUMN "CHAT"."CHAT_TYPE" IS '채팅의 타입을 지정하는 컬럼
T - 텍스트, F - 파일';

ALTER TABLE CHAT ADD CONSTRAINTS CHAT_PK PRIMARY KEY(CHAT_ID);

CREATE TABLE "CHAT_FILE" (
	"FILE_CHAT_ID"	VARCHAR(10)		NOT NULL,
	"FILE_CHAT_UUID"	VARCHAR(200)		NOT NULL,
	"FILE_CHAT_ORIGINNM"	VARCHAR(100)		NOT NULL,
	"FILE_CHAT_TYPE"	VARCHAR(10)		NOT NULL,
	"FILE_UPLOADPATH"	VARCHAR(300)		NOT NULL,
	"CHAT_ID"	VARCHAR(10)		NOT NULL
);

ALTER TABLE CHAT_FILE ADD CONSTRAINTS CHAT_FILE_PK PRIMARY KEY(FILE_CHAT_ID);

COMMENT ON TABLE "CHAT_FILE" IS '채팅_파일';

COMMENT ON COLUMN "CHAT_FILE"."FILE_CHAT_ID" IS '각 파일을 구분하기 위한 시퀀스값';

COMMENT ON COLUMN "CHAT_FILE"."FILE_CHAT_UUID" IS '이름이 동일한 파일을 구분하기 위한 UUID';

COMMENT ON COLUMN "CHAT_FILE"."FILE_CHAT_ORIGINNM" IS '사용자가 업로드한 실제 파일명';

COMMENT ON COLUMN "CHAT_FILE"."FILE_CHAT_TYPE" IS '업로드된 파일의 확장자';

COMMENT ON COLUMN "CHAT_FILE"."FILE_UPLOADPATH" IS '실제 파일이 업로드된 경로값';

COMMENT ON COLUMN "CHAT_FILE"."CHAT_ID" IS '사원이 친 채팅을 구분하기 위한 컬럼';

CREATE SEQUENCE SEQ_CHAT_FILE INCREMENT BY 6 START WITH 1 NOCYCLE NOCACHE;
CREATE SEQUENCE SEQ_CHAT_ROOM INCREMENT BY 51 START WITH 1 NOCYCLE NOCACHE;
CREATE SEQUENCE SEQ_CHAT INCREMENT BY 152 START WITH 1 NOCYCLE NOCACHE;

SELECT *
	FROM CHAT;

INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('1','1',0,TO_CLOB('<b>1번 채팅방이 생성 되었습니다.</b>'),TIMESTAMP'2022-05-23 11:38:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('2','2',0,TO_CLOB('<b>2번 채팅방이 생성 되었습니다.</b>'),TIMESTAMP'2022-05-23 11:39:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('3','3',0,TO_CLOB('<b>3번 채팅방이 생성 되었습니다.</b>'),TIMESTAMP'2022-05-23 11:40:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('4','4',0,TO_CLOB('<b>4번 채팅방이 생성 되었습니다.</b>'),TIMESTAMP'2022-05-23 11:41:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('5','5',0,TO_CLOB('<b>5번 채팅방이 생성 되었습니다.</b>'),TIMESTAMP'2022-05-23 11:42:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('6','6',0,TO_CLOB('<b>6번 채팅방이 생성 되었습니다.</b>'),TIMESTAMP'2022-05-23 11:43:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('7','7',0,TO_CLOB('<b>7번 채팅방이 생성 되었습니다.</b>'),TIMESTAMP'2022-05-23 11:44:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('8','8',0,TO_CLOB('<b>8번 채팅방이 생성 되었습니다.</b>'),TIMESTAMP'2022-05-23 11:45:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('9','9',0,TO_CLOB('<b>9번 채팅방이 생성 되었습니다.</b>'),TIMESTAMP'2022-05-23 11:46:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('10','10',0,TO_CLOB('<b>10번 채팅방이 생성 되었습니다.</b>'),TIMESTAMP'2022-05-23 11:47:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('11','11',0,TO_CLOB('<b>11번 채팅방이 생성 되었습니다.</b>'),TIMESTAMP'2022-05-23 11:48:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('12','12',0,TO_CLOB('<b>12번 채팅방이 생성 되었습니다.</b>'),TIMESTAMP'2022-05-23 11:49:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('13','13',0,TO_CLOB('<b>13번 채팅방이 생성 되었습니다.</b>'),TIMESTAMP'2022-05-23 11:50:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('14','14',0,TO_CLOB('<b>14번 채팅방이 생성 되었습니다.</b>'),TIMESTAMP'2022-05-23 11:51:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('15','15',0,TO_CLOB('<b>15번 채팅방이 생성 되었습니다.</b>'),TIMESTAMP'2022-05-23 11:52:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('16','16',0,TO_CLOB('<b>16번 채팅방이 생성 되었습니다.</b>'),TIMESTAMP'2022-05-23 11:53:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('17','17',0,TO_CLOB('<b>17번 채팅방이 생성 되었습니다.</b>'),TIMESTAMP'2022-05-23 11:54:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('18','18',0,TO_CLOB('<b>18번 채팅방이 생성 되었습니다.</b>'),TIMESTAMP'2022-05-23 11:55:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('19','19',0,TO_CLOB('<b>19번 채팅방이 생성 되었습니다.</b>'),TIMESTAMP'2022-05-23 11:56:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('20','20',0,TO_CLOB('<b>20번 채팅방이 생성 되었습니다.</b>'),TIMESTAMP'2022-05-23 11:57:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('21','21',0,TO_CLOB('<b>21번 채팅방이 생성 되었습니다.</b>'),TIMESTAMP'2022-05-23 11:58:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('22','22',0,TO_CLOB('<b>22번 채팅방이 생성 되었습니다.</b>'),TIMESTAMP'2022-05-23 11:59:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('23','23',0,TO_CLOB('<b>23번 채팅방이 생성 되었습니다.</b>'),TIMESTAMP'2022-05-23 12:00:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('24','24',0,TO_CLOB('<b>24번 채팅방이 생성 되었습니다.</b>'),TIMESTAMP'2022-05-23 12:01:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('25','25',0,TO_CLOB('<b>25번 채팅방이 생성 되었습니다.</b>'),TIMESTAMP'2022-05-23 12:02:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('26','26',0,TO_CLOB('<b>26번 채팅방이 생성 되었습니다.</b>'),TIMESTAMP'2022-05-23 12:03:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('27','27',0,TO_CLOB('<b>27번 채팅방이 생성 되었습니다.</b>'),TIMESTAMP'2022-05-23 12:04:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('28','28',0,TO_CLOB('<b>28번 채팅방이 생성 되었습니다.</b>'),TIMESTAMP'2022-05-23 12:05:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('29','29',0,TO_CLOB('<b>29번 채팅방이 생성 되었습니다.</b>'),TIMESTAMP'2022-05-23 12:06:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('30','30',0,TO_CLOB('<b>30번 채팅방이 생성 되었습니다.</b>'),TIMESTAMP'2022-05-23 12:07:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('31','31',0,TO_CLOB('<b>31번 채팅방이 생성 되었습니다.</b>'),TIMESTAMP'2022-05-23 12:08:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('32','32',0,TO_CLOB('<b>32번 채팅방이 생성 되었습니다.</b>'),TIMESTAMP'2022-05-23 12:09:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('33','33',0,TO_CLOB('<b>33번 채팅방이 생성 되었습니다.</b>'),TIMESTAMP'2022-05-23 12:10:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('34','34',0,TO_CLOB('<b>34번 채팅방이 생성 되었습니다.</b>'),TIMESTAMP'2022-05-23 12:11:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('35','35',0,TO_CLOB('<b>35번 채팅방이 생성 되었습니다.</b>'),TIMESTAMP'2022-05-23 12:12:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('36','36',0,TO_CLOB('<b>36번 채팅방이 생성 되었습니다.</b>'),TIMESTAMP'2022-05-23 12:13:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('37','37',0,TO_CLOB('<b>37번 채팅방이 생성 되었습니다.</b>'),TIMESTAMP'2022-05-23 12:14:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('38','38',0,TO_CLOB('<b>38번 채팅방이 생성 되었습니다.</b>'),TIMESTAMP'2022-05-23 12:15:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('39','39',0,TO_CLOB('<b>39번 채팅방이 생성 되었습니다.</b>'),TIMESTAMP'2022-05-23 12:16:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('40','40',0,TO_CLOB('<b>40번 채팅방이 생성 되었습니다.</b>'),TIMESTAMP'2022-05-23 12:17:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('41','41',0,TO_CLOB('<b>41번 채팅방이 생성 되었습니다.</b>'),TIMESTAMP'2022-05-23 12:18:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('42','42',0,TO_CLOB('<b>42번 채팅방이 생성 되었습니다.</b>'),TIMESTAMP'2022-05-23 12:19:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('43','43',0,TO_CLOB('<b>43번 채팅방이 생성 되었습니다.</b>'),TIMESTAMP'2022-05-23 12:20:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('44','44',0,TO_CLOB('<b>44번 채팅방이 생성 되었습니다.</b>'),TIMESTAMP'2022-05-23 12:21:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('45','45',0,TO_CLOB('<b>45번 채팅방이 생성 되었습니다.</b>'),TIMESTAMP'2022-05-23 12:22:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('46','46',0,TO_CLOB('<b>46번 채팅방이 생성 되었습니다.</b>'),TIMESTAMP'2022-05-23 12:23:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('47','47',0,TO_CLOB('<b>47번 채팅방이 생성 되었습니다.</b>'),TIMESTAMP'2022-05-23 12:24:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('48','48',0,TO_CLOB('<b>48번 채팅방이 생성 되었습니다.</b>'),TIMESTAMP'2022-05-23 12:25:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('49','49',0,TO_CLOB('<b>49번 채팅방이 생성 되었습니다.</b>'),TIMESTAMP'2022-05-23 12:26:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('50','50',0,TO_CLOB('<b>50번 채팅방이 생성 되었습니다.</b>'),TIMESTAMP'2022-05-23 12:27:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('51','2',2022052403,TO_CLOB('<p>반가워요 여기는 비 채팅방입니다.</p>'),TIMESTAMP'2022-05-23 12:28:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('52','2',2022052403,TO_CLOB('<p>오늘은 날씨가 맑네요</p>'),TIMESTAMP'2022-05-23 12:29:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('53','2',2022052403,TO_CLOB('<p>비가 안와서 아쉬워요</p>'),TIMESTAMP'2022-05-23 12:30:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('54','2',2022052403,TO_CLOB('<p>ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ</p>'),TIMESTAMP'2022-05-23 12:31:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('55','2',2022052403,TO_CLOB('<p>그치만 언젠가 비가 오겠죠</p>'),TIMESTAMP'2022-05-23 12:32:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('56','2',2022052403,TO_CLOB('<p>그렇길 바래요</p>'),TIMESTAMP'2022-05-23 12:33:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('57','2',2022052403,TO_CLOB('<p>너무 기다리진 마세요</p>'),TIMESTAMP'2022-05-23 12:34:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('58','2',2022052403,TO_CLOB('<p>언제든지 내릴 비이니까요</p>'),TIMESTAMP'2022-05-23 12:35:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('59','3',2022052001,TO_CLOB('<p>반가워요 여기는 바람 채팅방입니다.</p>'),TIMESTAMP'2022-05-23 12:36:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('60','3',2022052001,TO_CLOB('<p>오늘은 날씨가 맑네요</p>'),TIMESTAMP'2022-05-23 12:37:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('61','3',2022052001,TO_CLOB('<p>바람이 안와서 아쉬워요</p>'),TIMESTAMP'2022-05-23 12:38:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('62','3',2022052001,TO_CLOB('<p>ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ</p>'),TIMESTAMP'2022-05-23 12:39:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('63','3',2022052001,TO_CLOB('<p>그치만 언젠가 바람이 오겠죠</p>'),TIMESTAMP'2022-05-23 12:40:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('64','3',2022052001,TO_CLOB('<p>그렇길 바래요</p>'),TIMESTAMP'2022-05-23 12:41:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('65','3',2022052001,TO_CLOB('<p>너무 기다리진 마세요</p>'),TIMESTAMP'2022-05-23 12:42:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('66','3',2022052001,TO_CLOB('<p>언제든지 내릴 바람이니까요</p>'),TIMESTAMP'2022-05-23 12:43:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('67','4',2022052604,TO_CLOB('<p>반가워요 여기는 돌풍 채팅방입니다.</p>'),TIMESTAMP'2022-05-23 12:44:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('68','4',2022052604,TO_CLOB('<p>오늘은 날씨가 맑네요</p>'),TIMESTAMP'2022-05-23 12:45:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('69','4',2022052604,TO_CLOB('<p>돌풍이 안와서 아쉬워요</p>'),TIMESTAMP'2022-05-23 12:46:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('70','4',2022052604,TO_CLOB('<p>ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ</p>'),TIMESTAMP'2022-05-23 12:47:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('71','4',2022052604,TO_CLOB('<p>그치만 언젠가 돌풍이 오겠죠</p>'),TIMESTAMP'2022-05-23 12:48:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('72','4',2022052604,TO_CLOB('<p>그렇길 바래요</p>'),TIMESTAMP'2022-05-23 12:49:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('73','4',2022052604,TO_CLOB('<p>너무 기다리진 마세요</p>'),TIMESTAMP'2022-05-23 12:50:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('74','4',2022052604,TO_CLOB('<p>언제든지 내릴 돌풍이니까요</p>'),TIMESTAMP'2022-05-23 12:51:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('75','5',2022052001,TO_CLOB('<p>반가워요 여기는 번개 채팅방입니다.</p>'),TIMESTAMP'2022-05-23 12:52:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('76','5',2022052001,TO_CLOB('<p>오늘은 날씨가 맑네요</p>'),TIMESTAMP'2022-05-23 12:53:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('77','5',2022052001,TO_CLOB('<p>번개가 안와서 아쉬워요</p>'),TIMESTAMP'2022-05-23 12:54:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('78','5',2022052001,TO_CLOB('<p>ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ</p>'),TIMESTAMP'2022-05-23 12:55:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('79','5',2022052001,TO_CLOB('<p>그치만 언젠가 번개가 오겠죠</p>'),TIMESTAMP'2022-05-23 12:56:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('80','5',2022052001,TO_CLOB('<p>그렇길 바래요</p>'),TIMESTAMP'2022-05-23 12:57:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('81','5',2022052001,TO_CLOB('<p>너무 기다리진 마세요</p>'),TIMESTAMP'2022-05-23 12:58:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('82','5',2022052001,TO_CLOB('<p>언제든지 내릴 번개이니까요</p>'),TIMESTAMP'2022-05-23 12:59:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('83','6',2022053000,TO_CLOB('<p>반가워요 여기는 천둥 채팅방입니다.</p>'),TIMESTAMP'2022-05-23 13:00:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('84','6',2022053000,TO_CLOB('<p>오늘은 날씨가 맑네요</p>'),TIMESTAMP'2022-05-23 13:01:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('85','6',2022053000,TO_CLOB('<p>천둥이 안와서 아쉬워요</p>'),TIMESTAMP'2022-05-23 13:02:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('86','6',2022053000,TO_CLOB('<p>ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ</p>'),TIMESTAMP'2022-05-23 13:03:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('87','6',2022053000,TO_CLOB('<p>그치만 언젠가 천둥이 오겠죠</p>'),TIMESTAMP'2022-05-23 13:04:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('88','6',2022053000,TO_CLOB('<p>그렇길 바래요</p>'),TIMESTAMP'2022-05-23 13:05:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('89','6',2022053000,TO_CLOB('<p>너무 기다리진 마세요</p>'),TIMESTAMP'2022-05-23 13:06:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('90','6',2022053000,TO_CLOB('<p>언제든지 내릴 천둥이니까요</p>'),TIMESTAMP'2022-05-23 13:07:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('91','7',2022053200,TO_CLOB('<p>반가워요 여기는 카카오톡 채팅방입니다.</p>'),TIMESTAMP'2022-05-23 13:08:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('92','7',2022053200,TO_CLOB('<p>오늘은 날씨가 맑네요</p>'),TIMESTAMP'2022-05-23 13:09:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('93','7',2022053200,TO_CLOB('<p>카카오톡이 안와서 아쉬워요</p>'),TIMESTAMP'2022-05-23 13:10:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('94','7',2022053200,TO_CLOB('<p>ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ</p>'),TIMESTAMP'2022-05-23 13:11:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('95','7',2022053200,TO_CLOB('<p>그치만 언젠가 카카오톡이 오겠죠</p>'),TIMESTAMP'2022-05-23 13:12:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('96','7',2022053200,TO_CLOB('<p>그렇길 바래요</p>'),TIMESTAMP'2022-05-23 13:13:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('97','7',2022053200,TO_CLOB('<p>너무 기다리진 마세요</p>'),TIMESTAMP'2022-05-23 13:14:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('98','7',2022053200,TO_CLOB('<p>언제든지 내릴 카카오톡이니까요</p>'),TIMESTAMP'2022-05-23 13:15:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('99','13',2022052202,TO_CLOB('<p>울산 가고 싶다</p>'),TIMESTAMP'2022-05-23 13:16:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('100','13',2022052800,TO_CLOB('<p>울산 언제 오노</p>'),TIMESTAMP'2022-05-23 13:17:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('101','13',2022052202,TO_CLOB('<p>모른다</p>'),TIMESTAMP'2022-05-23 13:18:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('102','13',2022052202,TO_CLOB('<p>요즘 뭐하노</p>'),TIMESTAMP'2022-05-23 13:19:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('103','13',2022052800,TO_CLOB('<p>바쁘다</p>'),TIMESTAMP'2022-05-23 13:20:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('104','13',2022052202,TO_CLOB('<p>ㅋㅋㅋ 뺑이 쳐라</p>'),TIMESTAMP'2022-05-23 13:21:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('105','10',2022053800,TO_CLOB('<p>뭐하십니까</p>'),TIMESTAMP'2022-05-23 13:22:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('106','13',2022052202,TO_CLOB('<p>ㅋㅋ</p>'),TIMESTAMP'2022-05-23 13:23:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('143','15',2022053200,TO_CLOB('<b>뭐함?ㅋㅋ</b>'),TIMESTAMP'2022-05-23 14:00:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('144','15',2022053200,TO_CLOB('<b>나오실?</b>'),TIMESTAMP'2022-05-23 14:01:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('145','15',2022053200,TO_CLOB('<b>시름 ㅋㅋ</b>'),TIMESTAMP'2022-05-23 14:02:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('146','15',2022053200,TO_CLOB('<b>ㅇㅋㅇㅋ</b>'),TIMESTAMP'2022-05-23 14:03:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('147','16',2022052202,TO_CLOB('<b>ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ</b>'),TIMESTAMP'2022-05-23 14:04:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('148','16',2022052202,TO_CLOB('<b>ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ</b>'),TIMESTAMP'2022-05-23 14:05:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('149','16',2022053400,TO_CLOB('<b>?</b>'),TIMESTAMP'2022-05-23 14:06:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('150','16',2022053400,TO_CLOB('<b>뭐고</b>'),TIMESTAMP'2022-05-23 14:07:00','T');
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) VALUES ('151','16',2022053400,TO_CLOB('<b>아픔?</b>'),TIMESTAMP'2022-05-23 14:08:00','T');

INSERT INTO CHAT_ROOM (ROOM_ID,ROOM_NAME,ROOM_MEM) VALUES ('1','구름',TO_CLOB('{ROOM : [{id:2022052001,join:20220523111300},{id:2022052202,join:20220523111300},{id:2022053800,join:20220523111300}]}'));
INSERT INTO CHAT_ROOM (ROOM_ID,ROOM_NAME,ROOM_MEM) VALUES ('2','비',TO_CLOB('{ROOM : [{id:2022052001,join:20220523111300},{id:2022052403,join:20220523111300},{id:2022053800,join:20220523111300}]}'));
INSERT INTO CHAT_ROOM (ROOM_ID,ROOM_NAME,ROOM_MEM) VALUES ('3','바람',TO_CLOB('{ROOM : [{id:2022052001,join:20220523111300},{id:2022052403,join:20220523111300},{id:2022053800,join:20220523111300}]}'));
INSERT INTO CHAT_ROOM (ROOM_ID,ROOM_NAME,ROOM_MEM) VALUES ('4','돌풍',TO_CLOB('{ROOM : [{id:2022052001,join:20220523111300},{id:2022052604,join:20220523111300}]}'));
INSERT INTO CHAT_ROOM (ROOM_ID,ROOM_NAME,ROOM_MEM) VALUES ('5','번개',TO_CLOB('{ROOM : [{id:2022052001,join:20220523111300},{id:2022052800,join:20220523111300}]}'));
INSERT INTO CHAT_ROOM (ROOM_ID,ROOM_NAME,ROOM_MEM) VALUES ('6','천둥',TO_CLOB('{ROOM : [{id:2022052001,join:20220523111300},{id:2022053000,join:20220523111300}]}'));
INSERT INTO CHAT_ROOM (ROOM_ID,ROOM_NAME,ROOM_MEM) VALUES ('7','카카오톡',TO_CLOB('{ROOM : [{id:2022052001,join:20220523111300},{id:2022053200,join:20220523111300}]}'));
INSERT INTO CHAT_ROOM (ROOM_ID,ROOM_NAME,ROOM_MEM) VALUES ('8','라인',TO_CLOB('{ROOM : [{id:2022052001,join:20220523111300},{id:2022053400,join:20220523111300}]}'));
INSERT INTO CHAT_ROOM (ROOM_ID,ROOM_NAME,ROOM_MEM) VALUES ('9','트위터',TO_CLOB('{ROOM : [{id:2022052001,join:20220523111300},{id:2022053600,join:20220523111300}]}'));
INSERT INTO CHAT_ROOM (ROOM_ID,ROOM_NAME,ROOM_MEM) VALUES ('10','페이스북',TO_CLOB('{ROOM : [{id:2022052001,join:20220523111300},{id:2022053800,join:20220523111300}]}'));
INSERT INTO CHAT_ROOM (ROOM_ID,ROOM_NAME,ROOM_MEM) VALUES ('11','네이버',TO_CLOB('{ROOM : [{id:2022052202,join:20220523111300},{id:2022052403,join:20220523111300}]}'));
INSERT INTO CHAT_ROOM (ROOM_ID,ROOM_NAME,ROOM_MEM) VALUES ('12','다음',TO_CLOB('{ROOM : [{id:2022052202,join:20220523111300},{id:2022052604,join:20220523111300}]}'));
INSERT INTO CHAT_ROOM (ROOM_ID,ROOM_NAME,ROOM_MEM) VALUES ('13','울산',TO_CLOB('{ROOM : [{id:2022052202,join:20220523111300},{id:2022052800,join:20220523111300}]}'));
INSERT INTO CHAT_ROOM (ROOM_ID,ROOM_NAME,ROOM_MEM) VALUES ('14','대구',TO_CLOB('{ROOM : [{id:2022052202,join:20220523111300},{id:2022053000,join:20220523111300}]}'));
INSERT INTO CHAT_ROOM (ROOM_ID,ROOM_NAME,ROOM_MEM) VALUES ('15','부산',TO_CLOB('{ROOM : [{id:2022052202,join:20220523111300},{id:2022053200,join:20220523111300}]}'));
INSERT INTO CHAT_ROOM (ROOM_ID,ROOM_NAME,ROOM_MEM) VALUES ('16','서울',TO_CLOB('{ROOM : [{id:2022052202,join:20220523111300},{id:2022053400,join:20220523111300}]}'));
INSERT INTO CHAT_ROOM (ROOM_ID,ROOM_NAME,ROOM_MEM) VALUES ('17','구로구',TO_CLOB('{ROOM : [{id:2022052403,join:20220523111300},{id:2022052604,join:20220523111300}]}'));
INSERT INTO CHAT_ROOM (ROOM_ID,ROOM_NAME,ROOM_MEM) VALUES ('18','금천구',TO_CLOB('{ROOM : [{id:2022052403,join:20220523111300},{id:2022052800,join:20220523111300}]}'));
INSERT INTO CHAT_ROOM (ROOM_ID,ROOM_NAME,ROOM_MEM) VALUES ('19','구로구',TO_CLOB('{ROOM : [{id:2022052403,join:20220523111300},{id:2022053000,join:20220523111300}]}'));
INSERT INTO CHAT_ROOM (ROOM_ID,ROOM_NAME,ROOM_MEM) VALUES ('20','신림동',TO_CLOB('{ROOM : [{id:2022052403,join:20220523111300},{id:2022053200,join:20220523111300}]}'));
INSERT INTO CHAT_ROOM (ROOM_ID,ROOM_NAME,ROOM_MEM) VALUES ('21','가산동',TO_CLOB('{ROOM : [{id:2022052403,join:20220523111300},{id:2022053400,join:20220523111300}]}'));
INSERT INTO CHAT_ROOM (ROOM_ID,ROOM_NAME,ROOM_MEM) VALUES ('22','천호동',TO_CLOB('{ROOM : [{id:2022052403,join:20220523111300},{id:2022053600,join:20220523111300}]}'));
INSERT INTO CHAT_ROOM (ROOM_ID,ROOM_NAME,ROOM_MEM) VALUES ('23','개포동',TO_CLOB('{ROOM : [{id:2022052403,join:20220523111300},{id:2022053800,join:20220523111300}]}'));
INSERT INTO CHAT_ROOM (ROOM_ID,ROOM_NAME,ROOM_MEM) VALUES ('24','한강',TO_CLOB('{ROOM : [{id:2022052403,join:20220523111300},{id:2022054000,join:20220523111300}]}'));
INSERT INTO CHAT_ROOM (ROOM_ID,ROOM_NAME,ROOM_MEM) VALUES ('25','미아동',TO_CLOB('{ROOM : [{id:2022052604,join:20220523111300},{id:2022052800,join:20220523111300}]}'));
INSERT INTO CHAT_ROOM (ROOM_ID,ROOM_NAME,ROOM_MEM) VALUES ('26','수유동',TO_CLOB('{ROOM : [{id:2022052604,join:20220523111300},{id:2022052800,join:20220523111300}]}'));
INSERT INTO CHAT_ROOM (ROOM_ID,ROOM_NAME,ROOM_MEM) VALUES ('27','등촌동',TO_CLOB('{ROOM : [{id:2022052604,join:20220523111300},{id:2022053000,join:20220523111300}]}'));
INSERT INTO CHAT_ROOM (ROOM_ID,ROOM_NAME,ROOM_MEM) VALUES ('28','개화동',TO_CLOB('{ROOM : [{id:2022052604,join:20220523111300},{id:2022053200,join:20220523111300}]}'));
INSERT INTO CHAT_ROOM (ROOM_ID,ROOM_NAME,ROOM_MEM) VALUES ('29','가리봉동',TO_CLOB('{ROOM : [{id:2022052604,join:20220523111300},{id:2022053400,join:20220523111300}]}'));
INSERT INTO CHAT_ROOM (ROOM_ID,ROOM_NAME,ROOM_MEM) VALUES ('30','석촌호수',TO_CLOB('{ROOM : [{id:2022052604,join:20220523111300},{id:2022053600,join:20220523111300}]}'));
INSERT INTO CHAT_ROOM (ROOM_ID,ROOM_NAME,ROOM_MEM) VALUES ('31','아현동',TO_CLOB('{ROOM : [{id:2022052604,join:20220523111300},{id:2022053800,join:20220523111300}]}'));
INSERT INTO CHAT_ROOM (ROOM_ID,ROOM_NAME,ROOM_MEM) VALUES ('32','홍대',TO_CLOB('{ROOM : [{id:2022052604,join:20220523111300},{id:2022054000,join:20220523111300}]}'));
INSERT INTO CHAT_ROOM (ROOM_ID,ROOM_NAME,ROOM_MEM) VALUES ('33','건대',TO_CLOB('{ROOM : [{id:2022052800,join:20220523111300},{id:2022053000,join:20220523111300}]}'));
INSERT INTO CHAT_ROOM (ROOM_ID,ROOM_NAME,ROOM_MEM) VALUES ('34','인사동',TO_CLOB('{ROOM : [{id:2022052800,join:20220523111300},{id:2022053200,join:20220523111300}]}'));
INSERT INTO CHAT_ROOM (ROOM_ID,ROOM_NAME,ROOM_MEM) VALUES ('35','수출의다리',TO_CLOB('{ROOM : [{id:2022052800,join:20220523111300},{id:2022053400,join:20220523111300}]}'));
INSERT INTO CHAT_ROOM (ROOM_ID,ROOM_NAME,ROOM_MEM) VALUES ('36','대륭포스트3차',TO_CLOB('{ROOM : [{id:2022052800,join:20220523111300},{id:2022053600,join:20220523111300}]}'));
INSERT INTO CHAT_ROOM (ROOM_ID,ROOM_NAME,ROOM_MEM) VALUES ('37','바른식탁',TO_CLOB('{ROOM : [{id:2022052800,join:20220523111300},{id:2022053800,join:20220523111300}]}'));
INSERT INTO CHAT_ROOM (ROOM_ID,ROOM_NAME,ROOM_MEM) VALUES ('38','강남',TO_CLOB('{ROOM : [{id:2022052800,join:20220523111300},{id:2022054000,join:20220523111300}]}'));
INSERT INTO CHAT_ROOM (ROOM_ID,ROOM_NAME,ROOM_MEM) VALUES ('39','동작',TO_CLOB('{ROOM : [{id:2022053000,join:20220523111300},{id:2022053200,join:20220523111300}]}'));
INSERT INTO CHAT_ROOM (ROOM_ID,ROOM_NAME,ROOM_MEM) VALUES ('40','마포',TO_CLOB('{ROOM : [{id:2022053000,join:20220523111300},{id:2022053400,join:20220523111300}]}'));
INSERT INTO CHAT_ROOM (ROOM_ID,ROOM_NAME,ROOM_MEM) VALUES ('41','서대문',TO_CLOB('{ROOM : [{id:2022053000,join:20220523111300},{id:2022053600,join:20220523111300}]}'));
INSERT INTO CHAT_ROOM (ROOM_ID,ROOM_NAME,ROOM_MEM) VALUES ('42','신촌',TO_CLOB('{ROOM : [{id:2022053000,join:20220523111300},{id:2022053800,join:20220523111300}]}'));
INSERT INTO CHAT_ROOM (ROOM_ID,ROOM_NAME,ROOM_MEM) VALUES ('43','시흥동',TO_CLOB('{ROOM : [{id:2022053000,join:20220523111300},{id:2022054000,join:20220523111300}]}'));
INSERT INTO CHAT_ROOM (ROOM_ID,ROOM_NAME,ROOM_MEM) VALUES ('44','독산대로',TO_CLOB('{ROOM : [{id:2022053200,join:20220523111300},{id:2022053400,join:20220523111300}]}'));
INSERT INTO CHAT_ROOM (ROOM_ID,ROOM_NAME,ROOM_MEM) VALUES ('45','보라매',TO_CLOB('{ROOM : [{id:2022053200,join:20220523111300},{id:2022053600,join:20220523111300}]}'));
INSERT INTO CHAT_ROOM (ROOM_ID,ROOM_NAME,ROOM_MEM) VALUES ('46','보라매공원',TO_CLOB('{ROOM : [{id:2022053200,join:20220523111300},{id:2022053800,join:20220523111300}]}'));
INSERT INTO CHAT_ROOM (ROOM_ID,ROOM_NAME,ROOM_MEM) VALUES ('47','노량진',TO_CLOB('{ROOM : [{id:2022053200,join:20220523111300},{id:2022054000,join:20220523111300}]}'));
INSERT INTO CHAT_ROOM (ROOM_ID,ROOM_NAME,ROOM_MEM) VALUES ('48','목동',TO_CLOB('{ROOM : [{id:2022053400,join:20220523111300},{id:2022053600,join:20220523111300}]}'));
INSERT INTO CHAT_ROOM (ROOM_ID,ROOM_NAME,ROOM_MEM) VALUES ('49','양화대교',TO_CLOB('{ROOM : [{id:2022053400,join:20220523111300},{id:2022053800,join:20220523111300}]}'));
INSERT INTO CHAT_ROOM (ROOM_ID,ROOM_NAME,ROOM_MEM) VALUES ('50','올림픽대로',TO_CLOB('{ROOM : [{id:2022053400,join:20220523111300},{id:2022054000,join:20220523111300}]}'));

INSERT INTO CHAT_FILE (FILE_CHAT_ID,FILE_CHAT_UUID,FILE_CHAT_ORIGINNM,FILE_CHAT_TYPE,FILE_UPLOADPATH,CHAT_ID) VALUES ('1','image0001','7676367_social_icon_dock_icon','png','C:\goodee\spring_workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Chatting\storage\chatFile\05\23','152');
INSERT INTO CHAT_FILE (FILE_CHAT_ID,FILE_CHAT_UUID,FILE_CHAT_ORIGINNM,FILE_CHAT_TYPE,FILE_UPLOADPATH,CHAT_ID) VALUES ('2','image0002','646197_cancel_close_cross_delete_remove_icon','png','C:\goodee\spring_workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Chatting\storage\chatFile\05\23','153');
INSERT INTO CHAT_FILE (FILE_CHAT_ID,FILE_CHAT_UUID,FILE_CHAT_ORIGINNM,FILE_CHAT_TYPE,FILE_UPLOADPATH,CHAT_ID) VALUES ('3','image0003','2672738_jpg_format_app_object_file_icon','png','C:\goodee\spring_workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Chatting\storage\chatFile\05\23','154');
INSERT INTO CHAT_FILE (FILE_CHAT_ID,FILE_CHAT_UUID,FILE_CHAT_ORIGINNM,FILE_CHAT_TYPE,FILE_UPLOADPATH,CHAT_ID) VALUES ('4','image0004','3377025_android_logo_media_social_icon','png','C:\goodee\spring_workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Chatting\storage\chatFile\05\23','155');
INSERT INTO CHAT_FILE (FILE_CHAT_ID,FILE_CHAT_UUID,FILE_CHAT_ORIGINNM,FILE_CHAT_TYPE,FILE_UPLOADPATH,CHAT_ID) VALUES ('5','image0005','2913107_barbarian_beard_fantasy_helmet_man_icon','png','C:\goodee\spring_workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Chatting\storage\chatFile\05\23','156');