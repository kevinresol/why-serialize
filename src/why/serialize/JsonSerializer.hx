package why.serialize;

using tink.CoreApi;

#if !macro
@:genericBuild(why.serialize.JsonSerializer.build())
class JsonSerializer<Data> {}
#else

import tink.macro.BuildCache;

using tink.MacroApi;

class JsonSerializer {
	public static function build() {
		return BuildCache.getType('why.serialize.JsonSerializer', (ctx:BuildContext) -> {
			var name = ctx.name;
			var ct = ctx.type.toComplex();
			var def = macro class $name implements why.Serializer<$ct, String> {
				public function new() {}
				public inline function serialize(type:$ct):String
					return tink.Json.stringify(type);
				public inline function unserialize(v:String):tink.core.Outcome<$ct, tink.core.Error>
					return tink.Json.parse((v:$ct));
			}
			def.pack = ['why', 'serialize'];
			def;
		});
	}
}
#end