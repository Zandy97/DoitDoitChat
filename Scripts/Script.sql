-- 방 조회
SELECT ch.ROOM_ID, ROOM_NAME, CHAT_TIME, CHAT_ID, CHAT_TYPE ,EMP_ID,CHAT_CON
    		FROM CHAT_ROOM cr,
	        	JSON_TABLE(ROOM_MEM, '$.ROOM[*]'
	            	COLUMNS (
	                	IDS VARCHAR(20) PATH '$.id'
	            	)
	        	) AS jt,
	        	(SELECT ROOM_ID, EMP_ID ,CHAT_ID ,
	        			CHAT_TIME , CHAT_TYPE, CHAT_CON,
	                    ROW_NUMBER () OVER(PARTITION BY ROOM_ID ORDER BY CHAT_TIME DESC) AS mx
	            	FROM CHAT
	        	) ch
    		WHERE IDS = '5'
    		AND cr.ROOM_ID = ch.ROOM_ID
    		AND mx = 1
    		ORDER BY CHAT_ID

-- 채팅방 멤버 조회
SELECT jt.IDS AS EMP_ID
	FROM CHAT_ROOM,
	JSON_TABLE(ROOM_MEM, '$.ROOM[*]'
		COLUMNS (
		 	IDS VARCHAR(20) PATH '$.id',
		 	JDATE VARCHAR(30) PATH '$.join'
		)
	) AS jt
	WHERE ROOM_ID = '2'
	ORDER BY TO_DATE(jt.JDATE,'YYYYMMDDHH24MISS'), IDS DESC;

-- 채팅 조회
SELECT CHAT_ID, ROOM_ID, EMP_ID, CHAT_CON, CHAT_TIME 
	FROM CHAT 
	WHERE ROOM_ID = '4'  
	AND CHAT_TIME >= (
		SELECT TO_DATE(jt.JDATE,'YYYYMMDDHH24MISS')
			FROM CHAT_ROOM,
			JSON_TABLE(ROOM_MEM, '$.ROOM[*]'
				COLUMNS (
		 			IDS VARCHAR(20) PATH '$.id',
		 			JDATE VARCHAR(30) PATH '$.join'
				)
			) AS jt
			WHERE IDS = '5' AND ROOM_ID = '4'
	)
	ORDER BY TO_NUMBER(CHAT_ID);

-- 채팅 입력
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) 
    VALUES ('111','19',0,TO_CLOB('<b>21번 님이 퇴장하였습니다</b>'),SYSDATE,'T');
-- 파일 입력(CHAT)
INSERT INTO CHAT (CHAT_ID,ROOM_ID,EMP_ID,CHAT_CON,CHAT_TIME,CHAT_TYPE) 
    VALUES ('156','22',2,TO_CLOB('<img src=./storage/chatFile/05/23/image0005.png>'),SYSDATE,'F');
-- 파일 입력(CHAT_FILE)
INSERT INTO CHAT_FILE (FILE_CHAT_ID,FILE_CHAT_UUID,FILE_CHAT_ORIGINNM,FILE_CHAT_TYPE,FILE_UPLOADPATH,CHAT_ID) 
     VALUES ('5','image0001','7676367_social_icon_dock_icon',
    			'png','C:goodeespring_workspace.metadata.pluginsorg.eclipse.wst.server.core	mp0wtpwebappsChattingstoragechatFile0523'
    		,(SELECT NVL(MAX(TO_NUMBER(CHAT_ID)) , 0) + 1  FROM CHAT));

-- 채팅방 생성
INSERT INTO CHAT_ROOM (ROOM_ID, ROOM_NAME,ROOM_MEM)
	VALUES('2','비','{"ROOM" : [{"id":"2","auth":"A","join":"20220523111300"},
					            {"id":"4","auth":"M","join":"20220523111300"},
					            {"id":"11","auth":"M","join":"20220523111300"}]}');
					         
-- 파일 다운로드(originalName)
SELECT FILE_CHAT_ORIGINNM || '.' || FILE_CHAT_TYPE 
	FROM CHAT_FILE
	WHERE FILE_CHAT_ID = '1';
	

SELECT * FROM CHAT;
SELECT * FROM CHAT_ROOM cr ;
SELECT * FROM CHAT_FILE cf ;

SELECT MAX(TO_NUMBER(CHAT_ID)) 
	FROM CHAT;