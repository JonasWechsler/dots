var hsv = require("./hsv");

function generateColors(){
    var hues = ["red","orange","yellow","green","blue","indigo","violet"];
    const LIGHT_SATURATION = .4615;
    const LIGHT_VALUE = .975;
    const SATURATION = .6653;
    const VALUE = .9373;
    const DARK_SATURATION = .847;
    const DARK_VALUE = .7176;
    for(var i=0;i<hues.length;i++){
        var h = i/hues.length;
        var name = hues[i];
        var light = hsv.hsv(h, LIGHT_SATURATION, LIGHT_VALUE);
        var normal = hsv.hsv(h, SATURATION, VALUE);
        var dark = hsv.hsv(h, DARK_SATURATION, DARK_VALUE);
        console.log("colors[" + i + "]=" + normal);
        console.log("light_colors[" + i + "]=" + light);
        console.log("dark_colors[" + i + "]=" + dark);
    }
}
generateColors();