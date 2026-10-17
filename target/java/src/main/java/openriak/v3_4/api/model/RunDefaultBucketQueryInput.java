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
public final class RunDefaultBucketQueryInput implements SerializableStruct {

    public static final Schema $SCHEMA = Schemas.RUN_DEFAULT_BUCKET_QUERY_INPUT;
    private static final Schema $SCHEMA_BUCKET = $SCHEMA.member("bucket");
    private static final Schema $SCHEMA_CONTENT_TYPE = $SCHEMA.member("contentType");
    private static final Schema $SCHEMA_QUERY = $SCHEMA.member("query");

    public static final ShapeId $ID = $SCHEMA.id();

    private final transient String bucket;
    private final transient String contentType;
    private final transient BucketQueryRequest query;

    private RunDefaultBucketQueryInput(Builder builder) {
        this.bucket = builder.bucket;
        this.contentType = builder.contentType;
        this.query = builder.query;
    }

    public String getBucket() {
        return bucket;
    }

    public String getContentType() {
        return contentType;
    }

    public BucketQueryRequest getQuery() {
        return query;
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
        RunDefaultBucketQueryInput that = (RunDefaultBucketQueryInput) other;
        return Objects.equals(this.bucket, that.bucket)
               && Objects.equals(this.contentType, that.contentType)
               && Objects.equals(this.query, that.query);
    }

    @Override
    public int hashCode() {
        int $hc = Objects.hashCode(bucket);
        $hc = 31 * $hc + Objects.hashCode(contentType);
        $hc = 31 * $hc + Objects.hashCode(query);
        return $hc;
    }

    @Override
    public Schema schema() {
        return $SCHEMA;
    }

    @Override
    public void serializeMembers(ShapeSerializer serializer) {
        serializer.writeString($SCHEMA_BUCKET, bucket);
        serializer.writeString($SCHEMA_CONTENT_TYPE, contentType);
        if (query != null) {
            serializer.writeStruct($SCHEMA_QUERY, query);
        }
    }

    @Override
    @SuppressWarnings("unchecked")
    public <T> T getMemberValue(Schema member) {
        return switch (member.memberIndex()) {
            case 0 -> (T) SchemaUtils.validateSameMember($SCHEMA_BUCKET, member, bucket);
            case 1 -> (T) SchemaUtils.validateSameMember($SCHEMA_CONTENT_TYPE, member, contentType);
            case 2 -> (T) SchemaUtils.validateSameMember($SCHEMA_QUERY, member, query);
            default -> throw new IllegalArgumentException("Attempted to get non-existent member: " + member.id());
        };
    }

    /**
     * Create a new builder containing all the current property values of this object.
     *
     * <p><strong>Note:</strong> This method performs only a shallow copy of the original properties.
     *
     * @return a builder for {@link RunDefaultBucketQueryInput}.
     */
    public Builder toBuilder() {
        var builder = new Builder();
        builder.bucket(this.bucket);
        builder.contentType(this.contentType);
        builder.query(this.query);
        return builder;
    }

    /**
     * @return returns a new Builder.
     */
    public static Builder builder() {
        return new Builder();
    }

    /**
     * Builder for {@link RunDefaultBucketQueryInput}.
     */
    public static final class Builder implements ShapeBuilder<RunDefaultBucketQueryInput> {
        private final PresenceTracker tracker = PresenceTracker.of($SCHEMA);
        private String bucket;
        private String contentType;
        private BucketQueryRequest query;

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
         * <p><strong>Required</strong>
         * @return this builder.
         */
        public Builder contentType(String contentType) {
            this.contentType = Objects.requireNonNull(contentType, "contentType cannot be null");
            tracker.setMember($SCHEMA_CONTENT_TYPE);
            return this;
        }

        /**
         * <p><strong>Required</strong>
         * @return this builder.
         */
        public Builder query(BucketQueryRequest query) {
            this.query = Objects.requireNonNull(query, "query cannot be null");
            tracker.setMember($SCHEMA_QUERY);
            return this;
        }

        @Override
        public RunDefaultBucketQueryInput build() {
            tracker.validate();
            return new RunDefaultBucketQueryInput(this);
        }

        @Override
        @SuppressWarnings("unchecked")
        public void setMemberValue(Schema member, Object value) {
            switch (member.memberIndex()) {
                case 0 -> bucket((String) SchemaUtils.validateSameMember($SCHEMA_BUCKET, member, value));
                case 1 -> contentType((String) SchemaUtils.validateSameMember($SCHEMA_CONTENT_TYPE, member, value));
                case 2 -> query((BucketQueryRequest) SchemaUtils.validateSameMember($SCHEMA_QUERY, member, value));
                default -> ShapeBuilder.super.setMemberValue(member, value);
            }
        }

        @Override
        public ShapeBuilder<RunDefaultBucketQueryInput> errorCorrection() {
            if (tracker.allSet()) {
                return this;
            }
            if (!tracker.checkMember($SCHEMA_BUCKET)) {
                bucket("");
            }
            if (!tracker.checkMember($SCHEMA_CONTENT_TYPE)) {
                contentType("");
            }
            if (!tracker.checkMember($SCHEMA_QUERY)) {
                tracker.setMember($SCHEMA_QUERY);
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
                    case 1 -> builder.contentType(de.readString(member));
                    case 2 -> builder.query(BucketQueryRequest.builder().deserializeMember(de, member).build());
                    default -> throw new IllegalArgumentException("Unexpected member: " + member.memberName());
                }
            }
        }
    }
}
