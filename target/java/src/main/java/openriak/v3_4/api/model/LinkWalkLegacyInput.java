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
public final class LinkWalkLegacyInput implements SerializableStruct {

    public static final Schema $SCHEMA = Schemas.LINK_WALK_LEGACY_INPUT;
    private static final Schema $SCHEMA_BUCKET = $SCHEMA.member("bucket");
    private static final Schema $SCHEMA_KEY = $SCHEMA.member("key");
    private static final Schema $SCHEMA_WALK = $SCHEMA.member("walk");

    public static final ShapeId $ID = $SCHEMA.id();

    private final transient String bucket;
    private final transient String key;
    private final transient String walk;

    private LinkWalkLegacyInput(Builder builder) {
        this.bucket = builder.bucket;
        this.key = builder.key;
        this.walk = builder.walk;
    }

    public String getBucket() {
        return bucket;
    }

    public String getKey() {
        return key;
    }

    public String getWalk() {
        return walk;
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
        LinkWalkLegacyInput that = (LinkWalkLegacyInput) other;
        return Objects.equals(this.bucket, that.bucket)
               && Objects.equals(this.key, that.key)
               && Objects.equals(this.walk, that.walk);
    }

    @Override
    public int hashCode() {
        int $hc = Objects.hashCode(bucket);
        $hc = 31 * $hc + Objects.hashCode(key);
        $hc = 31 * $hc + Objects.hashCode(walk);
        return $hc;
    }

    @Override
    public Schema schema() {
        return $SCHEMA;
    }

    @Override
    public void serializeMembers(ShapeSerializer serializer) {
        serializer.writeString($SCHEMA_BUCKET, bucket);
        serializer.writeString($SCHEMA_KEY, key);
        serializer.writeString($SCHEMA_WALK, walk);
    }

    @Override
    @SuppressWarnings("unchecked")
    public <T> T getMemberValue(Schema member) {
        return switch (member.memberIndex()) {
            case 0 -> (T) SchemaUtils.validateSameMember($SCHEMA_BUCKET, member, bucket);
            case 1 -> (T) SchemaUtils.validateSameMember($SCHEMA_KEY, member, key);
            case 2 -> (T) SchemaUtils.validateSameMember($SCHEMA_WALK, member, walk);
            default -> throw new IllegalArgumentException("Attempted to get non-existent member: " + member.id());
        };
    }

    /**
     * Create a new builder containing all the current property values of this object.
     *
     * <p><strong>Note:</strong> This method performs only a shallow copy of the original properties.
     *
     * @return a builder for {@link LinkWalkLegacyInput}.
     */
    public Builder toBuilder() {
        var builder = new Builder();
        builder.bucket(this.bucket);
        builder.key(this.key);
        builder.walk(this.walk);
        return builder;
    }

    /**
     * @return returns a new Builder.
     */
    public static Builder builder() {
        return new Builder();
    }

    /**
     * Builder for {@link LinkWalkLegacyInput}.
     */
    public static final class Builder implements ShapeBuilder<LinkWalkLegacyInput> {
        private final PresenceTracker tracker = PresenceTracker.of($SCHEMA);
        private String bucket;
        private String key;
        private String walk;

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
        public Builder key(String key) {
            this.key = Objects.requireNonNull(key, "key cannot be null");
            tracker.setMember($SCHEMA_KEY);
            return this;
        }

        /**
         * <p><strong>Required</strong>
         * @return this builder.
         */
        public Builder walk(String walk) {
            this.walk = Objects.requireNonNull(walk, "walk cannot be null");
            tracker.setMember($SCHEMA_WALK);
            return this;
        }

        @Override
        public LinkWalkLegacyInput build() {
            tracker.validate();
            return new LinkWalkLegacyInput(this);
        }

        @Override
        @SuppressWarnings("unchecked")
        public void setMemberValue(Schema member, Object value) {
            switch (member.memberIndex()) {
                case 0 -> bucket((String) SchemaUtils.validateSameMember($SCHEMA_BUCKET, member, value));
                case 1 -> key((String) SchemaUtils.validateSameMember($SCHEMA_KEY, member, value));
                case 2 -> walk((String) SchemaUtils.validateSameMember($SCHEMA_WALK, member, value));
                default -> ShapeBuilder.super.setMemberValue(member, value);
            }
        }

        @Override
        public ShapeBuilder<LinkWalkLegacyInput> errorCorrection() {
            if (tracker.allSet()) {
                return this;
            }
            if (!tracker.checkMember($SCHEMA_BUCKET)) {
                bucket("");
            }
            if (!tracker.checkMember($SCHEMA_KEY)) {
                key("");
            }
            if (!tracker.checkMember($SCHEMA_WALK)) {
                walk("");
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
                    case 1 -> builder.key(de.readString(member));
                    case 2 -> builder.walk(de.readString(member));
                    default -> throw new IllegalArgumentException("Unexpected member: " + member.memberName());
                }
            }
        }
    }
}
