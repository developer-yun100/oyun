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
    <title>팝업</title>
    <script type="text/javascript">

        function fn_tran(){

            const serverUrl = "/main/login";
            let jsonData = {
                 email : $OY_VAL.value("email")
                ,name : $OY_VAL.value("name")
                ,password : $OY_VAL.value("password")
            };

            let te = document.getElementById("email").innerText;
            let tg = document.getElementById("email").tagName;
            console.log(tg + " , te => " +  te);
            console.log("jsonData => " +  JSON.stringify(jsonData));

            ajaxPostCall(serverUrl, jsonData, function(data){
                console.log(data);
            });

            /*let jsonData = {
                 url: "/main/transaction"
                ,method: "POST"
                ,data: JSON.stringify({test: "test"})
            };
            $OY_CP.request(jsonData, function(data){
                console.log("data => " + data.res);
                console.log("data => " + JSON.stringify(data));
            });*/

            /*let array = new Array();
            for(let i = 0; i < 10; i++){
                let json = {
                    num: 1 + parseInt(i)
                };
                array.push(json);
            }*/

            // column SUM (arrayData, SUM(key))
            /*let sumData = $OY_EASYFUNC.SUM(array, "num");
            console.log("sumData=> " + sumData);*/
            // percent(기준값, 비교값, string/int )
            /*let percentageData = $OY_EASYFUNC.PERCENTAGE(100, 30, "string");
            console.log("percentageData=> " + percentageData);*/
        }

    </script>
</head>
<body>
    <div class="OY_UI_login_Form">
        <div class="OY_UI_login_Form top">
            <h2 class="OY_UI_login_Form top h2"> <%--  style="color: #002ead; text-align: center;" --%>
                We invite you to become a member !
            </h2>
            <p>check!! When you sign up for membership, we will keep your personal information for one year.</p>
        </div>
        <div class="OY_UI_login_Form center">
            <label class="OY_UI_WebLabel">Email</label>
            <div class="OY_UI_WebInput" id="email"></div>
            <br />
            <br />
            <label class="OY_UI_WebLabel">Name</label>
            <div class="OY_UI_WebInput" id="name"></div>
            <br />
            <br />
            <label class="OY_UI_WebLabel">Password</label>
            <div class="OY_UI_WebInput" id="password"></div>
            <br />
            <br />
        </div>
        <div class="OY_UI_login_Form bottom">
            <br />
            <br />
            <button class="OY_UI_Simple memBtn" onclick="fn_tran();">Sign-In</button>
            <button class="OY_UI_Simple memBtn" onclick="fn_tran();">Sign-Up</button>
            <br />
            <br />
            <br />
            <img src="" />
            <div class="OY_UI_login_Form bottom down">
                <h2 style="position:fixed; left: 0; right: 0; bottom: 0; border-bottom-style: dashed;">(주)OY-SYSTEM</h2>
            </div>
        </div>
    </div>
</body>
</html>