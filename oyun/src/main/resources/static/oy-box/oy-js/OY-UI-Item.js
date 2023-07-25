
var itemVer = '0.1';
var itemLicense = '';
var itemLanguage = 'KR';

window.onload = function(){
    console.log("Item Load !! ");
    // __ common
    // oy_ui_input onload SET !!
    let __oyInput = document.getElementsByClassName('OY_UI_input');
    let __oyInput__web = document.getElementsByClassName('OY_UI_WebInput');

    for(let i = 0; i < __oyInput.length; i++){
        console.log("class = > " + __oyInput);
        __oyInput[i].setAttribute('contenteditable', 'true');
    }
    for(let i = 0; i < __oyInput__web.length; i++){
        console.log("class = > " + __oyInput__web);
        __oyInput__web[i].setAttribute('contenteditable', 'true');
    }

    const links = document.querySelectorAll("#nav > ul > li"); // nav link
    const firstList = document.querySelector("#nav > ul > li:first-child"); // nav 첫 번째 link
    const line = document.querySelector("#line"); // menu하단에 존재하는 line
    const contents__list = document.querySelector("#contents__list"); // 컨텐츠 목록
    const width =  document.getElementsByClassName('OY_UI_Item')[0].clientWidth;

    // link click 이벤트
    const clickLink = (e, index) => {
        contents__list.style.transform = 'translateX('+ (-index * width)+'px)';
        line.style.width = e.currentTarget.offsetWidth+'px';
        line.style.left = e.currentTarget.offsetLeft+'px';
        line.style.top = e.currentTarget.offsetTop+ e.currentTarget.offsetHeight + 'px';
        contentsIndex = index;
    }

    // 각 link 별 click 이벤트 등록
    links.forEach((link, index) => {
        link.addEventListener('click', (e) => clickLink(e, index));
    });

    // 초기 line 위치 지정
    line.style.width = firstList.offsetWidth+'px';
    line.style.left =  firstList.offsetLeft+'px';
    line.style.top = (firstList.offsetTop + firstList.offsetHeight)+'px';

}

const $OY_VAL = {
    value: function(id){
        let obj = document.getElementById(id);
        let tageName = obj.tagName;
        if(tageName == "DIV"){
            return obj.innerText;
        } else {
            return obj.value;
        }
    },
    compare: function(val1, val2){
        let value1 = val1;
        let value2 = val2;

        if(value1 == value2){
            return true;
        } else {
            return false
        }
    }
};


const $OY_CP = {
    request: function(jsonData, callback){
        console.log("통신 !! " + JSON.stringify(jsonData));
        let request = new Request(jsonData.url, {
            method: jsonData.method,
            body: jsonData.data,
            headers: {
                'Content-Type': 'application/json',
                // 'Content-Type': 'application/x-www-form-urlencoded',
            }
        });

        let data;

        fetch(request)
            .then((response) => {
                if (response.status === 200) {
                    console.log("then 1 ");
                    data = response.json();
                } else {
                    throw new Error("server error "+ response.status);
                }
            })
            .then((response) => {
                console.log("then 2 "+response);
                return callback(response);
            })
            .catch((error) => {
                console.log("error ");
                return callback(error);
            });
    }
};

const $OY_EASYFUNC = {
    SUM: function(data, conditionalStatement){
        if(!Array.isArray(data)) {
            return alert("배열이 아님")
        }
        if(conditionalStatement != null && conditionalStatement != "") {
            let sum = 0;
            for(let i = 0; i < data.length; i++) {
                if(!Number.isInteger(data[i][conditionalStatement])){
                    return alert("숫자가 아님");
                }
                sum += data[i][conditionalStatement];
            }
            return sum;
        }
    },
    PERCENTAGE: function(standardData, percentageData, variableType){
        let result = 0;
        if(variableType == "string"){
            result = 100*(percentageData/standardData) + '%';

        } else if(variableType == "int"){
            result = 100*(standardData/percentageData);
        } else {
            return alert("type이 이상함.");
        }
        return result;
    }

};






