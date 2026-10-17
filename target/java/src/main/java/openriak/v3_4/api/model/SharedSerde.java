package openriak.v3_4.api.model;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.function.BiConsumer;
import software.amazon.smithy.java.core.schema.Schema;
import software.amazon.smithy.java.core.serde.MapSerializer;
import software.amazon.smithy.java.core.serde.ShapeDeserializer;
import software.amazon.smithy.java.core.serde.ShapeSerializer;


/**
 * Defines shared serialization and deserialization methods for map and list shapes.
 */
final class SharedSerde {

    static final class QueryListSerializer implements BiConsumer<List<QuerySpec>, ShapeSerializer> {
        static final QueryListSerializer INSTANCE = new QueryListSerializer();

        @Override
        public void accept(List<QuerySpec> values, ShapeSerializer serializer) {
            for (var value : values) {
                serializer.writeStruct(Schemas.QUERY_LIST.listMember(), value);
            }
        }
    }

    static List<QuerySpec> deserializeQueryList(Schema schema, ShapeDeserializer deserializer) {
        var size = Math.min(deserializer.containerSize(), deserializer.containerPreAllocationLimit());
        List<QuerySpec> result = size == -1 ? new ArrayList<>() : new ArrayList<>(size);
        deserializer.readList(schema, result, QueryList$MemberDeserializer.INSTANCE);
        return result;
    }

    private static final class QueryList$MemberDeserializer implements ShapeDeserializer.ListMemberConsumer<List<QuerySpec>> {
        static final QueryList$MemberDeserializer INSTANCE = new QueryList$MemberDeserializer();

        @Override
        public void accept(List<QuerySpec> state, ShapeDeserializer deserializer) {
            if (deserializer.isNull()) {

                return;
            }
            state.add(QuerySpec.builder().deserializeMember(deserializer, Schemas.QUERY_LIST.listMember()).build());
        }
    }

    static final class RiakHeadersSerializer implements BiConsumer<Map<String, String>, MapSerializer> {
        static final RiakHeadersSerializer INSTANCE = new RiakHeadersSerializer();

        @Override
        public void accept(Map<String, String> values, MapSerializer serializer) {
            for (var valueEntry : values.entrySet()) {
                serializer.writeEntry(
                    Schemas.RIAK_HEADERS.mapKeyMember(),
                    valueEntry.getKey(),
                    valueEntry.getValue(),
                    RiakHeaders$ValueSerializer.INSTANCE
                );
            }
        }
    }

    private static final class RiakHeaders$ValueSerializer implements BiConsumer<String, ShapeSerializer> {
        private static final RiakHeaders$ValueSerializer INSTANCE = new RiakHeaders$ValueSerializer();

        @Override
        public void accept(String values, ShapeSerializer serializer) {
            serializer.writeString(Schemas.RIAK_HEADERS.mapValueMember(), values);
        }
    }

    static Map<String, String> deserializeRiakHeaders(Schema schema, ShapeDeserializer deserializer) {
        var size = Math.min(deserializer.containerSize(), deserializer.containerPreAllocationLimit());
        Map<String, String> result = size == -1 ? new LinkedHashMap<>() : new LinkedHashMap<>(size);
        deserializer.readStringMap(schema, result, RiakHeaders$ValueDeserializer.INSTANCE);
        return result;
    }

    private static final class RiakHeaders$ValueDeserializer implements ShapeDeserializer.MapMemberConsumer<String, Map<String, String>> {
        static final RiakHeaders$ValueDeserializer INSTANCE = new RiakHeaders$ValueDeserializer();

        @Override
        public void accept(Map<String, String> state, String key, ShapeDeserializer deserializer) {
            if (deserializer.isNull()) {
                deserializer.readNull();
                return;
            }
            state.put(key, deserializer.readString(Schemas.RIAK_HEADERS.mapValueMember()));
        }
    }

    private SharedSerde() {}
}
