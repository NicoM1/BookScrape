package ;

import haxe.io.Eof;
import sys.io.File;
import sys.io.FileInput;

/**
 * ...
 * @author 
 */
class IceUtil
{
	/**
	 * Loads a text file from disk
	 * @param	path		relative path to the text file
	 * @param	useAssets	whether to use Openfl.Assets (required on flash)
	 */
	static public function LoadString(path:String):String
	{
		var string:String = "";
		
		try
		{
			var fileIn = File.read(path, false);
			while (true)
			{
				string += fileIn.readLine() + "\n";
			}
			fileIn.close();
		}
		catch (ex:Eof)
		{
			return string;
		}
		catch (e:Dynamic)
		{
			return null;
		}

		return string;
	}
}