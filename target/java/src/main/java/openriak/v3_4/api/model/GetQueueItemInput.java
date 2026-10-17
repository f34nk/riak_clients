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
public final class GetQueueItemInput implements SerializableStruct {

    public static final Schema $SCHEMA = Schemas.GET_QUEUE_ITEM_INPUT;
    private static final Schema $SCHEMA_QUEUE_NAME = $SCHEMA.member("queueName");
    private static final Schema $SCHEMA_OBJECT_FORMAT = $SCHEMA.member("objectFormat");

    public static final ShapeId $ID = $SCHEMA.id();

    private final transient String queueName;
    private final transient QueueObjectFormat objectFormat;

    private GetQueueItemInput(Builder builder) {
        this.queueName = builder.queueName;
        this.objectFormat = builder.objectFormat;
    }

    public String getQueueName() {
        return queueName;
    }

    public QueueObjectFormat getObjectFormat() {
        return objectFormat;
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
        GetQueueItemInput that = (GetQueueItemInput) other;
        return Objects.equals(this.queueName, that.queueName)
               && Objects.equals(this.objectFormat, that.objectFormat);
    }

    @Override
    public int hashCode() {
        int $hc = Objects.hashCode(queueName);
        $hc = 31 * $hc + Objects.hashCode(objectFormat);
        return $hc;
    }

    @Override
    public Schema schema() {
        return $SCHEMA;
    }

    @Override
    public void serializeMembers(ShapeSerializer serializer) {
        serializer.writeString($SCHEMA_QUEUE_NAME, queueName);
        if (objectFormat != null) {
            serializer.writeString($SCHEMA_OBJECT_FORMAT, objectFormat.getValue());
        }
    }

    @Override
    @SuppressWarnings("unchecked")
    public <T> T getMemberValue(Schema member) {
        return switch (member.memberIndex()) {
            case 0 -> (T) SchemaUtils.validateSameMember($SCHEMA_QUEUE_NAME, member, queueName);
            case 1 -> (T) SchemaUtils.validateSameMember($SCHEMA_OBJECT_FORMAT, member, objectFormat);
            default -> throw new IllegalArgumentException("Attempted to get non-existent member: " + member.id());
        };
    }

    /**
     * Create a new builder containing all the current property values of this object.
     *
     * <p><strong>Note:</strong> This method performs only a shallow copy of the original properties.
     *
     * @return a builder for {@link GetQueueItemInput}.
     */
    public Builder toBuilder() {
        var builder = new Builder();
        builder.queueName(this.queueName);
        builder.objectFormat(this.objectFormat);
        return builder;
    }

    /**
     * @return returns a new Builder.
     */
    public static Builder builder() {
        return new Builder();
    }

    /**
     * Builder for {@link GetQueueItemInput}.
     */
    public static final class Builder implements ShapeBuilder<GetQueueItemInput> {
        private final PresenceTracker tracker = PresenceTracker.of($SCHEMA);
        private String queueName;
        private QueueObjectFormat objectFormat;

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
         * @return this builder.
         */
        public Builder objectFormat(QueueObjectFormat objectFormat) {
            this.objectFormat = objectFormat;
            return this;
        }

        @Override
        public GetQueueItemInput build() {
            tracker.validate();
            return new GetQueueItemInput(this);
        }

        @Override
        @SuppressWarnings("unchecked")
        public void setMemberValue(Schema member, Object value) {
            switch (member.memberIndex()) {
                case 0 -> queueName((String) SchemaUtils.validateSameMember($SCHEMA_QUEUE_NAME, member, value));
                case 1 -> objectFormat((QueueObjectFormat) SchemaUtils.validateSameMember($SCHEMA_OBJECT_FORMAT, member, value));
                default -> ShapeBuilder.super.setMemberValue(member, value);
            }
        }

        @Override
        public ShapeBuilder<GetQueueItemInput> errorCorrection() {
            if (tracker.allSet()) {
                return this;
            }
            if (!tracker.checkMember($SCHEMA_QUEUE_NAME)) {
                queueName("");
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
                    case 1 -> builder.objectFormat(QueueObjectFormat.builder().deserializeMember(de, member).build());
                    default -> throw new IllegalArgumentException("Unexpected member: " + member.memberName());
                }
            }
        }
    }
}
