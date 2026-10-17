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
public final class GetMergeRootNvalInput implements SerializableStruct {

    public static final Schema $SCHEMA = Schemas.GET_MERGE_ROOT_NVAL_INPUT;
    private static final Schema $SCHEMA_N_VAL = $SCHEMA.member("nVal");
    private static final Schema $SCHEMA_TIMEOUT = $SCHEMA.member("timeout");

    public static final ShapeId $ID = $SCHEMA.id();

    private final transient int nVal;
    private final transient Integer timeout;

    private GetMergeRootNvalInput(Builder builder) {
        this.nVal = builder.nVal;
        this.timeout = builder.timeout;
    }

    public int getNVal() {
        return nVal;
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
        GetMergeRootNvalInput that = (GetMergeRootNvalInput) other;
        return this.nVal == that.nVal
               && Objects.equals(this.timeout, that.timeout);
    }

    @Override
    public int hashCode() {
        int $hc = Integer.hashCode(nVal);
        $hc = 31 * $hc + Objects.hashCode(timeout);
        return $hc;
    }

    @Override
    public Schema schema() {
        return $SCHEMA;
    }

    @Override
    public void serializeMembers(ShapeSerializer serializer) {
        serializer.writeInteger($SCHEMA_N_VAL, nVal);
        if (timeout != null) {
            serializer.writeInteger($SCHEMA_TIMEOUT, timeout);
        }
    }

    @Override
    @SuppressWarnings("unchecked")
    public <T> T getMemberValue(Schema member) {
        return switch (member.memberIndex()) {
            case 0 -> (T) SchemaUtils.validateSameMember($SCHEMA_N_VAL, member, nVal);
            case 1 -> (T) SchemaUtils.validateSameMember($SCHEMA_TIMEOUT, member, timeout);
            default -> throw new IllegalArgumentException("Attempted to get non-existent member: " + member.id());
        };
    }

    /**
     * Create a new builder containing all the current property values of this object.
     *
     * <p><strong>Note:</strong> This method performs only a shallow copy of the original properties.
     *
     * @return a builder for {@link GetMergeRootNvalInput}.
     */
    public Builder toBuilder() {
        var builder = new Builder();
        builder.nVal(this.nVal);
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
     * Builder for {@link GetMergeRootNvalInput}.
     */
    public static final class Builder implements ShapeBuilder<GetMergeRootNvalInput> {
        private final PresenceTracker tracker = PresenceTracker.of($SCHEMA);
        private int nVal;
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
        public Builder nVal(int nVal) {
            this.nVal = nVal;
            tracker.setMember($SCHEMA_N_VAL);
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
        public GetMergeRootNvalInput build() {
            tracker.validate();
            return new GetMergeRootNvalInput(this);
        }

        @Override
        @SuppressWarnings("unchecked")
        public void setMemberValue(Schema member, Object value) {
            switch (member.memberIndex()) {
                case 0 -> nVal((int) SchemaUtils.validateSameMember($SCHEMA_N_VAL, member, value));
                case 1 -> timeout((Integer) SchemaUtils.validateSameMember($SCHEMA_TIMEOUT, member, value));
                default -> ShapeBuilder.super.setMemberValue(member, value);
            }
        }

        @Override
        public ShapeBuilder<GetMergeRootNvalInput> errorCorrection() {
            if (tracker.allSet()) {
                return this;
            }
            if (!tracker.checkMember($SCHEMA_N_VAL)) {
                tracker.setMember($SCHEMA_N_VAL);
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
                    case 0 -> builder.nVal(de.readInteger(member));
                    case 1 -> builder.timeout(de.readInteger(member));
                    default -> throw new IllegalArgumentException("Unexpected member: " + member.memberName());
                }
            }
        }
    }
}
