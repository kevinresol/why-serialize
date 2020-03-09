package why.serialize;

class StringToChunk<T> implements why.Serializer<T, tink.Chunk> {
	final s:why.Serializer<T, String>;
	public inline function new(s)
		this.s = s;
	public inline function serialize(v:T):tink.Chunk
		return s.serialize(v);
	public inline function unserialize(v:tink.Chunk)
		return s.unserialize(v);
}