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
public final class PushQueueItemsInput implements SerializableStruct {

    public static final Schema $SCHEMA = Schemas.PUSH_QUEUE_ITEMS_INPUT;
    private static final Schema $SCHEMA_QUEUE_NAME = $SCHEMA.member("queueName");
    private static final Schema $SCHEMA_CONTENT_TYPE = $SCHEMA.member("contentType");
    private static final Schema $SCHEMA_KEYS_CLOCKS = $SCHEMA.member("keysClocks");

    public static final ShapeId $ID = $SCHEMA.id();

    private final transient String queueName;
    private final transient String contentType;
    private final transient Document keysClocks;

    private PushQueueItemsInput(Builder builder) {
        this.queueName = builder.queueName;
        this.contentType = builder.contentType;
        this.keysClocks = builder.keysClocks;
    }

    public String getQueueName() {
        return queueName;
    }

    public String getContentType() {
        return contentType;
    }

    public Document getKeysClocks() {
        return keysClocks;
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
        PushQueueItemsInput that = (PushQueueItemsInput) other;
        return Objects.equals(this.queueName, that.queueName)
               && Objects.equals(this.contentType, that.contentType)
               && Objects.equals(this.keysClocks, that.keysClocks);
    }

    @Override
    public int hashCode() {
        int $hc = Objects.hashCode(queueName);
        $hc = 31 * $hc + Objects.hashCode(contentType);
        $hc = 31 * $hc + Objects.hashCode(keysClocks);
        return $hc;
    }

    @Override
    public Schema schema() {
        return $SCHEMA;
    }

    @Override
    public void serializeMembers(ShapeSerializer serializer) {
        serializer.writeString($SCHEMA_QUEUE_NAME, queueName);
        serializer.writeString($SCHEMA_CONTENT_TYPE, contentType);
        serializer.writeDocument($SCHEMA_KEYS_CLOCKS, keysClocks);
    }

    @Override
    @SuppressWarnings("unchecked")
    public <T> T getMemberValue(Schema member) {
        return switch (member.memberIndex()) {
            case 0 -> (T) SchemaUtils.validateSameMember($SCHEMA_QUEUE_NAME, member, queueName);
            case 1 -> (T) SchemaUtils.validateSameMember($SCHEMA_CONTENT_TYPE, member, contentType);
            case 2 -> (T) SchemaUtils.validateSameMember($SCHEMA_KEYS_CLOCKS, member, keysClocks);
            default -> throw new IllegalArgumentException("Attempted to get non-existent member: " + member.id());
        };
    }

    /**
     * Create a new builder containing all the current property values of this object.
     *
     * <p><strong>Note:</strong> This method performs only a shallow copy of the original properties.
     *
     * @return a builder for {@link PushQueueItemsInput}.
     */
    public Builder toBuilder() {
        var builder = new Builder();
        builder.queueName(this.queueName);
        builder.contentType(this.contentType);
        builder.keysClocks(this.keysClocks);
        return builder;
    }

    /**
     * @return returns a new Builder.
     */
    public static Builder builder() {
        return new Builder();
    }

    /**
     * Builder for {@link PushQueueItemsInput}.
     */
    public static final class Builder implements ShapeBuilder<PushQueueItemsInput> {
        private final PresenceTracker tracker = PresenceTracker.of($SCHEMA);
        private String queueName;
        private String contentType;
        private Document keysClocks;

        private Builder() {}

        @Override
        public Schema schema() {
            return $SCHEMA;
        }

        /**
         * <p><strong>Required</strong>
         * @return this builder.
         */
        public Builder queueName(String queueName) {
            this.queueName = Objects.requireNonNull(queueName, "queueName cannot be null");
            tracker.setMember($SCHEMA_QUEUE_NAME);
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
        public Builder keysClocks(Document keysClocks) {
            this.keysClocks = Objects.requireNonNull(keysClocks, "keysClocks cannot be null");
            tracker.setMember($SCHEMA_KEYS_CLOCKS);
            return this;
        }

        @Override
        public PushQueueItemsInput build() {
            tracker.validate();
            return new PushQueueItemsInput(this);
        }

        @Override
        @SuppressWarnings("unchecked")
        public void setMemberValue(Schema member, Object value) {
            switch (member.memberIndex()) {
                case 0 -> queueName((String) SchemaUtils.validateSameMember($SCHEMA_QUEUE_NAME, member, value));
                case 1 -> contentType((String) SchemaUtils.validateSameMember($SCHEMA_CONTENT_TYPE, member, value));
                case 2 -> keysClocks((Document) SchemaUtils.validateSameMember($SCHEMA_KEYS_CLOCKS, member, value));
                default -> ShapeBuilder.super.setMemberValue(member, value);
            }
        }

        @Override
        public ShapeBuilder<PushQueueItemsInput> errorCorrection() {
            if (tracker.allSet()) {
                return this;
            }
            if (!tracker.checkMember($SCHEMA_QUEUE_NAME)) {
                queueName("");
            }
            if (!tracker.checkMember($SCHEMA_CONTENT_TYPE)) {
                contentType("");
            }
            if (!tracker.checkMember($SCHEMA_KEYS_CLOCKS)) {
                tracker.setMember($SCHEMA_KEYS_CLOCKS);
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
                    case 0 -> builder.queueName(de.readString(member));
                    case 1 -> builder.contentType(de.readString(member));
                    case 2 -> builder.keysClocks(de.readDocument());
                    default -> throw new IllegalArgumentException("Unexpected member: " + member.memberName());
                }
            }
        }
    }
}
