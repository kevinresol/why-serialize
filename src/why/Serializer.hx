package why;

using tink.CoreApi;

interface Serializer<Data, Rep> {
	function serialize(type:Data):Rep;
	function unserialize(v:Rep):Outcome<Data, Error>;
}