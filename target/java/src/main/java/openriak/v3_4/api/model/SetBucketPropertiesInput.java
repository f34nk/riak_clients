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
import software.amazon.smithy.java.core.serde.document.Document;
import software.amazon.smithy.model.shapes.ShapeId;
import software.amazon.smithy.utils.SmithyGenerated;

@SmithyGenerated
public final class SetBucketPropertiesInput implements SerializableStruct {

    public static final Schema $SCHEMA = Schemas.SET_BUCKET_PROPERTIES_INPUT;
    private static final Schema $SCHEMA_BUCKET_TYPE = $SCHEMA.member("bucketType");
    private static final Schema $SCHEMA_BUCKET = $SCHEMA.member("bucket");
    private static final Schema $SCHEMA_CONTENT_TYPE = $SCHEMA.member("contentType");
    private static final Schema $SCHEMA_PROPS = $SCHEMA.member("props");

    public static final ShapeId $ID = $SCHEMA.id();

    private final transient String bucketType;
    private final transient String bucket;
    private final transient String contentType;
    private final transient Document props;

    private SetBucketPropertiesInput(Builder builder) {
        this.bucketType = builder.bucketType;
        this.bucket = builder.bucket;
        this.contentType = builder.contentType;
        this.props = builder.props;
    }

    public String getBucketType() {
        return bucketType;
    }

    public String getBucket() {
        return bucket;
    }

    public String getContentType() {
        return contentType;
    }

    public Document getProps() {
        return props;
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
        SetBucketPropertiesInput that = (SetBucketPropertiesInput) other;
        return Objects.equals(this.bucketType, that.bucketType)
               && Objects.equals(this.bucket, that.bucket)
               && Objects.equals(this.contentType, that.contentType)
               && Objects.equals(this.props, that.props);
    }

    @Override
    public int hashCode() {
        int $hc = Objects.hashCode(bucketType);
        $hc = 31 * $hc + Objects.hashCode(bucket);
        $hc = 31 * $hc + Objects.hashCode(contentType);
        $hc = 31 * $hc + Objects.hashCode(props);
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
        serializer.writeString($SCHEMA_CONTENT_TYPE, contentType);
        serializer.writeDocument($SCHEMA_PROPS, props);
    }

    @Override
    @SuppressWarnings("unchecked")
    public <T> T getMemberValue(Schema member) {
        return switch (member.memberIndex()) {
            case 0 -> (T) SchemaUtils.validateSameMember($SCHEMA_BUCKET_TYPE, member, bucketType);
            case 1 -> (T) SchemaUtils.validateSameMember($SCHEMA_BUCKET, member, bucket);
            case 2 -> (T) SchemaUtils.validateSameMember($SCHEMA_CONTENT_TYPE, member, contentType);
            case 3 -> (T) SchemaUtils.validateSameMember($SCHEMA_PROPS, member, props);
            default -> throw new IllegalArgumentException("Attempted to get non-existent member: " + member.id());
        };
    }

    /**
     * Create a new builder containing all the current property values of this object.
     *
     * <p><strong>Note:</strong> This method performs only a shallow copy of the original properties.
     *
     * @return a builder for {@link SetBucketPropertiesInput}.
     */
    public Builder toBuilder() {
        var builder = new Builder();
        builder.bucketType(this.bucketType);
        builder.bucket(this.bucket);
        builder.contentType(this.contentType);
        builder.props(this.props);
        return builder;
    }

    /**
     * @return returns a new Builder.
     */
    public static Builder builder() {
        return new Builder();
    }

    /**
     * Builder for {@link SetBucketPropertiesInput}.
     */
    public static final class Builder implements ShapeBuilder<SetBucketPropertiesInput> {
        private final PresenceTracker tracker = PresenceTracker.of($SCHEMA);
        private String bucketType;
        private String bucket;
        private String contentType;
        private Document props;

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
        public Builder contentType(String contentType) {
            this.contentType = Objects.requireNonNull(contentType, "contentType cannot be null");
            tracker.setMember($SCHEMA_CONTENT_TYPE);
            return this;
        }

        /**
         * <p><strong>Required</strong>
         * @return this builder.
         */
        public Builder props(Document props) {
            this.props = Objects.requireNonNull(props, "props cannot be null");
            tracker.setMember($SCHEMA_PROPS);
            return this;
        }

        @Override
        public SetBucketPropertiesInput build() {
            tracker.validate();
            return new SetBucketPropertiesInput(this);
        }

        @Override
        @SuppressWarnings("unchecked")
        public void setMemberValue(Schema member, Object value) {
            switch (member.memberIndex()) {
                case 0 -> bucketType((String) SchemaUtils.validateSameMember($SCHEMA_BUCKET_TYPE, member, value));
                case 1 -> bucket((String) SchemaUtils.validateSameMember($SCHEMA_BUCKET, member, value));
                case 2 -> contentType((String) SchemaUtils.validateSameMember($SCHEMA_CONTENT_TYPE, member, value));
                case 3 -> props((Document) SchemaUtils.validateSameMember($SCHEMA_PROPS, member, value));
                default -> ShapeBuilder.super.setMemberValue(member, value);
            }
        }

        @Override
        public ShapeBuilder<SetBucketPropertiesInput> errorCorrection() {
            if (tracker.allSet()) {
                return this;
            }
            if (!tracker.checkMember($SCHEMA_BUCKET_TYPE)) {
                bucketType("");
            }
            if (!tracker.checkMember($SCHEMA_BUCKET)) {
                bucket("");
            }
            if (!tracker.checkMember($SCHEMA_CONTENT_TYPE)) {
                contentType("");
            }
            if (!tracker.checkMember($SCHEMA_PROPS)) {
                tracker.setMember($SCHEMA_PROPS);
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
                    case 2 -> builder.contentType(de.readString(member));
                    case 3 -> builder.props(de.readDocument());
                    default -> throw new IllegalArgumentException("Unexpected member: " + member.memberName());
                }
            }
        }
    }
}
