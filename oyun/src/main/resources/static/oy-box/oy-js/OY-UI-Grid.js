
var gridVer = '0.1';
var gridLicense = '';

/* item.js가 먼저 read하고 이 후 grid가 read한다. */
window.addEventListener('load', function() {
    console.log("Grid Load !! ");
});

function activeOptionCheck(activeOption, jsonValue){
    let htmlValue = '';
    switch (activeOption){
        case "inputField" :
            // '<input type="text" value="'+jsonValue+'"/>'
            htmlValue += '<div class="OY_UI_input">'+jsonValue+'</div>';
            break;
        case "dateField" :
            htmlValue += ''+jsonValue;
            break;
        case "checkBox" :
            htmlValue += '<div class="OY_UI_checkBox">';
            if(jsonValue == 1){
                htmlValue += '<input type="checkbox" class="OY_UI_checkBox check" checked/>';
            } else {
                htmlValue += '<input type="checkbox" class="OY_UI_checkBox check"/>';
            }
            htmlValue += '</div>';
            break;
    }
    return htmlValue;
}

const OYGrid = {
    create : function(id, option, jsonData){
        let htmlId = document.getElementById(id);
        let html = '';

        let width = "auto";
        let height = "auto";

        if(option.width != null && option.width != ""){
            width = option.width;
        }

        if(option.height != null && option.height != ""){
            height = option.height;
        }

        let gridSize = 'style="width:'+width+'; height:'+height+'"';

        // grid div
        html += '<div class="OY_UI_Grid" '+gridSize+'>';
            // grid head
            html += '<div class="OY_UI_Head">';
                html += '<div class="OY_UI_Rows">';
                // column create
                for(let i = 0; i < option.column.length; i++){
                    let colStyle = '';
                    if(option.column[i].columnTextAlignOption != null && option.column[i].columnTextAlignOption != ""){
                        colStyle += 'style="text-align:'+option.column[i].columnTextAlignOption+'"';
                    }
                    html += '<div class="OY_UI_Column"' + colStyle + '>';
                    html += option.column[i].columnName;
                    html += '</div>';
                }
                html += '</div>'; // OY_UI_Rows
            html += '</div>'; // OY_UI_Head

        // row-data
        html += '<div class="OY_UI_Body">';
            let countKey = 0;
            for(let i = 0; i < jsonData.length; i++){
                html += '<div class="OY_UI_Rows">';
                let keys = Object.keys(jsonData[i]);
                // 무결성 data check
                for(let k = 0; k < keys.length; k++){
                    let key =  keys[k];
                    let jsonValue = jsonData[i][key];
                    let htmlValue = "";
                    // column data insert
                    for(let j = 0; j < option.column.length; j++){
                        let cnt = 0; // 첫 회 적용 여부 체크
                        if(option.column[j].keyId == key){
                            let styleEffect = '';
                            // column option =====
                            // activeOption
                            if(option.column[j].activeOption != null && option.column[j].activeOption != ""){
                                htmlValue += activeOptionCheck(option.column[j].activeOption, jsonValue);
                            }
                            // css
                            if(option.column[j].textAlignOption != null && option.column[j].textAlignOption != ""){
                                styleEffect += 'style="text-align:'+option.column[j].textAlignOption;
                                cnt = 1;
                            }

                            if(option.column[j].cellOption != null && option.column[j].cellOption != ""){
                                if(cnt == 1){
                                    styleEffect += '; cursor: pointer;';
                                } else {
                                    styleEffect += 'style="cursor: pointer;';
                                }
                            }

                            if(htmlValue == '' || htmlValue == null){
                                htmlValue += jsonValue;
                            }

                            if(styleEffect != "" && styleEffect != null){
                                styleEffect += '"';
                            }

                            html += '<div data-rowkey="'+countKey+'" data-index="'+i+'" class="OY_UI_Cell" '+styleEffect+'>'+htmlValue+'</div>';
                            countKey++;
                        }
                        htmlValue = '';
                    }
                }
                html += '</div>';

            }
        html += '</div>';

        if(option.rowFootField != null && option.rowFootField != ""){
            if(option.rowFootField == "rowFootField"){
                html += '<div class="OY_UI_Foot footStyle">';
                    html += '<div class="OY_UI_Rows">';
                    for(let i = 0; i < option.column.length; i++){
                        html += '<div class="OY_UI_Cell">foot테스트</div>';
                    }
                    html += '</div>';
                html += '</div>';
            }
        }

        html += '</div>'; // OY_UI_Grid

        htmlId.innerHTML = html;
    },
    insert: function(id, option, jsonData){
        console.log("마지막 행 기준으로 추가 합니다.");
    },
    update: function(id, option, jsonData){
        console.log("update !! ");
    },
    addActionEvent : function(id, event, callback){
        let obj = document.getElementById(id);
        // click event !!
        if(event == "cellClick"){
            return obj.addEventListener('click', (e) => callback(e));
        }
    }
};




