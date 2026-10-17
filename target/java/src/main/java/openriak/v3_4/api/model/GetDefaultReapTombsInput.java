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
public final class GetDefaultReapTombsInput implements SerializableStruct {

    public static final Schema $SCHEMA = Schemas.GET_DEFAULT_REAP_TOMBS_INPUT;
    private static final Schema $SCHEMA_BUCKET = $SCHEMA.member("bucket");
    private static final Schema $SCHEMA_FILTER = $SCHEMA.member("filter");
    private static final Schema $SCHEMA_TIMEOUT = $SCHEMA.member("timeout");

    public static final ShapeId $ID = $SCHEMA.id();

    private final transient String bucket;
    private final transient String filter;
    private final transient Integer timeout;

    private GetDefaultReapTombsInput(Builder builder) {
        this.bucket = builder.bucket;
        this.filter = builder.filter;
        this.timeout = builder.timeout;
    }

    public String getBucket() {
        return bucket;
    }

    public String getFilter() {
        return filter;
    }

    public Integer getTimeout() {
        return timeout;
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
        GetDefaultReapTombsInput that = (GetDefaultReapTombsInput) other;
        return Objects.equals(this.timeout, that.timeout)
               && Objects.equals(this.bucket, that.bucket)
               && Objects.equals(this.filter, that.filter);
    }

    @Override
    public int hashCode() {
        int $hc = Objects.hashCode(bucket);
        $hc = 31 * $hc + Objects.hashCode(filter);
        $hc = 31 * $hc + Objects.hashCode(timeout);
        return $hc;
    }

    @Override
    public Schema schema() {
        return $SCHEMA;
    }

    @Override
    public void serializeMembers(ShapeSerializer serializer) {
        serializer.writeString($SCHEMA_BUCKET, bucket);
        if (filter != null) {
            serializer.writeString($SCHEMA_FILTER, filter);
        }
        if (timeout != null) {
            serializer.writeInteger($SCHEMA_TIMEOUT, timeout);
        }
    }

    @Override
    @SuppressWarnings("unchecked")
    public <T> T getMemberValue(Schema member) {
        return switch (member.memberIndex()) {
            case 0 -> (T) SchemaUtils.validateSameMember($SCHEMA_BUCKET, member, bucket);
            case 1 -> (T) SchemaUtils.validateSameMember($SCHEMA_FILTER, member, filter);
            case 2 -> (T) SchemaUtils.validateSameMember($SCHEMA_TIMEOUT, member, timeout);
            default -> throw new IllegalArgumentException("Attempted to get non-existent member: " + member.id());
        };
    }

    /**
     * Create a new builder containing all the current property values of this object.
     *
     * <p><strong>Note:</strong> This method performs only a shallow copy of the original properties.
     *
     * @return a builder for {@link GetDefaultReapTombsInput}.
     */
    public Builder toBuilder() {
        var builder = new Builder();
        builder.bucket(this.bucket);
        builder.filter(this.filter);
        builder.timeout(this.timeout);
        return builder;
    }

    /**
     * @return returns a new Builder.
     */
    public static Builder builder() {
        return new Builder();
    }

    /**
     * Builder for {@link GetDefaultReapTombsInput}.
     */
    public static final class Builder implements ShapeBuilder<GetDefaultReapTombsInput> {
        private final PresenceTracker tracker = PresenceTracker.of($SCHEMA);
        private String bucket;
        private String filter;
        private Integer timeout;

        private Builder() {}

        @Override
        public Schema schema() {
            return $SCHEMA;
        }

        /**
         * <p><strong>Required</strong>
         * @return this builder.
         */
        public Builder bucket(String bucket) {
            this.bucket = Objects.requireNonNull(bucket, "bucket cannot be null");
            tracker.setMember($SCHEMA_BUCKET);
            return this;
        }

        /**
         * @return this builder.
         */
        public Builder filter(String filter) {
            this.filter = filter;
            return this;
        }

        /**
         * @return this builder.
         */
        public Builder timeout(Integer timeout) {
            this.timeout = timeout;
            return this;
        }

        @Override
        public GetDefaultReapTombsInput build() {
            tracker.validate();
            return new GetDefaultReapTombsInput(this);
        }

        @Override
        @SuppressWarnings("unchecked")
        public void setMemberValue(Schema member, Object value) {
            switch (member.memberIndex()) {
                case 0 -> bucket((String) SchemaUtils.validateSameMember($SCHEMA_BUCKET, member, value));
                case 1 -> filter((String) SchemaUtils.validateSameMember($SCHEMA_FILTER, member, value));
                case 2 -> timeout((Integer) SchemaUtils.validateSameMember($SCHEMA_TIMEOUT, member, value));
                default -> ShapeBuilder.super.setMemberValue(member, value);
            }
        }

        @Override
        public ShapeBuilder<GetDefaultReapTombsInput> errorCorrection() {
            if (tracker.allSet()) {
                return this;
            }
            if (!tracker.checkMember($SCHEMA_BUCKET)) {
                bucket("");
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
                    case 0 -> builder.bucket(de.readString(member));
                    case 1 -> builder.filter(de.readString(member));
                    case 2 -> builder.timeout(de.readInteger(member));
                    default -> throw new IllegalArgumentException("Unexpected member: " + member.memberName());
                }
            }
        }
    }
}
