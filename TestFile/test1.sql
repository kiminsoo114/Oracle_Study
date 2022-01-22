-- 2022-01-03 오라클 1일차 
/*
     최근 유행 => 한개 (X) , 여러개 (O)
                        맛집 
                        -----
                        맛집 , 여행 , 레시피 (코스)
                        ------------     |
                                         코로나 
                        영화 => 예매 
                        -----
                        영화 , 음악 => 구매 
                        예)
                              게임 : 보드게임 
                                       보드게임 + RPG
     1. 데이터베이스의 개념 특징 (26page)
        =========
           ***관련된(독립적) 데이터를 모아서 통합하고 서로 공유할 목적으로 만든 데이터 저장소  
                                   ------------------------      -------------------
             예) 
                음악 
                영화 
               ==== 영화 + OST 
                맛집 
                레시피 
               ===== 맛집+레시피
            ***1) 통합된 데이터 (통합 => 한곳에 저장 => XE) 
                자바=>오라클 연결 : jdbc:oracle:thin:@IP:1521:XE(데이터가 저장된 장소) 
            2) 저장된 데이터 (문서 보관,컴퓨터에 저장 장치) 
            ***3) 공유된 데이터 (모든 사용자가 동시에 같은 데이터를 사용)
                게시판 , 댓글 , 영화 목록 , 영화 상세보기 ...(공유)
                회원정보 , 마이페이지 , 예매(예약) ...(보안) ==> 개인적 , 관리자
                ========== 자바 (static)
     2. 데이터베이스 시스템의 구성 (27page)
        ***DBMS : 데이터를 관리하는 SW 시스템으로 컴퓨터 기억장소에 상주하면서 
                   사용자와 데이터를 연결 (오라클 , MS-SQL , DB2 , MySQL,MariaDB,SQLite)
        ***데이터베이스 : 실제 데이터가 저장된 장소 (강제로 삭제하지 않는 이상 지워지지 않는다)
            ERWIN => vuered
        ***데이터 모델 : 데이터를 저장한 기법 => 테이블 설계
                          CREATE TABLE => 기능별 분리 .... (테이블 == 파일)
                          =========== 데이터별로 구분 
                          예) Table => row/column => 2차원 구조 
                               파일 
                                 hong|홍길동|남자
                                 shim|심청이|여자
                                 park|박문수|남자
                               ***데이터 모델 (구분 , 데이터형)
                               오라클 
                                 문자 (CHAR , VARCHAR2,CLOB) -> String
                                 숫자 (NUMBER)  -> int , double
                                 날짜 (DATE , TIMESTAMP) -> Date
                                 기타 (BLOB , BFILE) -> InputStream
                          ======================= column
                            ID         Name        SEX   ==> 클래스의 멤버변수
                          =======================
                           hong      홍길동       남자   ==> 클래스 객체
                                                                 ==> ROW / 튜플
                          =======================
                           shim      심청이        여자   ==> 클래스 객체
                                                                 ==> ROW / 튜플
                          =======================
                           park       박문수       남자   ==> 클래스 객체
                                                                 ==> ROW / 튜플
                          =======================
                          도메인

                          bit (0/1) 한개 저장 공간 
                          byte => bit (8개)  ===========> 한글자 
                          word => 여러개 문자 저장   =====> 여러 글자
                          record => word여러개 모운다   ===> 문장 
                          table => record여러개 모운다   ===> 단락(파일)
                          ------- database  => table 여러개  => 폴더 

                         응용프로그램머  일반 사용자    관리자 
                                 |                  |                |
                               ===================
                                     *** DBMS(오라클) => 언어 (SQL)
                               ===================
                                                |
                                      ===========
                                          데이터베이스 (기억장소)
                                      ===========
                
        메모리 => 파일 => RDBMS   
        --------     ----- IO  --------- 오라클 
           변수/배열/클래스             
     3. 파일 시스템 / 데이터베이스 시스템 
               데이터를 저장한 후에 관리 , 제어 
               => 파일 시스템  ==> 프로그램 언어로 제어 (자바) ==> IO
                    => 독립적으로 파일을 다루기 때문에 데이터가 중복이 있는 경우도 존재
                    => 파일을 연결해서 사용하기 어렵다 (JOIN)
                    => 데이터의 일괄성이 훼손가능성도 있다 
                    => 동시에 파일 제어가 어렵다 
                    => 노출될 가능성도 있다 (보안에 취약)
              => 데이터베이스 시스템 (파일 시스템의 단점 보완)
                   => 웹 데이터베이스 시스템을 사용  
     4. 데이터베이스 시스템이란> (45page)
                         응용프로그램머  일반 사용자    관리자 
                                 |                  |                |
                               ===================
                                      DBMS(오라클)
                               ===================
                                                |
                                      ===========
                                          데이터베이스 (기억장소)
                                      ===========
           *** 데이터베이스에 사용 언어 (SQL) => 구조화된 질의 언어(검색)
                SQL 
                  = DQL : 데이터 질의 언어 (검색) => SELECT
                               => 1. 형식
                                    2. 연산자 
                                    3. 내장 함수 
                                    4. 테이블과 테이블 연결 => JOIN,SubQuery
                  = DML : 데이터 조작언어 (수정,삭제,추가) => UPDATE , DELETE , INSERT
                  = DDL : 데이터 정의 언어 
                              = Table : 데이터 저장(기본)
                              = View : 가상 테이블(보안, SQL문장을 간결하게) => 재사용 
                              = Sequence : 중복없는 데이터 => 자동 증가번호 
                                                 ===========
                                                   이상현상 : 원하는 데이터가 수정,삭제
                                                                 방지하기 방법 => 기본키 
                              = Index : 찾기 (쉽게) ==> 정렬 (속도 최적화)
                              = Function : 함수 => 재사용이 많은 경우 
                              = Procedure : 기능 => 메소드 ***
                              = Trigger : 자동 처리 
                                 입고  ======>
                                                         재고
                                 출고  ======>
                              =====================================
                               DDL 명령어
                               1) CREATE : 생성 
                               2) ALTER : 수정 
                               3) DROP : 삭제 
                               4) RENAME : 이름 변경
                               5) TRUCATE : 데이터만 잘라내기 
                  = DCL : 데이터 제어 언어 (DBA)
                              GRANT  : 권한 부여
                              REVOKE : 권한 해제 
                  = TCL : 일괄 처리 (트램잭션언어) 
                             COMMIT => 정상수행 => 정상적으로 저장 
                             ROLLBACK => 명령어 취소 
               데이터베이스 사용자 
                 = 일반 사용자 
                 = 응용프로그래머 (DML,DQL,TCL) => 웹프로그래머 
                 = DBA : DDL , DCL
    ======================= 개념 설명 (Chapter 1장 : 개념)
    ======================= 용어 설명 (Chapter 2장 : 용어)
         자바 : 자바프로그램 (클래스) 
                  소프트웨어 (컴포넌트) => 클래스 / 함수 (모듈화) 
     5. 릴레이션의 개념 (테이블) (69page) 
         ---------(데이터베이스 용어)
             1. 테이블 
             2. 구성요소 (ROW, COLUMN=>속성 , 구분자 => 클래스의 멤버 변수 )
                              ====
                               실제 데이터 값을 가지고 있다 => 객체 
                               column => class에 멤버 변수 선언 
                               row 1개(한줄) => 객체 ==> 한명 , 한개의 정보를 가지고 있다 
             예)
                  사원 1  1 , 홍길동 , 개발부 , 3500 
                  사원 2  2 , 박문수 , 기획부 , 4500 
                  사원 3  3 , 심청이 , 자재부 , 5500  
                           릴레이션 , 테이블 
                          ==========================
                             사번        이름      부서      연봉  ==> column(속성)
                          ==========================
                             1 ,         홍길동 ,  개발부 , 3500  ==> row , record , 인스턴스
                          ==========================
                             2 ,         박문수 , 기획부 , 4500 
                          ==========================
                             3 ,        심청이 , 자재부 , 5500 
                          ==========================
                 릴레이션의 특징 
                 ------------------
                     1. 속성은 단일값을 가진다  => 속성 1개에 값이 한개만 들어간다 
                     2. 속성은 서로 다른 이름을 가지고 있다 
                     3. 속성에는 순서가 없다 
                     4. 투플(ROW)에는 순서가 없다 
                     =====================
                      데이터를 추가할때 순서되로 추가하지 않는다 
                      => 빈메모리 공간이 생기면 => 순서가 바뀐다 
                      => 데이터를 가지고 올때는 정렬해서 가지고 온다 
     6. 릴레이션의 구성요소 (71page)
         릴레이션 , 테이블 
                          ==========================
                             사번        이름      부서      연봉  ==> column(속성)
                          ==========================
                             1 ,         홍길동 ,  개발부 , 3500  ==> row , record , 인스턴스
                          ==========================
                             2 ,         박문수 , 기획부 , 4500 
                          ==========================
                             3 ,        심청이 , 자재부 , 5500 
                          ==========================
     7. 릴레이션의 특징 (74page)
                릴레이션의 특징 
                 ------------------
                     ***1. 속성은 단일값을 가진다  => 속성 1개에 값이 한개만 들어간다 
                     ***2. 속성은 서로 다른 이름을 가지고 있다 
                     ***3. 속성에는 순서가 없다 
                     ***4. 투플(ROW)에는 순서가 없다 
                     =====================
                      ***데이터를 추가할때 순서되로 추가하지 않는다 
                      => 빈메모리 공간이 생기면 => 순서가 바뀐다 
                      => 데이터를 가지고 올때는 정렬해서 가지고 온다 
     8. 키의 종류 (무결성 제약조건) (76page) 
          => ***무결성 제약조건 : 데이터는 결함이 없어야 한다 
                                       ***1. 수정,삭제,추가를 했을 경우에 다른 데이터에
                                           영향력이 없게 만든다
                                       ***2. 속성중에 1개 이상이 다른 데이터를 가지고 있어야 한다  
                회원 목록
                1  홍길동 남자
                2  심청이 여자 
                3  춘향이 여자 
                4  홍길동 남자 
                
                 키 ==> 한번 읽어볼 필요 (정보처리 기사 => 데이터베이스)
                  ***기본키 : 중복이 없는 키 => 게시물 번호 , 영화 번호 , ID
                             PRIMARY KEY 
                  ***대체키 : 주민 번호 , 이메일 , 전화번호 => Unique 
                  ***참조키 : 다른 테이블 데이터 연결 => Foreign key 
                ==> 홍길동 => 회원 탈퇴  => 1. 번호(회원) , 2.이름
     9. 관계대수 (셀렉션 , 프로젝션 , 합집합 , 교집합 , MINUS , 조인)
                데이터 읽기 
                ***셀렉션 : 행단위 => 전체 속성을 읽는 방법 
                ***프로젝션 : 열단위 => 원하는 속성만 읽어 온다 
                합집합 : 테이블 두개 이상에서 데이터 읽기  
                교집합 : 테이블 두개에서 같은 데이터 읽기
                차집합 : 
                ***조인 : 원하는 데이터를 다른 테이블에서 읽기 (교집합)
   ---------------------------------------------------------------------------------
           ===> 웹 프로그래머 ===> 데이터베이스 사용법
           ===> 문장 (암기) => 실제로는 상당히 애매한 과정 
                                                      ---------------
                                                       정답이 없다 (같은 내용 검색 => 수십가지가 있다)
                    !=
                    <>
                    ^=
                    NOT 
                    *** 자바 , 오라클 ==> 본인 스타일 (경우수) 
   10. 3장 ~ SQL (기본 SQL)
                 데이터베이스 (데이터를 저장하는 장소)
                 데이터 가공 : 읽기 , 쓰기 , 수정 , 삭제 => CURD)
                                   SELECT , INSERT , UPDATE , DELETE 
   11. 4장 ~ SQL (고급 SQL) : 두개이상의 테이블을 연결 (JOIN,SUBQUERY)
                => 가상 테이블 (View)
                => 자동 증가번호 (Sequence)
                => 찾기 => 최적화 (인덱스) (Index)
   12. 5장 오라클로 프로그램 제작 (변수,연산자,제어문,함수) => PL/SQL
        PL/SQL => FUNCTION , PROCEDURE , TRIGGER
   ---------------------------------------------------------------------------------
         ===> 데이터베이스 관리자 (DBA) ===> 데이터베이스 설계 
    13. 데이터베이스 설계 
    14. 정규화 (1~5)
    15. 일괄처리 => 트랜잭션 프로그램 
    16. 보안 / 백업 
   ===================== 핵심 ======================
    JDBC : 자바로 오클에 저장된 데이터를 읽어서 브라우저로 전송 
   =====> 라이브러리 (***MyBatis , Hibernate , JPA)
   ==> 브라우저 (HTML/XML) => CSS (화면 디자인) 
   ==> 자바와 연결 연결 => 데이터를 전송 (JSP)
   ==> JSP (Model1) ==> Model2(MVC) ==========> 1차 프로젝트
   ==> Spring 
   ====================================> 2차 프로젝트 
   현재 사이트 제작 (실무) 
   Spring은 서버의 역할 , 프론트 접근 
   =============    ========
    Spring-Boot              VueJS (vuex=> MVVM) , ReactJS(Redux=>MVC)
   ===============================================
    배포 : AWS (운영체제 : 우분투) => 리눅스 
*/
