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
public final class GetDefaultBucketQueryResultsInput implements SerializableStruct {

    public static final Schema $SCHEMA = Schemas.GET_DEFAULT_BUCKET_QUERY_RESULTS_INPUT;
    private static final Schema $SCHEMA_BUCKET = $SCHEMA.member("bucket");
    private static final Schema $SCHEMA_TIMEOUT = $SCHEMA.member("timeout");
    private static final Schema $SCHEMA_RESULT_QUEUE = $SCHEMA.member("resultQueue");
    private static final Schema $SCHEMA_MAX_RESULTS = $SCHEMA.member("maxResults");

    public static final ShapeId $ID = $SCHEMA.id();

    private final transient String bucket;
    private final transient Integer timeout;
    private final transient String resultQueue;
    private final transient Integer maxResults;

    private GetDefaultBucketQueryResultsInput(Builder builder) {
        this.bucket = builder.bucket;
        this.timeout = builder.timeout;
        this.resultQueue = builder.resultQueue;
        this.maxResults = builder.maxResults;
    }

    public String getBucket() {
        return bucket;
    }

    public Integer getTimeout() {
        return timeout;
    }

    public String getResultQueue() {
        return resultQueue;
    }

    public Integer getMaxResults() {
        return maxResults;
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
        GetDefaultBucketQueryResultsInput that = (GetDefaultBucketQueryResultsInput) other;
        return Objects.equals(this.timeout, that.timeout)
               && Objects.equals(this.maxResults, that.maxResults)
               && Objects.equals(this.bucket, that.bucket)
               && Objects.equals(this.resultQueue, that.resultQueue);
    }

    @Override
    public int hashCode() {
        int $hc = Objects.hashCode(bucket);
        $hc = 31 * $hc + Objects.hashCode(timeout);
        $hc = 31 * $hc + Objects.hashCode(resultQueue);
        $hc = 31 * $hc + Objects.hashCode(maxResults);
        return $hc;
    }

    @Override
    public Schema schema() {
        return $SCHEMA;
    }

    @Override
    public void serializeMembers(ShapeSerializer serializer) {
        serializer.writeString($SCHEMA_BUCKET, bucket);
        if (timeout != null) {
            serializer.writeInteger($SCHEMA_TIMEOUT, timeout);
        }
        serializer.writeString($SCHEMA_RESULT_QUEUE, resultQueue);
        if (maxResults != null) {
            serializer.writeInteger($SCHEMA_MAX_RESULTS, maxResults);
        }
    }

    @Override
    @SuppressWarnings("unchecked")
    public <T> T getMemberValue(Schema member) {
        return switch (member.memberIndex()) {
            case 0 -> (T) SchemaUtils.validateSameMember($SCHEMA_BUCKET, member, bucket);
            case 1 -> (T) SchemaUtils.validateSameMember($SCHEMA_RESULT_QUEUE, member, resultQueue);
            case 2 -> (T) SchemaUtils.validateSameMember($SCHEMA_TIMEOUT, member, timeout);
            case 3 -> (T) SchemaUtils.validateSameMember($SCHEMA_MAX_RESULTS, member, maxResults);
            default -> throw new IllegalArgumentException("Attempted to get non-existent member: " + member.id());
        };
    }

    /**
     * Create a new builder containing all the current property values of this object.
     *
     * <p><strong>Note:</strong> This method performs only a shallow copy of the original properties.
     *
     * @return a builder for {@link GetDefaultBucketQueryResultsInput}.
     */
    public Builder toBuilder() {
        var builder = new Builder();
        builder.bucket(this.bucket);
        builder.timeout(this.timeout);
        builder.resultQueue(this.resultQueue);
        builder.maxResults(this.maxResults);
        return builder;
    }

    /**
     * @return returns a new Builder.
     */
    public static Builder builder() {
        return new Builder();
    }

    /**
     * Builder for {@link GetDefaultBucketQueryResultsInput}.
     */
    public static final class Builder implements ShapeBuilder<GetDefaultBucketQueryResultsInput> {
        private final PresenceTracker tracker = PresenceTracker.of($SCHEMA);
        private String bucket;
        private Integer timeout;
        private String resultQueue;
        private Integer maxResults;

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
         * @return this builder.
         */
        public Builder timeout(Integer timeout) {
            this.timeout = timeout;
            return this;
        }

        /**
         * <p><strong>Required</strong>
         * @return this builder.
         */
        public Builder resultQueue(String resultQueue) {
            this.resultQueue = Objects.requireNonNull(resultQueue, "resultQueue cannot be null");
            tracker.setMember($SCHEMA_RESULT_QUEUE);
            return this;
        }

        /**
         * @return this builder.
         */
        public Builder maxResults(Integer maxResults) {
            this.maxResults = maxResults;
            return this;
        }

        @Override
        public GetDefaultBucketQueryResultsInput build() {
            tracker.validate();
            return new GetDefaultBucketQueryResultsInput(this);
        }

        @Override
        @SuppressWarnings("unchecked")
        public void setMemberValue(Schema member, Object value) {
            switch (member.memberIndex()) {
                case 0 -> bucket((String) SchemaUtils.validateSameMember($SCHEMA_BUCKET, member, value));
                case 1 -> resultQueue((String) SchemaUtils.validateSameMember($SCHEMA_RESULT_QUEUE, member, value));
                case 2 -> timeout((Integer) SchemaUtils.validateSameMember($SCHEMA_TIMEOUT, member, value));
                case 3 -> maxResults((Integer) SchemaUtils.validateSameMember($SCHEMA_MAX_RESULTS, member, value));
                default -> ShapeBuilder.super.setMemberValue(member, value);
            }
        }

        @Override
        public ShapeBuilder<GetDefaultBucketQueryResultsInput> errorCorrection() {
            if (tracker.allSet()) {
                return this;
            }
            if (!tracker.checkMember($SCHEMA_BUCKET)) {
                bucket("");
            }
            if (!tracker.checkMember($SCHEMA_RESULT_QUEUE)) {
                resultQueue("");
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
                    case 1 -> builder.resultQueue(de.readString(member));
                    case 2 -> builder.timeout(de.readInteger(member));
                    case 3 -> builder.maxResults(de.readInteger(member));
                    default -> throw new IllegalArgumentException("Unexpected member: " + member.memberName());
                }
            }
        }
    }
}
