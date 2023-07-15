<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <script src="<c:url value='/static/js/jquery-1.9.1.min.js'/>"></script>
    <script src="<c:url value='/static/oy-box/oy-js/OY-UI-Item.js'/>"></script>
    <script src="<c:url value='/static/oy-box/oy-js/OY-UI-Grid.js'/>"></script>
    <link rel="stylesheet" href="<c:url value='/static/oy-box/oy-style.css'/>">
    <title>oy.jsDEMO</title>

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
            // addActionEvent [ "cellClick", "", "" ]
            OYGrid.addActionEvent("myOYGrid", "cellClick", function(e){
                let obj = e.target;
                let eventJson = {
                      rowIndex : obj.dataset.index
                    , rowKey : obj.dataset.rowkey
                    , value : obj.innerHTML
                };
                /*let windowSet;
                windowSet.document.getElementById("inputA").value = eventJson.value;
                windowSet = window.open("/main/titlePopup","정보","width=300px, height=500px");*/
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
    </script>
</head>
<body>
    <div class="OY_UI_Loding_Mask" id="loading">
        <img src="/static/oy-box/oy-images/loding.gif" style="margin-top: 400px;">
        <br />
        <label class="OY_UI_blink">저장중</label>
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
                <button class="btn green">그린</button>
                <button class="btn gray">그레이</button>
                <button class="btn cherryBlossom" onclick="fn_pop();">체리블라썸</button>
                <button class="btn blueSky">블루스카이</button>
                <button class="btn violetPurple">바이올렛퍼플</button>
                <br />
                입력 테스트
                <div class="OY_UI_WebInput"></div>
                <br />
            </div>
            <br />
            <div class="OY_UI_Container two parts right">
            </div>
        </div>
    </div>

    <br />

</body>
</html>