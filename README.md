로그인 기능
-> 아이디 패스워드 체크 기능
-> 회원가입부터 만들어야함
-> 회원가입 할 때 입력한 정보를 DB 넣는 것부터 만들어야
-> 회원 테이블 필요

레스토랑 자체에서 이름, 전번을 받아야 함
-> 몽땅 비회원으로 하고, 사전 예약과 현장 입장으로만 나눔
이름, 전화번호, 예약 등... -> 예약번호 부여
회원 테이블이 할 말이 없음

통계는 매출이나 손님수

차별점: 데이터 암호화, 자리 선택 예매

로그인 vs 전부 비회원

!!! 이름, 전화번호로 로그인을 한다. 그걸로 예약번호 임의 생성. !!!
1. DB를 만든다. (이름, 전화번호)
2. 

일회성: 통계를

예약을 한다 -> 통계가 필요해 ->

로그인을 하면 어떤 이익? 비회원을 하면 귀찮아진다. -> 비회원을 관리할 수단, Table을 드롭하는 

예약
이름, 전화번호, 날짜, 시간, 어느 테이블?, 인원 수

만약 메뉴를 한다면? -> 메뉴에 해시태그를 단다. -> 해시태그를

예약할 때 주문을 받을지 안 받을지?
주문을 받는다고 해도 추가적인 차별성: 추천 기능

1. 로그인 기능
- 회원 DB
- 로그인 체크
2. 사전 예약
- 예약 DB????
3. 예약할 때 동시에 주문
4. 2-3 사이에 메뉴 추천 기능
5. 현장은 남는 자리 랜덤 배정

로그인 사전예약/주문 랜덤자리배정?

<body bgcolor=white>

<h2>An implementation of the booking system</h2>

This directory contains a complete implementation of the basic booking system
described in Chapters 4 to 7 of the book.  

<h4>Directory contents</h4>

<ul>

<li> <code>booksys.properties</code>: a Java property file defining the JDBC
connection information for the program.  This may have to be modified to make
it consistent with the database being used. 

<p>

<li> <code>build.xml</code>: an <a href="http://ant.apache.org">Ant</a>
makefile for the system.

<p>

<li> <code>db.sql</code>: a file containing SQL statements to build the
database tables for the implementation. 

<p>

<li> <code>src</code>: the root of the directory tree containing the Java
source code for the program.
</ul>

<h4>To run the program</h4>

<ol>

<li> Build the application.  This can be done easily using <a
href="http://ant.apache.org">Ant</a>, in which case the object files will be
placed in a <code>build/classes</code> subdirectory, or by hand, if Ant is not
available.

<p>

<li> Create database tables as defined in the <code>db.sql</code> file, and
ensure that the database is available to the program and that the DBMS is
running.

<p>

<li> Modify the <code>booksys.properties</code> file to define the connection
parameters for the database being used. Copy this file to the classes
subdirectory.  The Ant build file will do this automatically.

<p>

<li> The root class of the system is
<code>booksys.presentation.BookingSystemApp</code>.  Change to the classes
subdirectory and point the Java interpreter to this class. 

</ol>

<h4>Shortcomings</h4>

This program is intended for illustrative purposes only, and I have tried to
keep the code as simple as possible.  This is a no doubt incomplete list of
things that would need to be improved in a more professional version.

<ol>

<li> The code uses various deprecated methods from <code>java.util.Date</code>
and <code>java.sql.Time</code> as they seemed to offer the most straightforward
way of accomplishing certain tasks.  Apologies to any Java purists who may be
offended by this!

<p>

<li> The validation of data entered by the user is extremely rudimentary.  In
particular:

<p>

<ul>
<li> Dates must be entered in the format `<tt>YYYY-MM-DD</tt>'.
<p>
<li> Times must be entered in the format `<tt>HH:MM:SS</tt>'.
<p>
<li> If a booking is created for a time not shown on the display, there will be
no warning of this fact.  The booking will be silently created, but not
displayed, which can be slightly disconcerting.
</ul>


</ol>
