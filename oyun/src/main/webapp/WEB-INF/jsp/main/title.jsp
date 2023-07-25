<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <script src="/static/js/jquery-1.9.1.min.js"></script>
    <script src="/static/js/common.js"></script>
    <script src="/static/oy-box/oy-js/OY-UI-Item.js"></script>
    <script src="/static/oy-box/oy-js/OY-UI-Grid.js"></script>
    <link rel="stylesheet" href="/static/oy-box/oy-style.css">

    <title>title</title>

    <script type="text/javascript">

        $(document).ready(function(){


            $("#loading").hide();
            // columns
            /*
                column-activeOption : ["inputField", "dateField", "checkBox"]
                inputField: 유저 입력 필드
                dateField: 기본형(조회)
                checkBox: 체크박스(컬럼형)

                all-option: ["event?"]
                readOption: [0, 1]
                textAlignOption: ["center", "left", "right"]
                columnTextAlignOption : ["center", "left", "right"]
             */
            let option = {
                column : [
                    {
                        columnName: "선택"
                        , keyId: "chk"
                        , activeOption: "checkBox"
                        , allCheckColumnOption: "all"
                    },
                    {
                        columnName: "이름"
                        , keyId: "name"
                        , activeOption: "dateField"
                        , textAlignOption : "center"
                        , columnTextAlignOption : "center"
                        , cellOption : "pointer"
                    },
                    {
                        columnName: "입사날짜"
                        , keyId: "date"
                        , activeOption: "inputField"
                        , textAlignOption : "center"
                        , columnTextAlignOption : "center"
                    },
                    {
                        columnName: "직급"
                        , keyId: "rank"
                        , activeOption: "dateField"
                        , textAlignOption : "center"
                        , columnTextAlignOption : "center"
                    },
                    {
                        columnName: "연봉"
                        , keyId: "salary"
                        , activeOption: "dateField"
                        , textAlignOption : "left"
                        , columnTextAlignOption : "center"
                    }
                ] // column option
                /*     , width: "400"
                     , height: "100"*/
                , eventAction : "functionName"
                , rowFootField : "rowFootField"
                , gridColorOption: ""
            };

            // jsonData
            let jsonData = [
                {    chk: 0
                    ,name: "김삿갓"
                    ,date: "2023-01-01"
                    ,rank: "대리"
                    ,salary: "4100"
                },
                {    chk: 0
                    ,name: "황진이"
                    ,date: "2023-02-01"
                    ,rank: "과장"
                    ,salary: "4700"
                },
                {
                    chk: 0
                    ,name: "춘향이"
                    ,date: "2023-03-01"
                    ,rank: "대리"
                    ,salary: "4200"
                },
                {
                    chk: 1
                    ,name: "홍길동"
                    ,date: "2023-04-01"
                    ,rank: "차장"
                    ,salary: "5500"
                }
            ];

            OYGrid.create("myOYGrid", option, jsonData);

            // jsonData2
            let jsonData2 = [
                {    chk: 1
                    ,name: "근무자"
                    ,date: "2023-01-01"
                    ,rank: "파트장"
                    ,salary: "4100"
                },
                {    chk: 1
                    ,name: "근로자"
                    ,date: "2023-02-01"
                    ,rank: "계장"
                    ,salary: "4700"
                },
                {
                    chk: 1
                    ,name: "노동자"
                    ,date: "2023-03-01"
                    ,rank: "관리자"
                    ,salary: "4200"
                },
                {
                    chk: 1
                    ,name: "노역자"
                    ,date: "2023-04-01"
                    ,rank: "일쟁이"
                    ,salary: "5500"
                }
            ];

            OYGrid.create("myOYGrid2", option, jsonData2);

            // jsonData3
            let jsonData3 = [
                {    chk: 0
                    ,name: "강아지"
                    ,date: "2023-01-01"
                    ,rank: "2살"
                    ,salary: "4100"
                },
                {    chk: 0
                    ,name: "고양이"
                    ,date: "2023-02-01"
                    ,rank: "1살"
                    ,salary: "4700"
                },
                {
                    chk: 0
                    ,name: "캥거루"
                    ,date: "2023-03-01"
                    ,rank: "10살"
                    ,salary: "4200"
                },
                {
                    chk: 0
                    ,name: "물개"
                    ,date: "2023-04-01"
                    ,rank: "400살"
                    ,salary: "5500"
                }
            ];

            OYGrid.create("myOYGrid3", option, jsonData3);


            OYGrid.create("myOYGrid4", option, jsonData);

            // addActionEvent [ "cellClick", "", "" ]
            OYGrid.addActionEvent("myOYGrid", "cellClick", function(e){
                let obj = e.target;
                let eventJson = {
                    rowIndex : obj.dataset.index
                    , rowKey : obj.dataset.rowkey
                    , value : obj.innerHTML
                };

                if(eventJson.value == "김삿갓"){
                    let content = "";
                    content += "row Index : [" + eventJson.rowIndex;
                    content += "] row Key : [" + eventJson.rowKey;
                    content += "] row value : " + eventJson.value;
                    alert("누른 CELL => " + content);
                }

            });
        });


        function fn_pop(){
            window.open("/main/titlePopup","회원가입", "width=480px, height=650px")
        }

        function fn_save(){

            if(!confirm("저장 할겨?")){
                return;
            }

            $("#loading").show();
            setTimeout(function() {
                $("#loading").hide();
            }, 5000);

        }

        function fn_logout(){

            let jsonData = {
                 email : "123"
                ,name : "321"
                ,password : "421"
            };

            ajaxPostCall("/main/logout", jsonData, function(data){
                alert("로그아웃 !");
            });
        }

        function fn_admin(){
            location.href = "/admin/option";
        }

        function fn_saveInfo(){

            $("#loading").show();
            let password = $OY_VAL.value("password");
            let passwordChk =  $OY_VAL.value("passwordChk");

            if(!$OY_VAL.compare(password, passwordChk)){
                alert("입력한 비밀번호가 서로 다릅니다. ");
                $("#loading").hide();
                return;
            }

            let serverUrl = "/main/?";
            let jsonData = {
                  email : $OY_VAL.value("email")
                , name : $OY_VAL.value("name")
                , phoneNumber : $OY_VAL.value("phoneNumber")
                , password : $OY_VAL.value("password")
            };

            setTimeout(function() {
                $("#loading").hide();
                alert("정상 처리 되었습니다.");
                return ;
            }, 5000);

            /*ajaxPostCall("serverUrl", jsonData, function(data){
               console.log(data);
            });*/

        }

        function pageClick(clickPage){

            let jsonData = {
                clickPage : clickPage
            };

            ajaxGetCall("/main/dataReq", jsonData
                , function(data){

                    if(data.frontResult > 0){
                        $("#paging").empty();
                        let html = "";

                        html += '<button class="btn gray" id="fir" name="btn" value="'+data.paging.firstPage+'" onclick="pageClick('+data.paging.firstPage+')">'+ '<<' + '</button>';
                        html += '<button class="btn gray" id="prev" name="btn" value="'+data.paging.prevPage+'" onclick="pageClick('+data.paging.prevPage+')">'+ '<' + '</button>';
                        for(let i = 0; i < data.paging.blockPage.length; i++){
                            if(clickPage == data.paging.blockPage[i].page){
                                html += '<button class="btn cherryBlossom" font-weight: bold;" name="btn" value="'+data.paging.blockPage[i].page+'" onclick="pageClick('+data.paging.blockPage[i].page+')">'+ data.paging.blockPage[i].page + '</button>';
                            } else {
                                html += '<button class="btn gray" name="btn" value="'+data.paging.blockPage[i].page+'" onclick="pageClick('+data.paging.blockPage[i].page+')">'+ data.paging.blockPage[i].page + '</button>';
                            }
                        }
                        html += '<button class="btn gray" id="next" name="btn" value="'+data.paging.nextPage+'" onclick="pageClick('+data.paging.nextPage+')">'+ '>' + '</button>';
                        html += '<button class="btn gray" id="last" name="btn" value="'+data.paging.lastPage+'" onclick="pageClick('+data.paging.lastPage+')">'+ '>>' + '</button>';
                        $("#paging").html(html);
                    } else {
                        alert(data.msg);
                        return;
                    }

                }
            );
        }

    </script>
</head>
<body>

   <header class="OY_UI_menu_title">
       <h1>OY-G(IT-Enterprise)</h1>
       <nav class="OY_UI_menu_nav">
           <div class="OY_UI_ItemHeader" id="wrapper">
               <nav class="OY_UI_ItemHeader_nav" id="nav">
                   <ul>
                       <li>회사소개</li>
                       <li>투자정보</li>
                       <li>경영/채용</li>
                       <li>미디어센터</li>
                       <li>고객센터</li>
                   </ul>
                   <div class="OY_UI_ItemHeader_line" id="line"></div>
               </nav>
           </div>
       </nav>
   </header>
   <br />
   <br />
   <br />
   <br />
    <div class="OY_UI_Loding_Mask" id="loading">
        <img src="/static/oy-box/oy-images/loding.gif" style="margin-top: 400px;">
        <br />
        <label class="OY_UI_blink">저장중</label>
    </div>

   <div class="OY_UI_ItemContent" id="contents">
       <div class="OY_UI_ItemList" id="contents__list">
           <div class="OY_UI_Item">
               <div class="OY_UI_Container">
                   <div class="OY_UI_Container two parts">
                       <div class="OY_UI_Container two parts left">
                           <ul>
                               <li>OY-Games (게임 개발-운영)</li>
                               <li>OY-Solutions (IT 프로젝트 개발)</li>
                               <li>OY-Delivery (메타버스 생성-> 실물-> 결제 -> 물류 -> 배송 )</li>
                               <li>OY-SYSTEM (IT 프로젝트 유지보수)</li>
                               <li>OY-OYaverse (메타버스[Meta] 플랫폼)</li>
                           </ul>
                       </div>
                       <div class="OY_UI_Container two parts right">
                           <div class="OY_UI_Item img" style="width:auto; background-image: url('/static/img/co.jpg');"></div>
                       </div>
                   </div>
               </div>
           </div>

           <div class="OY_UI_Item">
               <div class="OY_UI_Container">
                   <div class="OY_UI_Container two parts">
                       <div class="OY_UI_Container two parts left">
                           <ul>
                               <li>한국투자증권미래에셋</li>
                               <li>미래에셋</li>
                               <li>키움증권</li>
                               <li>KB증권</li>
                               <li>우리증권</li>
                           </ul>
                       </div>
                       <div class="OY_UI_Container two parts right">
                           <div class="OY_UI_Item img" style="width:auto; background-image: url('/static/img/re.jpg');"></div>
                       </div>
                   </div>
               </div>
           </div>

           <div class="OY_UI_Item">
               <div class="OY_UI_Container">
                   <div class="OY_UI_Container two parts">
                       <div class="OY_UI_Container two parts left">
                           <ul>
                               <li>신입 인재 채용</li>
                               <li>경력 인재 채용</li>
                               <li>대표 채용</li>
                               <li>협력사 채용</li>
                           </ul>
                       </div>
                       <div class="OY_UI_Container two parts right">
                           <div class="OY_UI_Item img" style="width:auto; background-image: url('/static/img/ch.jpg');"></div>
                       </div>
                   </div>
               </div>
           </div>

           <div class="OY_UI_Item">
               <div class="OY_UI_Container">
                   <div class="OY_UI_Container two parts">
                       <div class="OY_UI_Container two parts left">
                           <ul>
                               <li>JavaScript 입문</li>
                               <li>리액트를 다루는 기술</li>
                               <li>시작하세요! 도커</li>
                               <li>JavaScript 리팩토링</li>
                           </ul>
                       </div>
                       <div class="OY_UI_Container two parts right">
                           <div class="OY_UI_Item img" style="width:auto; background-image: url('/static/img/me.jpg');"></div>
                       </div>
                   </div>
               </div>
           </div>

           <div class="OY_UI_Item">
               <div class="OY_UI_Container">
                   <div class="OY_UI_Container two parts">
                       <div class="OY_UI_Container two parts left">
                           <ul>
                               <li>문의 1</li>
                               <li>문의 2</li>
                               <li>문의 3</li>
                               <li>문의 4</li>
                           </ul>
                       </div>
                       <div class="OY_UI_Container two parts right">
                           <div class="OY_UI_Item img" style="width:auto; background-image: url('/static/img/ce.jpg');"></div>
                       </div>
                   </div>
               </div>
           </div>
       </div>
   </div>

    <div class="OY_UI_Container">
        <div class="OY_UI_Container two parts">
            <div class="OY_UI_Container two parts left">
                <div id="myOYGrid"></div>
                <br />
                <button class="btn img search" onclick="fn_save();"></button>
                <button class="btn img cancel"></button>
                <br />
                <button class="btn red">레드</button>
                <button class="btn blue">블루</button>
                <button class="btn green" onclick="fn_admin();">어드민사이트</button>
                <button class="btn gray" onclick="fn_logout();">로그아웃테스트</button>
                <button class="btn cherryBlossom" onclick="fn_pop();">팝업</button>
                <button class="btn blueSky">블루스카이</button>
                <button class="btn violetPurple">바이올렛퍼플</button>
                <br />
                입력 테스트
                <div class="OY_UI_WebInput"></div>
                <br />

                <p>grid 2</p>
                <div id="myOYGrid2"></div>
                <br />

                <p>grid 3</p>
                <div id="myOYGrid3"></div>
                <br />

                <p>grid 4</p>
                <div id="myOYGrid4"></div>
                <br />

            </div>
            <br />
            <div class="OY_UI_Container two parts right">
                <label class="OY_UI_WebLabel">이메일</label>
                <span class="tooltip">
                    <div class="OY_UI_WebInput" id="email"></div>
                    <span class="tooltip-text">이메일을 입력 하세요.</span>
                </span>
                <br />
                <br />
                <label class="OY_UI_WebLabel">이름</label>
                <span class="tooltip">
                    <div class="OY_UI_WebInput" id="name"></div>
                    <span class="tooltip-text">이름을 입력 하세요.</span>
                </span>
                <br />
                <br />
                <label class="OY_UI_WebLabel">전화번호</label>
                <span class="tooltip">
                    <div class="OY_UI_WebInput" id="phoneNumber"></div>
                    <span class="tooltip-text">전화 번호를 입력 하세요.</span>
                </span>
                <br />
                <br />
                <label class="OY_UI_WebLabel">비밀번호</label>
                <span class="tooltip">
                    <div class="OY_UI_WebInput password" id="password"></div>
                    <span class="tooltip-text">비밀번호를 입력 하세요.</span>
                </span>
                <br />
                <br />
                <label class="OY_UI_WebLabel">비밀번호 확인</label>
                <span class="tooltip">
                    <div class="OY_UI_WebInput password" id="passwordChk"></div>
                    <span class="tooltip-text">위 비밀번호와 동일한 번호를 입력 하세요.</span>
                </span>
                <br />
                <br />
                <button class="btn violetPurple" onclick="fn_saveInfo();">저장하기</button>
                <br />
                <br />
                <p class="OY_UI_p_tag">OY-G / IT-Enterprise</p>
                <p class="OY_UI_p_tag">OY-Games (게임 개발-운영)</p>
                <p class="OY_UI_p_tag">OY-Solutions (IT 프로젝트 개발)</p>
                <p class="OY_UI_p_tag">OY-Delivery (메타버스 생성-> 실물-> 결제 -> 물류 -> 배송 )</p>
                <p class="OY_UI_p_tag">OY-OYaverse (메타버스[Meta] 플랫폼)</p>
                <div id="paging">
                    <button class="btn default" id="fir" name="btn" value="${data.paging.firstPage}" onclick="pageClick('${fn:replace(data.paging.firstPage, "'", "\\'")}');"><<</button>
                    <button class="btn default" id="prev" name="btn" value="${data.paging.prevPage}" onclick="pageClick('${fn:replace(data.paging.prevPage, "'", "\\'")}')"><</button>
                    <c:forEach var="item" items="${data.paging.blockPage}">
                        <button class="btn default" name="btn" value="${item.page}" onclick="pageClick('${fn:replace(item.page, "'", "\\'") }')">${item.page}</button>
                    </c:forEach>
                    <button class="btn default" id="next" name="btn" value="${data.paging.nextPage}" onclick="pageClick('${fn:replace(data.paging.nextPage, "'", "\\'")}')">></button>
                    <button class="btn default" id="last" name="btn" value="${data.paging.lastPage}" onclick="pageClick('${fn:replace(data.paging.lastPage, "'", "\\'")}')">>></button>
                </div>
            </div>
        </div>
    </div>

   <br />
   <br />
   <br />
   <br />
   <br />


   <main class="OY_UI_main"></main>

   <div class="OY_UI_wrap">
       <footer class="OY_UI_footer">
           <h4 class="OY_UI_h4">회사명: OY-G</h4>
           <h4 class="OY_UI_h4">대표: JooOYun</h4>
           <h4 class="OY_UI_h4">오시는 길: 경기도 광주시 IT-Park 센터 전층</h4>
           <h4 class="OY_UI_h4">전화번호: 031-123-1234</h4>
       </footer>
   </div>

</body>
</html>

<%--<jsp:include page="../include/bottom.jsp" />--%>
