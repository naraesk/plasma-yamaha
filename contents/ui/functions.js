function request(command, ip) {
    var url = "http://" + ip +"/YamahaRemoteControl/ctrl"
    var http = new XMLHttpRequest();
    http.open("POST", url, true);
    http.setRequestHeader("Content-type", "text/xml; charset=UTF-8");
    http.setRequestHeader("Content-length", command.length);
    http.setRequestHeader("Connection", "close");
    http.send("data="+command)

    return http
}

function sizeRequest(speaker, ip, field) {
    var sizeRequest = Logic.request('<YAMAHA_AV cmd="GET"><System><Speaker_Preout><Pattern_1><Config><' + speaker + '>'
                                   + 'GetParam'
                                   + '</' + speaker + '></Config></Pattern_1></Speaker_Preout></System></YAMAHA_AV>', ip)
    sizeRequest.onreadystatechange = function() {
        if(sizeRequest.readyState === 4) {
            var size = /<Type>(.+?)<\/Type>/.exec(sizeRequest.responseText)
            if(size == null) {
                field.currentIndex = field.find("None")
            } else {
               field.currentIndex = field.find(size[1])
            }
        }
    }
}

function subwooferRequest(speaker, ip, field) {
    var sizeRequest = Logic.request('<YAMAHA_AV cmd="GET"><System><Speaker_Preout><Pattern_1><Config><Subwoofer>'
                                   + 'GetParam'
                                   + '</Subwoofer></Config></Pattern_1></Speaker_Preout></System></YAMAHA_AV>', ip)
    sizeRequest.onreadystatechange = function() {
        if(sizeRequest.readyState === 4) {
            var size = new RegExp('<' + speaker + '><Type>(.+?)<\/Type>').exec(sizeRequest.responseText)
            if(size == null) {
                field.currentIndex = field.find("None")
            } else {
                field.currentIndex = field.find(size[1])
            }
        }
    }
}

