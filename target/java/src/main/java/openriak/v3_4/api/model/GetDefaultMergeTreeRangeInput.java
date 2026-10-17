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
public final class GetDefaultMergeTreeRangeInput implements SerializableStruct {

    public static final Schema $SCHEMA = Schemas.GET_DEFAULT_MERGE_TREE_RANGE_INPUT;
    private static final Schema $SCHEMA_BUCKET = $SCHEMA.member("bucket");
    private static final Schema $SCHEMA_TREE_SIZE = $SCHEMA.member("treeSize");
    private static final Schema $SCHEMA_FILTER = $SCHEMA.member("filter");
    private static final Schema $SCHEMA_TIMEOUT = $SCHEMA.member("timeout");

    public static final ShapeId $ID = $SCHEMA.id();

    private final transient String bucket;
    private final transient String treeSize;
    private final transient String filter;
    private final transient Integer timeout;

    private GetDefaultMergeTreeRangeInput(Builder builder) {
        this.bucket = builder.bucket;
        this.treeSize = builder.treeSize;
        this.filter = builder.filter;
        this.timeout = builder.timeout;
    }

    public String getBucket() {
        return bucket;
    }

    public String getTreeSize() {
        return treeSize;
    }

    public String getFilter() {
        return filter;
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
        GetDefaultMergeTreeRangeInput that = (GetDefaultMergeTreeRangeInput) other;
        return Objects.equals(this.timeout, that.timeout)
               && Objects.equals(this.bucket, that.bucket)
               && Objects.equals(this.treeSize, that.treeSize)
               && Objects.equals(this.filter, that.filter);
    }

    @Override
    public int hashCode() {
        int $hc = Objects.hashCode(bucket);
        $hc = 31 * $hc + Objects.hashCode(treeSize);
        $hc = 31 * $hc + Objects.hashCode(filter);
        $hc = 31 * $hc + Objects.hashCode(timeout);
        return $hc;
    }

    @Override
    public Schema schema() {
        return $SCHEMA;
    }

    @Override
    public void serializeMembers(ShapeSerializer serializer) {
        serializer.writeString($SCHEMA_BUCKET, bucket);
        serializer.writeString($SCHEMA_TREE_SIZE, treeSize);
        if (filter != null) {
            serializer.writeString($SCHEMA_FILTER, filter);
        }
        if (timeout != null) {
            serializer.writeInteger($SCHEMA_TIMEOUT, timeout);
        }
    }

    @Override
    @SuppressWarnings("unchecked")
    public <T> T getMemberValue(Schema member) {
        return switch (member.memberIndex()) {
            case 0 -> (T) SchemaUtils.validateSameMember($SCHEMA_BUCKET, member, bucket);
            case 1 -> (T) SchemaUtils.validateSameMember($SCHEMA_TREE_SIZE, member, treeSize);
            case 2 -> (T) SchemaUtils.validateSameMember($SCHEMA_FILTER, member, filter);
            case 3 -> (T) SchemaUtils.validateSameMember($SCHEMA_TIMEOUT, member, timeout);
            default -> throw new IllegalArgumentException("Attempted to get non-existent member: " + member.id());
        };
    }

    /**
     * Create a new builder containing all the current property values of this object.
     *
     * <p><strong>Note:</strong> This method performs only a shallow copy of the original properties.
     *
     * @return a builder for {@link GetDefaultMergeTreeRangeInput}.
     */
    public Builder toBuilder() {
        var builder = new Builder();
        builder.bucket(this.bucket);
        builder.treeSize(this.treeSize);
        builder.filter(this.filter);
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
     * Builder for {@link GetDefaultMergeTreeRangeInput}.
     */
    public static final class Builder implements ShapeBuilder<GetDefaultMergeTreeRangeInput> {
        private final PresenceTracker tracker = PresenceTracker.of($SCHEMA);
        private String bucket;
        private String treeSize;
        private String filter;
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
        public Builder bucket(String bucket) {
            this.bucket = Objects.requireNonNull(bucket, "bucket cannot be null");
            tracker.setMember($SCHEMA_BUCKET);
            return this;
        }

        /**
         * <p><strong>Required</strong>
         * @return this builder.
         */
        public Builder treeSize(String treeSize) {
            this.treeSize = Objects.requireNonNull(treeSize, "treeSize cannot be null");
            tracker.setMember($SCHEMA_TREE_SIZE);
            return this;
        }

        /**
         * @return this builder.
         */
        public Builder filter(String filter) {
            this.filter = filter;
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
        public GetDefaultMergeTreeRangeInput build() {
            tracker.validate();
            return new GetDefaultMergeTreeRangeInput(this);
        }

        @Override
        @SuppressWarnings("unchecked")
        public void setMemberValue(Schema member, Object value) {
            switch (member.memberIndex()) {
                case 0 -> bucket((String) SchemaUtils.validateSameMember($SCHEMA_BUCKET, member, value));
                case 1 -> treeSize((String) SchemaUtils.validateSameMember($SCHEMA_TREE_SIZE, member, value));
                case 2 -> filter((String) SchemaUtils.validateSameMember($SCHEMA_FILTER, member, value));
                case 3 -> timeout((Integer) SchemaUtils.validateSameMember($SCHEMA_TIMEOUT, member, value));
                default -> ShapeBuilder.super.setMemberValue(member, value);
            }
        }

        @Override
        public ShapeBuilder<GetDefaultMergeTreeRangeInput> errorCorrection() {
            if (tracker.allSet()) {
                return this;
            }
            if (!tracker.checkMember($SCHEMA_BUCKET)) {
                bucket("");
            }
            if (!tracker.checkMember($SCHEMA_TREE_SIZE)) {
                treeSize("");
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
                    case 1 -> builder.treeSize(de.readString(member));
                    case 2 -> builder.filter(de.readString(member));
                    case 3 -> builder.timeout(de.readInteger(member));
                    default -> throw new IllegalArgumentException("Unexpected member: " + member.memberName());
                }
            }
        }
    }
}
