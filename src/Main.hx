package ;

import cpp.Lib;
import haxe.Json;
import sys.FileSystem;
import sys.io.File;
import systools.Clipboard;

/**
 * ...
 * @author 
 */

class Main 
{
	
	static function main() 
	{
		if (Sys.args()[0] == null)
		{
			Sys.println("Usage:");
			
			Sys.println("\tbs.exe [path] <output type> <format type>\n");
			
			Sys.println("\t<output type> default ");
			Sys.println("\t\tsave results to system clipboard\n");
			
			Sys.println("\t<output type> -p ");
			Sys.println("\t\tprint results to console\n");
			
			Sys.println("\t<output type> -f");
			Sys.println("\t\tsave results to file at bs.exe's location\n");
			
			Sys.println("\t<format type> default");
			Sys.println("\t\tformat results as an indented text file\n");
			
			Sys.println("\t<format type> -h");
			Sys.println("\t\tformat results as a clean html description list\n");
			
			Sys.println("Press any key to continue...");
			Sys.getChar(false);
			Sys.exit(0);
		}
		var path:String = Sys.args()[0];
		
		var type:String = "-c";
		
		var format:String = "-t";
		
		for (a in Sys.args())
		{
			if (a == "-h")
			{
				format = a;
			}
			else if (a == "-p" || a == "-f")
			{
				type = a;
			}
		}
		
		parse(path, type, format);
	}
	
	static function parse(path:String, type:String, format:String) 
	{
		var counter:Int = 0;
		
		var bookmarks:String = IceUtil.LoadString(path);
		var parsedBookmarks:Dynamic = Json.parse(bookmarks);
		var all:Array<Dynamic> = cast parsedBookmarks.roots.bookmark_bar.children;
		
		var output:String = "";
		
		if (format == "-t")
		{
			for (b in all)
			{
				counter++;
				
				output += b.name + "\n";
				output += "\t" + b.url + "\n";
				output += "\n";
			}
		}
		else if (format == "-h")
		{
			output = makeElement("dl", [buildHtmlList(all)]);
		}
		
		if (type == "-p")
		{
			Sys.print(output);
		}
		else if (type == "-c")
		{
			Clipboard.setText(output);
			Sys.println("Ouput copied to clipboard");
		}
		else if (type == "-f")
		{
			File.saveContent("./output.txt", output);
		}
		
		Sys.println("Press any key to continue...");
		
		Sys.getChar(false);
	}
	
	static public function buildHtmlList(bkmks:Array<Dynamic>):String
	{
		var buffer:String = "";
		
		for (b in bkmks)
		{
			buffer += makeElement("dt", [b.name]);
			buffer += makeElement("dd", [b.url]);
		}
		return buffer;
	}
	
	static public function makeElement(tag:String, ?attributes:Map<String, String>, elements:Array<String>):String
	{
		var buffer:String = "";
		buffer += "<" + tag;
		if (attributes != null)
		{
			for (a in attributes.keys())
			{
				buffer += a + "=\"" + attributes[a] + "\"" + " ";
			}
		}
		buffer += ">\n";
		
		for (e in elements)
		{
			buffer += e + "\n";
		}
		
		buffer += "</" + tag + ">\n";
		
		return buffer;
	}
}