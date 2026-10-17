package openriak.v3_4.api.model;

import java.util.Objects;
import software.amazon.smithy.java.core.schema.PresenceTracker;
import software.amazon.smithy.java.core.schema.Schema;
import software.amazon.smithy.java.core.schema.SchemaUtils;
import software.amazon.smithy.java.core.schema.SerializableStruct;
import software.amazon.smithy.java.core.schema.ShapeBuilder;
import software.amazon.smithy.java.core.serde.ShapeDeserializer;
import software.amazon.smithy.java.core.serde.ShapeSerializer;
import software.amazon.smithy.java.core.serde.ToStringSerializer;
import software.amazon.smithy.model.shapes.ShapeId;
import software.amazon.smithy.utils.SmithyGenerated;

@SmithyGenerated
public final class MapReduceChunkedInput implements SerializableStruct {

    public static final Schema $SCHEMA = Schemas.MAP_REDUCE_CHUNKED_INPUT;
    private static final Schema $SCHEMA_CONTENT_TYPE = $SCHEMA.member("contentType");
    private static final Schema $SCHEMA_ACCEPT = $SCHEMA.member("accept");
    private static final Schema $SCHEMA_REQUEST = $SCHEMA.member("request");

    public static final ShapeId $ID = $SCHEMA.id();

    private final transient String contentType;
    private final transient String accept;
    private final transient MapReduceJob request;

    private MapReduceChunkedInput(Builder builder) {
        this.contentType = builder.contentType;
        this.accept = builder.accept;
        this.request = builder.request;
    }

    public String getContentType() {
        return contentType;
    }

    public String getAccept() {
        return accept;
    }

    public MapReduceJob getRequest() {
        return request;
    }

    @Override
    public String toString() {
        return ToStringSerializer.serialize(this);
    }

    @Override
    public boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (other == null || getClass() != other.getClass()) {
            return false;
        }
        MapReduceChunkedInput that = (MapReduceChunkedInput) other;
        return Objects.equals(this.contentType, that.contentType)
               && Objects.equals(this.accept, that.accept)
               && Objects.equals(this.request, that.request);
    }

    @Override
    public int hashCode() {
        int $hc = Objects.hashCode(contentType);
        $hc = 31 * $hc + Objects.hashCode(accept);
        $hc = 31 * $hc + Objects.hashCode(request);
        return $hc;
    }

    @Override
    public Schema schema() {
        return $SCHEMA;
    }

    @Override
    public void serializeMembers(ShapeSerializer serializer) {
        serializer.writeString($SCHEMA_CONTENT_TYPE, contentType);
        if (accept != null) {
            serializer.writeString($SCHEMA_ACCEPT, accept);
        }
        if (request != null) {
            serializer.writeStruct($SCHEMA_REQUEST, request);
        }
    }

    @Override
    @SuppressWarnings("unchecked")
    public <T> T getMemberValue(Schema member) {
        return switch (member.memberIndex()) {
            case 0 -> (T) SchemaUtils.validateSameMember($SCHEMA_CONTENT_TYPE, member, contentType);
            case 1 -> (T) SchemaUtils.validateSameMember($SCHEMA_REQUEST, member, request);
            case 2 -> (T) SchemaUtils.validateSameMember($SCHEMA_ACCEPT, member, accept);
            default -> throw new IllegalArgumentException("Attempted to get non-existent member: " + member.id());
        };
    }

    /**
     * Create a new builder containing all the current property values of this object.
     *
     * <p><strong>Note:</strong> This method performs only a shallow copy of the original properties.
     *
     * @return a builder for {@link MapReduceChunkedInput}.
     */
    public Builder toBuilder() {
        var builder = new Builder();
        builder.contentType(this.contentType);
        builder.accept(this.accept);
        builder.request(this.request);
        return builder;
    }

    /**
     * @return returns a new Builder.
     */
    public static Builder builder() {
        return new Builder();
    }

    /**
     * Builder for {@link MapReduceChunkedInput}.
     */
    public static final class Builder implements ShapeBuilder<MapReduceChunkedInput> {
        private final PresenceTracker tracker = PresenceTracker.of($SCHEMA);
        private String contentType;
        private String accept;
        private MapReduceJob request;

        private Builder() {}

        @Override
        public Schema schema() {
            return $SCHEMA;
        }

        /**
         * <p><strong>Required</strong>
         * @return this builder.
         */
        public Builder contentType(String contentType) {
            this.contentType = Objects.requireNonNull(contentType, "contentType cannot be null");
            tracker.setMember($SCHEMA_CONTENT_TYPE);
            return this;
        }

        /**
         * @return this builder.
         */
        public Builder accept(String accept) {
            this.accept = accept;
            return this;
        }

        /**
         * <p><strong>Required</strong>
         * @return this builder.
         */
        public Builder request(MapReduceJob request) {
            this.request = Objects.requireNonNull(request, "request cannot be null");
            tracker.setMember($SCHEMA_REQUEST);
            return this;
        }

        @Override
        public MapReduceChunkedInput build() {
            tracker.validate();
            return new MapReduceChunkedInput(this);
        }

        @Override
        @SuppressWarnings("unchecked")
        public void setMemberValue(Schema member, Object value) {
            switch (member.memberIndex()) {
                case 0 -> contentType((String) SchemaUtils.validateSameMember($SCHEMA_CONTENT_TYPE, member, value));
                case 1 -> request((MapReduceJob) SchemaUtils.validateSameMember($SCHEMA_REQUEST, member, value));
                case 2 -> accept((String) SchemaUtils.validateSameMember($SCHEMA_ACCEPT, member, value));
                default -> ShapeBuilder.super.setMemberValue(member, value);
            }
        }

        @Override
        public ShapeBuilder<MapReduceChunkedInput> errorCorrection() {
            if (tracker.allSet()) {
                return this;
            }
            if (!tracker.checkMember($SCHEMA_CONTENT_TYPE)) {
                contentType("");
            }
            if (!tracker.checkMember($SCHEMA_REQUEST)) {
                tracker.setMember($SCHEMA_REQUEST);
            }
            return this;
        }

        @Override
        public Builder deserialize(ShapeDeserializer decoder) {
            decoder.readStruct($SCHEMA, this, $InnerDeserializer.INSTANCE);
            return this;
        }

        @Override
        public Builder deserializeMember(ShapeDeserializer decoder, Schema schema) {
            decoder.readStruct(schema.assertMemberTargetIs($SCHEMA), this, $InnerDeserializer.INSTANCE);
            return this;
        }

        private static final class $InnerDeserializer implements ShapeDeserializer.StructMemberConsumer<Builder> {
            private static final $InnerDeserializer INSTANCE = new $InnerDeserializer();

            @Override
            @SuppressWarnings("unchecked")
            public void accept(Builder builder, Schema member, ShapeDeserializer de) {
                switch (member.memberIndex()) {
                    case 0 -> builder.contentType(de.readString(member));
                    case 1 -> builder.request(MapReduceJob.builder().deserializeMember(de, member).build());
                    case 2 -> builder.accept(de.readString(member));
                    default -> throw new IllegalArgumentException("Unexpected member: " + member.memberName());
                }
            }
        }
    }
}
