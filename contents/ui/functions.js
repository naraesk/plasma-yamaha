/*
 * Copyright (C) 2018 by David Baum <david.baum@naraesk.eu>
 *
 * This file is part of plasma-yamaha.
 *
 * plasma-yamaha is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * plasma-yamaha is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with plasma-yamaha.  If not, see <http://www.gnu.org/licenses/>.
 */

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

