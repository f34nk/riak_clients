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
public final class GetFindKeysBySiblingCountInput implements SerializableStruct {

    public static final Schema $SCHEMA = Schemas.GET_FIND_KEYS_BY_SIBLING_COUNT_INPUT;
    private static final Schema $SCHEMA_BUCKET_TYPE = $SCHEMA.member("bucketType");
    private static final Schema $SCHEMA_BUCKET = $SCHEMA.member("bucket");
    private static final Schema $SCHEMA_COUNT = $SCHEMA.member("count");
    private static final Schema $SCHEMA_FILTER = $SCHEMA.member("filter");
    private static final Schema $SCHEMA_TIMEOUT = $SCHEMA.member("timeout");

    public static final ShapeId $ID = $SCHEMA.id();

    private final transient String bucketType;
    private final transient String bucket;
    private final transient int count;
    private final transient String filter;
    private final transient Integer timeout;

    private GetFindKeysBySiblingCountInput(Builder builder) {
        this.bucketType = builder.bucketType;
        this.bucket = builder.bucket;
        this.count = builder.count;
        this.filter = builder.filter;
        this.timeout = builder.timeout;
    }

    public String getBucketType() {
        return bucketType;
    }

    public String getBucket() {
        return bucket;
    }

    public int getCount() {
        return count;
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
        GetFindKeysBySiblingCountInput that = (GetFindKeysBySiblingCountInput) other;
        return this.count == that.count
               && Objects.equals(this.timeout, that.timeout)
               && Objects.equals(this.bucketType, that.bucketType)
               && Objects.equals(this.bucket, that.bucket)
               && Objects.equals(this.filter, that.filter);
    }

    @Override
    public int hashCode() {
        int $hc = Objects.hashCode(bucketType);
        $hc = 31 * $hc + Objects.hashCode(bucket);
        $hc = 31 * $hc + Integer.hashCode(count);
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
        serializer.writeString($SCHEMA_BUCKET_TYPE, bucketType);
        serializer.writeString($SCHEMA_BUCKET, bucket);
        serializer.writeInteger($SCHEMA_COUNT, count);
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
            case 0 -> (T) SchemaUtils.validateSameMember($SCHEMA_BUCKET_TYPE, member, bucketType);
            case 1 -> (T) SchemaUtils.validateSameMember($SCHEMA_BUCKET, member, bucket);
            case 2 -> (T) SchemaUtils.validateSameMember($SCHEMA_COUNT, member, count);
            case 3 -> (T) SchemaUtils.validateSameMember($SCHEMA_FILTER, member, filter);
            case 4 -> (T) SchemaUtils.validateSameMember($SCHEMA_TIMEOUT, member, timeout);
            default -> throw new IllegalArgumentException("Attempted to get non-existent member: " + member.id());
        };
    }

    /**
     * Create a new builder containing all the current property values of this object.
     *
     * <p><strong>Note:</strong> This method performs only a shallow copy of the original properties.
     *
     * @return a builder for {@link GetFindKeysBySiblingCountInput}.
     */
    public Builder toBuilder() {
        var builder = new Builder();
        builder.bucketType(this.bucketType);
        builder.bucket(this.bucket);
        builder.count(this.count);
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
     * Builder for {@link GetFindKeysBySiblingCountInput}.
     */
    public static final class Builder implements ShapeBuilder<GetFindKeysBySiblingCountInput> {
        private final PresenceTracker tracker = PresenceTracker.of($SCHEMA);
        private String bucketType;
        private String bucket;
        private int count;
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
        public Builder bucketType(String bucketType) {
            this.bucketType = Objects.requireNonNull(bucketType, "bucketType cannot be null");
            tracker.setMember($SCHEMA_BUCKET_TYPE);
            return this;
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
         * <p><strong>Required</strong>
         * @return this builder.
         */
        public Builder count(int count) {
            this.count = count;
            tracker.setMember($SCHEMA_COUNT);
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
        public GetFindKeysBySiblingCountInput build() {
            tracker.validate();
            return new GetFindKeysBySiblingCountInput(this);
        }

        @Override
        @SuppressWarnings("unchecked")
        public void setMemberValue(Schema member, Object value) {
            switch (member.memberIndex()) {
                case 0 -> bucketType((String) SchemaUtils.validateSameMember($SCHEMA_BUCKET_TYPE, member, value));
                case 1 -> bucket((String) SchemaUtils.validateSameMember($SCHEMA_BUCKET, member, value));
                case 2 -> count((int) SchemaUtils.validateSameMember($SCHEMA_COUNT, member, value));
                case 3 -> filter((String) SchemaUtils.validateSameMember($SCHEMA_FILTER, member, value));
                case 4 -> timeout((Integer) SchemaUtils.validateSameMember($SCHEMA_TIMEOUT, member, value));
                default -> ShapeBuilder.super.setMemberValue(member, value);
            }
        }

        @Override
        public ShapeBuilder<GetFindKeysBySiblingCountInput> errorCorrection() {
            if (tracker.allSet()) {
                return this;
            }
            if (!tracker.checkMember($SCHEMA_BUCKET_TYPE)) {
                bucketType("");
            }
            if (!tracker.checkMember($SCHEMA_BUCKET)) {
                bucket("");
            }
            if (!tracker.checkMember($SCHEMA_COUNT)) {
                tracker.setMember($SCHEMA_COUNT);
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
                    case 0 -> builder.bucketType(de.readString(member));
                    case 1 -> builder.bucket(de.readString(member));
                    case 2 -> builder.count(de.readInteger(member));
                    case 3 -> builder.filter(de.readString(member));
                    case 4 -> builder.timeout(de.readInteger(member));
                    default -> throw new IllegalArgumentException("Unexpected member: " + member.memberName());
                }
            }
        }
    }
}
