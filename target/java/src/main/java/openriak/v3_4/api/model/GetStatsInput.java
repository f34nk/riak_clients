package openriak.v3_4.api.model;

import java.util.Objects;
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
public final class GetStatsInput implements SerializableStruct {

    public static final Schema $SCHEMA = Schemas.GET_STATS_INPUT;
    private static final Schema $SCHEMA_TIMEOUT = $SCHEMA.member("timeout");
    private static final Schema $SCHEMA_ACCEPT = $SCHEMA.member("accept");

    public static final ShapeId $ID = $SCHEMA.id();

    private final transient Integer timeout;
    private final transient String accept;

    private GetStatsInput(Builder builder) {
        this.timeout = builder.timeout;
        this.accept = builder.accept;
    }

    public Integer getTimeout() {
        return timeout;
    }

    public String getAccept() {
        return accept;
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
        GetStatsInput that = (GetStatsInput) other;
        return Objects.equals(this.timeout, that.timeout)
               && Objects.equals(this.accept, that.accept);
    }

    @Override
    public int hashCode() {
        int $hc = Objects.hashCode(timeout);
        $hc = 31 * $hc + Objects.hashCode(accept);
        return $hc;
    }

    @Override
    public Schema schema() {
        return $SCHEMA;
    }

    @Override
    public void serializeMembers(ShapeSerializer serializer) {
        if (timeout != null) {
            serializer.writeInteger($SCHEMA_TIMEOUT, timeout);
        }
        if (accept != null) {
            serializer.writeString($SCHEMA_ACCEPT, accept);
        }
    }

    @Override
    @SuppressWarnings("unchecked")
    public <T> T getMemberValue(Schema member) {
        return switch (member.memberIndex()) {
            case 0 -> (T) SchemaUtils.validateSameMember($SCHEMA_TIMEOUT, member, timeout);
            case 1 -> (T) SchemaUtils.validateSameMember($SCHEMA_ACCEPT, member, accept);
            default -> throw new IllegalArgumentException("Attempted to get non-existent member: " + member.id());
        };
    }

    /**
     * Create a new builder containing all the current property values of this object.
     *
     * <p><strong>Note:</strong> This method performs only a shallow copy of the original properties.
     *
     * @return a builder for {@link GetStatsInput}.
     */
    public Builder toBuilder() {
        var builder = new Builder();
        builder.timeout(this.timeout);
        builder.accept(this.accept);
        return builder;
    }

    /**
     * @return returns a new Builder.
     */
    public static Builder builder() {
        return new Builder();
    }

    /**
     * Builder for {@link GetStatsInput}.
     */
    public static final class Builder implements ShapeBuilder<GetStatsInput> {
        private Integer timeout;
        private String accept;

        private Builder() {}

        @Override
        public Schema schema() {
            return $SCHEMA;
        }

        /**
         * @return this builder.
         */
        public Builder timeout(Integer timeout) {
            this.timeout = timeout;
            return this;
        }

        /**
         * @return this builder.
         */
        public Builder accept(String accept) {
            this.accept = accept;
            return this;
        }

        @Override
        public GetStatsInput build() {
            return new GetStatsInput(this);
        }

        @Override
        @SuppressWarnings("unchecked")
        public void setMemberValue(Schema member, Object value) {
            switch (member.memberIndex()) {
                case 0 -> timeout((Integer) SchemaUtils.validateSameMember($SCHEMA_TIMEOUT, member, value));
                case 1 -> accept((String) SchemaUtils.validateSameMember($SCHEMA_ACCEPT, member, value));
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
                    case 0 -> builder.timeout(de.readInteger(member));
                    case 1 -> builder.accept(de.readString(member));
                    default -> throw new IllegalArgumentException("Unexpected member: " + member.memberName());
                }
            }
        }
    }
}
