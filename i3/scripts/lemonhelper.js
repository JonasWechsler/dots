(function(){
	function lemonFunction(command, string, arg){
	    if(arg)
	        return "%{" + command + ":" + arg + "}" + string + "%{" + command + "}";
	    else
	        return "%{" + command + "}" + string + "%{" + command + "}";    
	}

	module.exports.r = function(string){return lemonFunction("R",string);}
	module.exports.l = function(string){return lemonFunction("l",string);}
	module.exports.c = function(string){return lemonFunction("c",string);}
	module.exports.r = function(string){return lemonFunction("r",string);}
	module.exports.bg = function(string, arg){return lemonFunction("B" + arg,string);}
	module.exports.fg = function(string, arg){return lemonFunction("F" + arg,string);}
	module.exports.font = function(string, arg){return lemonFunction("Tindex",string,arg);}
	module.exports.underline = function(string, arg){return lemonFunction("Ucolor",string,arg);}
	module.exports.click = function(string, button, arg){return "%{A" + button + ":" + arg + ":}" + string + "%{A}"}
}());