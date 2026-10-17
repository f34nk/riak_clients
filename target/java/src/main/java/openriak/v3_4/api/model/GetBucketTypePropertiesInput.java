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
public final class GetBucketTypePropertiesInput implements SerializableStruct {

    public static final Schema $SCHEMA = Schemas.GET_BUCKET_TYPE_PROPERTIES_INPUT;
    private static final Schema $SCHEMA_BUCKET_TYPE = $SCHEMA.member("bucketType");
    private static final Schema $SCHEMA_TIMEOUT = $SCHEMA.member("timeout");

    public static final ShapeId $ID = $SCHEMA.id();

    private final transient String bucketType;
    private final transient Integer timeout;

    private GetBucketTypePropertiesInput(Builder builder) {
        this.bucketType = builder.bucketType;
        this.timeout = builder.timeout;
    }

    public String getBucketType() {
        return bucketType;
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
        GetBucketTypePropertiesInput that = (GetBucketTypePropertiesInput) other;
        return Objects.equals(this.timeout, that.timeout)
               && Objects.equals(this.bucketType, that.bucketType);
    }

    @Override
    public int hashCode() {
        int $hc = Objects.hashCode(bucketType);
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
        if (timeout != null) {
            serializer.writeInteger($SCHEMA_TIMEOUT, timeout);
        }
    }

    @Override
    @SuppressWarnings("unchecked")
    public <T> T getMemberValue(Schema member) {
        return switch (member.memberIndex()) {
            case 0 -> (T) SchemaUtils.validateSameMember($SCHEMA_BUCKET_TYPE, member, bucketType);
            case 1 -> (T) SchemaUtils.validateSameMember($SCHEMA_TIMEOUT, member, timeout);
            default -> throw new IllegalArgumentException("Attempted to get non-existent member: " + member.id());
        };
    }

    /**
     * Create a new builder containing all the current property values of this object.
     *
     * <p><strong>Note:</strong> This method performs only a shallow copy of the original properties.
     *
     * @return a builder for {@link GetBucketTypePropertiesInput}.
     */
    public Builder toBuilder() {
        var builder = new Builder();
        builder.bucketType(this.bucketType);
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
     * Builder for {@link GetBucketTypePropertiesInput}.
     */
    public static final class Builder implements ShapeBuilder<GetBucketTypePropertiesInput> {
        private final PresenceTracker tracker = PresenceTracker.of($SCHEMA);
        private String bucketType;
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
         * @return this builder.
         */
        public Builder timeout(Integer timeout) {
            this.timeout = timeout;
            return this;
        }

        @Override
        public GetBucketTypePropertiesInput build() {
            tracker.validate();
            return new GetBucketTypePropertiesInput(this);
        }

        @Override
        @SuppressWarnings("unchecked")
        public void setMemberValue(Schema member, Object value) {
            switch (member.memberIndex()) {
                case 0 -> bucketType((String) SchemaUtils.validateSameMember($SCHEMA_BUCKET_TYPE, member, value));
                case 1 -> timeout((Integer) SchemaUtils.validateSameMember($SCHEMA_TIMEOUT, member, value));
                default -> ShapeBuilder.super.setMemberValue(member, value);
            }
        }

        @Override
        public ShapeBuilder<GetBucketTypePropertiesInput> errorCorrection() {
            if (tracker.allSet()) {
                return this;
            }
            if (!tracker.checkMember($SCHEMA_BUCKET_TYPE)) {
                bucketType("");
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
                    case 1 -> builder.timeout(de.readInteger(member));
                    default -> throw new IllegalArgumentException("Unexpected member: " + member.memberName());
                }
            }
        }
    }
}
