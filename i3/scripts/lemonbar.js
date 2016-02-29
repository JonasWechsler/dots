var util = require('util'),
    exec = require('child_process').exec,
    hsv = require('./hsv'),
    lemon = require('./lemonhelper'),
    fs = require('fs');


const colors = [];
const light_colors = [];
const dark_colors = [];
const BLACK = "#212121";
const WHITE = "#FFFFFF";
const LIGHT_SATURATION = .4615;
const LIGHT_VALUE = .975;
const SATURATION = .6653;
const VALUE = .9373;
const DARK_SATURATION = .847;
const DARK_VALUE = .7176;

var cpu_usage = "??";
var ram_usage = "??";
var bat_usage = "??";

function findUsages(){
    exec('top -bn2 | grep \"Cpu(s)\" | awk \'{print $2 + $4}\' | sed -n 2p', function(err, stdout, stderr){
            cpu_usage = trim(stdout);
            });
    exec("FREE_DATA=`free -m | grep Mem`;\
            CURRENT=`echo $FREE_DATA | cut -f3 -d\' \'`;\
            TOTAL=`echo $FREE_DATA | cut -f2 -d\' \'`;\
            echo \"$CURRENT\"", function(err, stdout, stderr){
                ram_usage = trim(stdout);
            });
    exec("acpi | grep -o \"[0-9][0-9]%\"",function(err, stdout, stderr){
        bat_usage = trim(stdout);
    });
}

function trim(x) {
    x = "" + x;
    return x.replace(/^\s+|\s+$/gm,'');
}

function updateWindowName(callback){
    exec('cat /proc/$(xdotool getwindowpid $(xdotool getwindowfocus))/comm',function(err, stdout, stderr){
        stdout = trim(stdout);
        windowName = stdout;
        callback(stdout);
    });
}

function updateWorkspaces(callback){
    exec('i3-msg -t get_workspaces',function(error, workspaces, stderr){
        var workspacesStrings = [];
        var out = "";
        var json = JSON.parse(workspaces);
        for(var i=0;i<json.length;i++){
            if(i > 0 && json[i-1].output != json[i].output){
                //New screen
                workspacesStrings.push(out);
                out = new String();
            }
            out += formatWorkspace(json[i]);
        }
        //out = lemon.click(out, 4,"i3-msg -t command workspace prev");
        //out = lemon.click(out, 5,"i3-msg -t command workspace next");
        workspacesStrings.push(out);
        callback(workspacesStrings);
    });
}

function formatWorkspace(data){
    var bgColor = BLACK;
    var out = "";
    if(data.urgent){
        bgColor = colors[0];
    }else if(data.focused){
        bgColor = colors[colors.length - 1];
    }else{
        bgColor = colors[colors.length - 2];
    }
    out = padding() + data.name + padding();
    with(lemon){
        out = bg(out, bgColor);
        out = click(out,1,"i3-msg -t command workspace " + data.num);
        return out;
    }
}

function getDarkColor(num){
    if(dark_colors[num]){
        return dark_colors[num];
    }
    var h = num/7;
    var dark = hsv.hsv(h, DARK_SATURATION, DARK_VALUE);
    dark_colors[num] = dark;
}

function generateColors(){
    var hues = ["red","orange","yellow","green","blue","indigo","violet"];
    for(var i=0;i<hues.length;i++){
        var h = i/hues.length;
        var name = hues[i];
        var light = hsv.hsv(h, LIGHT_SATURATION, LIGHT_VALUE);
        var normal = hsv.hsv(h, SATURATION, VALUE);
        var dark = hsv.hsv(h, DARK_SATURATION, DARK_VALUE);
        colors[i] = normal;
        light_colors[i] = light;
        dark_colors[i] = dark;
    }
}

function time(){
    return new Date();
}

function padding(){
    return " ";
}

function left(wspaces){
    var out = [];
    with(lemon){
        for(var i=0;i<wspaces.length;i++){
            out.push(l(fg(bg(wspaces[i], BLACK), WHITE)));
        }
    }
    return out;
}

function middle(name){
    with(lemon){
        return [c(fg(bg(padding() + name + padding(), BLACK), WHITE))];
    }
}

function right(){
    with(lemon){
        return [r(fg(
                bg(padding() + bat_usage + padding(), getDarkColor(5.5)) + 
                bg(padding() + cpu_usage + padding(), dark_colors[5]) + 
                bg(padding() + ram_usage + " kB" + padding(), dark_colors[6]) + 
                bg(padding() + time()  + padding(), dark_colors[4]),WHITE))];
    }
}

generateColors();
var t = 0;

function update(){
    updateWorkspaces(function(workspacesStrings){
        updateWindowName(function(name){
            var lcontent = left(workspacesStrings);
            var mcontent = middle(name);
            var rcontent = right();
            var out = "";

            with(lemon){
                for(var i=0;i<workspacesStrings.length;i++){
                    out += fg(bg(lcontent[i] + mcontent[i] + rcontent[i], BLACK), WHITE) + "%{S+}";   
                }
                console.log(out);
            }
            t++;
        });
    });
}

setInterval(update, 1000);
setInterval(findUsages, 5000);

update();

process.stdin.on('readable', function() {
    var chunk = process.stdin.read();
    if (chunk !== null) {
        update();
    }
});
