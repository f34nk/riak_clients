package openriak.v3_4.api.model;

import java.util.Objects;
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

/**
 * CRDT mutation payload. Wire shape depends on bucket datatype; counters may also accept a bare
 * integer. Sets, maps, and other types use datatype-specific operation fields documented in OtherAPI.
 */
@SmithyGenerated
public final class DatatypeUpdatePayload implements SerializableStruct {

    public static final Schema $SCHEMA = Schemas.DATATYPE_UPDATE_PAYLOAD;
    private static final Schema $SCHEMA_INCREMENT = $SCHEMA.member("increment");
    private static final Schema $SCHEMA_DECREMENT = $SCHEMA.member("decrement");
    private static final Schema $SCHEMA_TYPE = $SCHEMA.member("type");
    private static final Schema $SCHEMA_VALUE = $SCHEMA.member("value");
    private static final Schema $SCHEMA_CONTEXT = $SCHEMA.member("context");

    public static final ShapeId $ID = $SCHEMA.id();

    private final transient Integer increment;
    private final transient Integer decrement;
    private final transient String type;
    private final transient Document value;
    private final transient String context;

    private DatatypeUpdatePayload(Builder builder) {
        this.increment = builder.increment;
        this.decrement = builder.decrement;
        this.type = builder.type;
        this.value = builder.value;
        this.context = builder.context;
    }

    public Integer getIncrement() {
        return increment;
    }

    public Integer getDecrement() {
        return decrement;
    }

    public String getType() {
        return type;
    }

    public Document getValue() {
        return value;
    }

    public String getContext() {
        return context;
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
        DatatypeUpdatePayload that = (DatatypeUpdatePayload) other;
        return Objects.equals(this.increment, that.increment)
               && Objects.equals(this.decrement, that.decrement)
               && Objects.equals(this.type, that.type)
               && Objects.equals(this.context, that.context)
               && Objects.equals(this.value, that.value);
    }

    @Override
    public int hashCode() {
        int $hc = Objects.hashCode(increment);
        $hc = 31 * $hc + Objects.hashCode(decrement);
        $hc = 31 * $hc + Objects.hashCode(type);
        $hc = 31 * $hc + Objects.hashCode(value);
        $hc = 31 * $hc + Objects.hashCode(context);
        return $hc;
    }

    @Override
    public Schema schema() {
        return $SCHEMA;
    }

    @Override
    public void serializeMembers(ShapeSerializer serializer) {
        if (increment != null) {
            serializer.writeInteger($SCHEMA_INCREMENT, increment);
        }
        if (decrement != null) {
            serializer.writeInteger($SCHEMA_DECREMENT, decrement);
        }
        if (type != null) {
            serializer.writeString($SCHEMA_TYPE, type);
        }
        if (value != null) {
            serializer.writeDocument($SCHEMA_VALUE, value);
        }
        if (context != null) {
            serializer.writeString($SCHEMA_CONTEXT, context);
        }
    }

    @Override
    @SuppressWarnings("unchecked")
    public <T> T getMemberValue(Schema member) {
        return switch (member.memberIndex()) {
            case 0 -> (T) SchemaUtils.validateSameMember($SCHEMA_INCREMENT, member, increment);
            case 1 -> (T) SchemaUtils.validateSameMember($SCHEMA_DECREMENT, member, decrement);
            case 2 -> (T) SchemaUtils.validateSameMember($SCHEMA_TYPE, member, type);
            case 3 -> (T) SchemaUtils.validateSameMember($SCHEMA_VALUE, member, value);
            case 4 -> (T) SchemaUtils.validateSameMember($SCHEMA_CONTEXT, member, context);
            default -> throw new IllegalArgumentException("Attempted to get non-existent member: " + member.id());
        };
    }

    /**
     * Create a new builder containing all the current property values of this object.
     *
     * <p><strong>Note:</strong> This method performs only a shallow copy of the original properties.
     *
     * @return a builder for {@link DatatypeUpdatePayload}.
     */
    public Builder toBuilder() {
        var builder = new Builder();
        builder.increment(this.increment);
        builder.decrement(this.decrement);
        builder.type(this.type);
        builder.value(this.value);
        builder.context(this.context);
        return builder;
    }

    /**
     * @return returns a new Builder.
     */
    public static Builder builder() {
        return new Builder();
    }

    /**
     * Builder for {@link DatatypeUpdatePayload}.
     */
    public static final class Builder implements ShapeBuilder<DatatypeUpdatePayload> {
        private Integer increment;
        private Integer decrement;
        private String type;
        private Document value;
        private String context;

        private Builder() {}

        @Override
        public Schema schema() {
            return $SCHEMA;
        }

        /**
         * @return this builder.
         */
        public Builder increment(Integer increment) {
            this.increment = increment;
            return this;
        }

        /**
         * @return this builder.
         */
        public Builder decrement(Integer decrement) {
            this.decrement = decrement;
            return this;
        }

        /**
         * @return this builder.
         */
        public Builder type(String type) {
            this.type = type;
            return this;
        }

        /**
         * @return this builder.
         */
        public Builder value(Document value) {
            this.value = value;
            return this;
        }

        /**
         * @return this builder.
         */
        public Builder context(String context) {
            this.context = context;
            return this;
        }

        @Override
        public DatatypeUpdatePayload build() {
            return new DatatypeUpdatePayload(this);
        }

        @Override
        @SuppressWarnings("unchecked")
        public void setMemberValue(Schema member, Object value) {
            switch (member.memberIndex()) {
                case 0 -> increment((Integer) SchemaUtils.validateSameMember($SCHEMA_INCREMENT, member, value));
                case 1 -> decrement((Integer) SchemaUtils.validateSameMember($SCHEMA_DECREMENT, member, value));
                case 2 -> type((String) SchemaUtils.validateSameMember($SCHEMA_TYPE, member, value));
                case 3 -> value((Document) SchemaUtils.validateSameMember($SCHEMA_VALUE, member, value));
                case 4 -> context((String) SchemaUtils.validateSameMember($SCHEMA_CONTEXT, member, value));
                default -> ShapeBuilder.super.setMemberValue(member, value);
            }
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
                    case 0 -> builder.increment(de.readInteger(member));
                    case 1 -> builder.decrement(de.readInteger(member));
                    case 2 -> builder.type(de.readString(member));
                    case 3 -> builder.value(de.readDocument());
                    case 4 -> builder.context(de.readString(member));
                    default -> throw new IllegalArgumentException("Unexpected member: " + member.memberName());
                }
            }
        }
    }
}
