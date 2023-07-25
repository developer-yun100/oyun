const errorMsg = "통신 오류";


function ajaxPostCall(url, params, callback){
    $.ajax({
        url: url,
        type: "POST",
        dataType: "JSON",
        contentType: "application/json; charset=utf-8",
        data: JSON.stringify(params),
        //async: false,
        success: function(data) {
            data.frontResult = 1
            return callback(data);
        },
        error: function(error) {
            error.frontResult = 0
            error.msg = errorMsg;
            return callback(error);
        },
    });
}

function ajaxGetCall(url, params, callback){

    let getUrl = url + "?";

    let keys = Object.keys(params);
    for(let i = 0; i < keys.length; i++) {
        let key = keys[i];
        getUrl += key + "=" + params[key];
        if(!(i == (keys.length - 1))){
            getUrl += "&";
        }
    }

    $.ajax({
        url: getUrl,
        type: "GET",
        dataType: "JSON",
        contentType: "application/json; charset=utf-8",
        success: function(data) {
            data.frontResult = 1
            return callback(data);
        },
        error: function(error) {
            error.frontResult = 0
            error.msg = errorMsg;
            return callback(error);
        },
    });
}

function ajaxMultiPartCall(url, params, callback){
    $.ajax({
        url: url,
        type: "POST",
        enctype:'multipart/form-data',
        processData: false,
        contentType: false,
        data: JSON.stringify(params),
        //async: false,
        success: function(data) {
            return callback(data);
        },
        error: function(error) {
            return callback(error);
        },
    });
}

/* common function !! */








