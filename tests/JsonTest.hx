package;

import why.Serializer;
import why.serialize.JsonSerializer;

@:asserts
class JsonTest {
	
	var serializer:Serializer<MyData, String>;
	
	public function new() {
		serializer = new JsonSerializer<MyData>();
	}
	
	public function serialize() {
		asserts.assert(serializer.serialize({a: 1, b: 'foo'}) == '{"a":1,"b":"foo"}');
		return asserts.done();
	}
	public function unserialize() {
		asserts.assert(serializer.unserialize('{"a":1,"b":"foo"}').match(Success({a: 1, b: 'foo'})));
		asserts.assert(serializer.unserialize('{"a":"bar"}').match(Failure(_)));
		return asserts.done();
	}
}

typedef MyData = {
	a:Int,
	b:String,
}