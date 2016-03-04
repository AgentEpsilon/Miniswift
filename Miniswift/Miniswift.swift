public enum FlagValue {
	case Bool, Int, Float, String
}
public struct Flag : Hashable {
	var flags:[String]
	var expects:FlagValue
	var description:String
	public var hashValue:Int{
		return "[\(flags)]->\(expects):\(description)".hashValue
	}
}
public func ==(lhs:Flag, rhs:Flag) -> Bool {
	return lhs.hashValue==rhs.hashValue
}

public typealias Args = (bools:[Flag:Bool], ints:[Flag:Int], floats:[Flag:Float], strings:[Flag:String], rest:[String])

public class Miniswift {
    
	private(set) var args
	: Args
	= (bools:[:], ints:[:], floats:[:], strings:[:], rest:[])
	
    public init(_ flags:[Flag]){
        
        var argv = Process.arguments
		
	  	for flag in flags {
	  		switch flag.expects {
	  		case .Bool:
				for f in flag.flags {
					if let index = argv.indexOf(f){
						self.args.bools[flag] = true
						argv.removeAtIndex(index)
					}
				}
			case .Int:
				for f in flag.flags {
					if let index = argv.indexOf(f) where argv.contains(f){
						let i = argv[index+1]
						self.args.ints[flag] = Int(i)
						argv.removeAtIndex(index+1)
						argv.removeAtIndex(index)
					}
				}
			case .Float:
				for f in flag.flags {
					if let index = argv.indexOf(f) where argv.contains(f){
						let i = argv[index+1]
						self.args.floats[flag] = Float(i)
						argv.removeAtIndex(index+1)
						argv.removeAtIndex(index)
					}
				}
			case .String:
				for f in flag.flags {
					if let index = argv.indexOf(f) where argv.contains(f){
						let i = argv[index+1]
						self.args.strings[flag] = i
						argv.removeAtIndex(index+1)
						argv.removeAtIndex(index)
					}
				}
	  		}
	  	}
		
		self.args.rest = argv
		
  	}
}