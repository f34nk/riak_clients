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
public final class MapReduceJob implements SerializableStruct {

    public static final Schema $SCHEMA = Schemas.MAP_REDUCE_JOB;
    private static final Schema $SCHEMA_INPUTS = $SCHEMA.member("inputs");
    private static final Schema $SCHEMA_QUERY = $SCHEMA.member("query");

    public static final ShapeId $ID = $SCHEMA.id();

    private final transient Document inputs;
    private final transient Document query;

    private MapReduceJob(Builder builder) {
        this.inputs = builder.inputs;
        this.query = builder.query;
    }

    public Document getInputs() {
        return inputs;
    }

    public Document getQuery() {
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
        MapReduceJob that = (MapReduceJob) other;
        return Objects.equals(this.inputs, that.inputs)
               && Objects.equals(this.query, that.query);
    }

    @Override
    public int hashCode() {
        int $hc = Objects.hashCode(inputs);
        $hc = 31 * $hc + Objects.hashCode(query);
        return $hc;
    }

    @Override
    public Schema schema() {
        return $SCHEMA;
    }

    @Override
    public void serializeMembers(ShapeSerializer serializer) {
        serializer.writeDocument($SCHEMA_INPUTS, inputs);
        serializer.writeDocument($SCHEMA_QUERY, query);
    }

    @Override
    @SuppressWarnings("unchecked")
    public <T> T getMemberValue(Schema member) {
        return switch (member.memberIndex()) {
            case 0 -> (T) SchemaUtils.validateSameMember($SCHEMA_INPUTS, member, inputs);
            case 1 -> (T) SchemaUtils.validateSameMember($SCHEMA_QUERY, member, query);
            default -> throw new IllegalArgumentException("Attempted to get non-existent member: " + member.id());
        };
    }

    /**
     * Create a new builder containing all the current property values of this object.
     *
     * <p><strong>Note:</strong> This method performs only a shallow copy of the original properties.
     *
     * @return a builder for {@link MapReduceJob}.
     */
    public Builder toBuilder() {
        var builder = new Builder();
        builder.inputs(this.inputs);
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
     * Builder for {@link MapReduceJob}.
     */
    public static final class Builder implements ShapeBuilder<MapReduceJob> {
        private final PresenceTracker tracker = PresenceTracker.of($SCHEMA);
        private Document inputs;
        private Document query;

        private Builder() {}

        @Override
        public Schema schema() {
            return $SCHEMA;
        }

        /**
         * <p><strong>Required</strong>
         * @return this builder.
         */
        public Builder inputs(Document inputs) {
            this.inputs = Objects.requireNonNull(inputs, "inputs cannot be null");
            tracker.setMember($SCHEMA_INPUTS);
            return this;
        }

        /**
         * <p><strong>Required</strong>
         * @return this builder.
         */
        public Builder query(Document query) {
            this.query = Objects.requireNonNull(query, "query cannot be null");
            tracker.setMember($SCHEMA_QUERY);
            return this;
        }

        @Override
        public MapReduceJob build() {
            tracker.validate();
            return new MapReduceJob(this);
        }

        @Override
        @SuppressWarnings("unchecked")
        public void setMemberValue(Schema member, Object value) {
            switch (member.memberIndex()) {
                case 0 -> inputs((Document) SchemaUtils.validateSameMember($SCHEMA_INPUTS, member, value));
                case 1 -> query((Document) SchemaUtils.validateSameMember($SCHEMA_QUERY, member, value));
                default -> ShapeBuilder.super.setMemberValue(member, value);
            }
        }

        @Override
        public ShapeBuilder<MapReduceJob> errorCorrection() {
            if (tracker.allSet()) {
                return this;
            }
            if (!tracker.checkMember($SCHEMA_INPUTS)) {
                tracker.setMember($SCHEMA_INPUTS);
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
                    case 0 -> builder.inputs(de.readDocument());
                    case 1 -> builder.query(de.readDocument());
                    default -> throw new IllegalArgumentException("Unexpected member: " + member.memberName());
                }
            }
        }
    }
}
