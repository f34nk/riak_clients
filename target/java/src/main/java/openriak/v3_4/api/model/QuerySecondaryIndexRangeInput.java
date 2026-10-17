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
public final class QuerySecondaryIndexRangeInput implements SerializableStruct {

    public static final Schema $SCHEMA = Schemas.QUERY_SECONDARY_INDEX_RANGE_INPUT;
    private static final Schema $SCHEMA_BUCKET_TYPE = $SCHEMA.member("bucketType");
    private static final Schema $SCHEMA_BUCKET = $SCHEMA.member("bucket");
    private static final Schema $SCHEMA_TIMEOUT = $SCHEMA.member("timeout");
    private static final Schema $SCHEMA_MAX_RESULTS = $SCHEMA.member("maxResults");
    private static final Schema $SCHEMA_CONTINUATION = $SCHEMA.member("continuation");
    private static final Schema $SCHEMA_RETURN_TERMS = $SCHEMA.member("returnTerms");
    private static final Schema $SCHEMA_PAGINATION_SORT = $SCHEMA.member("paginationSort");
    private static final Schema $SCHEMA_TERM_REGEX = $SCHEMA.member("termRegex");
    private static final Schema $SCHEMA_FIELD = $SCHEMA.member("field");
    private static final Schema $SCHEMA_START = $SCHEMA.member("start");
    private static final Schema $SCHEMA_END = $SCHEMA.member("end");

    public static final ShapeId $ID = $SCHEMA.id();

    private final transient String bucketType;
    private final transient String bucket;
    private final transient Integer timeout;
    private final transient Integer maxResults;
    private final transient String continuation;
    private final transient Boolean returnTerms;
    private final transient Boolean paginationSort;
    private final transient String termRegex;
    private final transient String field;
    private final transient String start;
    private final transient String end;

    private QuerySecondaryIndexRangeInput(Builder builder) {
        this.bucketType = builder.bucketType;
        this.bucket = builder.bucket;
        this.timeout = builder.timeout;
        this.maxResults = builder.maxResults;
        this.continuation = builder.continuation;
        this.returnTerms = builder.returnTerms;
        this.paginationSort = builder.paginationSort;
        this.termRegex = builder.termRegex;
        this.field = builder.field;
        this.start = builder.start;
        this.end = builder.end;
    }

    public String getBucketType() {
        return bucketType;
    }

    public String getBucket() {
        return bucket;
    }

    public Integer getTimeout() {
        return timeout;
    }

    public Integer getMaxResults() {
        return maxResults;
    }

    public String getContinuation() {
        return continuation;
    }

    public Boolean isReturnTerms() {
        return returnTerms;
    }

    public Boolean isPaginationSort() {
        return paginationSort;
    }

    public String getTermRegex() {
        return termRegex;
    }

    public String getField() {
        return field;
    }

    public String getStart() {
        return start;
    }

    public String getEnd() {
        return end;
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
        QuerySecondaryIndexRangeInput that = (QuerySecondaryIndexRangeInput) other;
        return Objects.equals(this.returnTerms, that.returnTerms)
               && Objects.equals(this.paginationSort, that.paginationSort)
               && Objects.equals(this.timeout, that.timeout)
               && Objects.equals(this.maxResults, that.maxResults)
               && Objects.equals(this.bucketType, that.bucketType)
               && Objects.equals(this.bucket, that.bucket)
               && Objects.equals(this.continuation, that.continuation)
               && Objects.equals(this.termRegex, that.termRegex)
               && Objects.equals(this.field, that.field)
               && Objects.equals(this.start, that.start)
               && Objects.equals(this.end, that.end);
    }

    @Override
    public int hashCode() {
        int $hc = Objects.hashCode(bucketType);
        $hc = 31 * $hc + Objects.hashCode(bucket);
        $hc = 31 * $hc + Objects.hashCode(timeout);
        $hc = 31 * $hc + Objects.hashCode(maxResults);
        $hc = 31 * $hc + Objects.hashCode(continuation);
        $hc = 31 * $hc + Objects.hashCode(returnTerms);
        $hc = 31 * $hc + Objects.hashCode(paginationSort);
        $hc = 31 * $hc + Objects.hashCode(termRegex);
        $hc = 31 * $hc + Objects.hashCode(field);
        $hc = 31 * $hc + Objects.hashCode(start);
        $hc = 31 * $hc + Objects.hashCode(end);
        return $hc;
    }

    @Override
    public Schema schema() {
        return $SCHEMA;
    }

    @Override
    public void serializeMembers(ShapeSerializer serializer) {
        serializer.writeString($SCHEMA_BUCKET_TYPE, bucketType);
        serializer.writeString($SCHEMA_BUCKET, bucket);
        if (timeout != null) {
            serializer.writeInteger($SCHEMA_TIMEOUT, timeout);
        }
        if (maxResults != null) {
            serializer.writeInteger($SCHEMA_MAX_RESULTS, maxResults);
        }
        if (continuation != null) {
            serializer.writeString($SCHEMA_CONTINUATION, continuation);
        }
        if (returnTerms != null) {
            serializer.writeBoolean($SCHEMA_RETURN_TERMS, returnTerms);
        }
        if (paginationSort != null) {
            serializer.writeBoolean($SCHEMA_PAGINATION_SORT, paginationSort);
        }
        if (termRegex != null) {
            serializer.writeString($SCHEMA_TERM_REGEX, termRegex);
        }
        serializer.writeString($SCHEMA_FIELD, field);
        serializer.writeString($SCHEMA_START, start);
        serializer.writeString($SCHEMA_END, end);
    }

    @Override
    @SuppressWarnings("unchecked")
    public <T> T getMemberValue(Schema member) {
        return switch (member.memberIndex()) {
            case 0 -> (T) SchemaUtils.validateSameMember($SCHEMA_BUCKET_TYPE, member, bucketType);
            case 1 -> (T) SchemaUtils.validateSameMember($SCHEMA_BUCKET, member, bucket);
            case 2 -> (T) SchemaUtils.validateSameMember($SCHEMA_FIELD, member, field);
            case 3 -> (T) SchemaUtils.validateSameMember($SCHEMA_START, member, start);
            case 4 -> (T) SchemaUtils.validateSameMember($SCHEMA_END, member, end);
            case 5 -> (T) SchemaUtils.validateSameMember($SCHEMA_TIMEOUT, member, timeout);
            case 6 -> (T) SchemaUtils.validateSameMember($SCHEMA_MAX_RESULTS, member, maxResults);
            case 7 -> (T) SchemaUtils.validateSameMember($SCHEMA_CONTINUATION, member, continuation);
            case 8 -> (T) SchemaUtils.validateSameMember($SCHEMA_RETURN_TERMS, member, returnTerms);
            case 9 -> (T) SchemaUtils.validateSameMember($SCHEMA_PAGINATION_SORT, member, paginationSort);
            case 10 -> (T) SchemaUtils.validateSameMember($SCHEMA_TERM_REGEX, member, termRegex);
            default -> throw new IllegalArgumentException("Attempted to get non-existent member: " + member.id());
        };
    }

    /**
     * Create a new builder containing all the current property values of this object.
     *
     * <p><strong>Note:</strong> This method performs only a shallow copy of the original properties.
     *
     * @return a builder for {@link QuerySecondaryIndexRangeInput}.
     */
    public Builder toBuilder() {
        var builder = new Builder();
        builder.bucketType(this.bucketType);
        builder.bucket(this.bucket);
        builder.timeout(this.timeout);
        builder.maxResults(this.maxResults);
        builder.continuation(this.continuation);
        builder.returnTerms(this.returnTerms);
        builder.paginationSort(this.paginationSort);
        builder.termRegex(this.termRegex);
        builder.field(this.field);
        builder.start(this.start);
        builder.end(this.end);
        return builder;
    }

    /**
     * @return returns a new Builder.
     */
    public static Builder builder() {
        return new Builder();
    }

    /**
     * Builder for {@link QuerySecondaryIndexRangeInput}.
     */
    public static final class Builder implements ShapeBuilder<QuerySecondaryIndexRangeInput> {
        private final PresenceTracker tracker = PresenceTracker.of($SCHEMA);
        private String bucketType;
        private String bucket;
        private Integer timeout;
        private Integer maxResults;
        private String continuation;
        private Boolean returnTerms;
        private Boolean paginationSort;
        private String termRegex;
        private String field;
        private String start;
        private String end;

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
         * @return this builder.
         */
        public Builder maxResults(Integer maxResults) {
            this.maxResults = maxResults;
            return this;
        }

        /**
         * @return this builder.
         */
        public Builder continuation(String continuation) {
            this.continuation = continuation;
            return this;
        }

        /**
         * @return this builder.
         */
        public Builder returnTerms(Boolean returnTerms) {
            this.returnTerms = returnTerms;
            return this;
        }

        /**
         * @return this builder.
         */
        public Builder paginationSort(Boolean paginationSort) {
            this.paginationSort = paginationSort;
            return this;
        }

        /**
         * @return this builder.
         */
        public Builder termRegex(String termRegex) {
            this.termRegex = termRegex;
            return this;
        }

        /**
         * <p><strong>Required</strong>
         * @return this builder.
         */
        public Builder field(String field) {
            this.field = Objects.requireNonNull(field, "field cannot be null");
            tracker.setMember($SCHEMA_FIELD);
            return this;
        }

        /**
         * <p><strong>Required</strong>
         * @return this builder.
         */
        public Builder start(String start) {
            this.start = Objects.requireNonNull(start, "start cannot be null");
            tracker.setMember($SCHEMA_START);
            return this;
        }

        /**
         * <p><strong>Required</strong>
         * @return this builder.
         */
        public Builder end(String end) {
            this.end = Objects.requireNonNull(end, "end cannot be null");
            tracker.setMember($SCHEMA_END);
            return this;
        }

        @Override
        public QuerySecondaryIndexRangeInput build() {
            tracker.validate();
            return new QuerySecondaryIndexRangeInput(this);
        }

        @Override
        @SuppressWarnings("unchecked")
        public void setMemberValue(Schema member, Object value) {
            switch (member.memberIndex()) {
                case 0 -> bucketType((String) SchemaUtils.validateSameMember($SCHEMA_BUCKET_TYPE, member, value));
                case 1 -> bucket((String) SchemaUtils.validateSameMember($SCHEMA_BUCKET, member, value));
                case 2 -> field((String) SchemaUtils.validateSameMember($SCHEMA_FIELD, member, value));
                case 3 -> start((String) SchemaUtils.validateSameMember($SCHEMA_START, member, value));
                case 4 -> end((String) SchemaUtils.validateSameMember($SCHEMA_END, member, value));
                case 5 -> timeout((Integer) SchemaUtils.validateSameMember($SCHEMA_TIMEOUT, member, value));
                case 6 -> maxResults((Integer) SchemaUtils.validateSameMember($SCHEMA_MAX_RESULTS, member, value));
                case 7 -> continuation((String) SchemaUtils.validateSameMember($SCHEMA_CONTINUATION, member, value));
                case 8 -> returnTerms((Boolean) SchemaUtils.validateSameMember($SCHEMA_RETURN_TERMS, member, value));
                case 9 -> paginationSort((Boolean) SchemaUtils.validateSameMember($SCHEMA_PAGINATION_SORT, member, value));
                case 10 -> termRegex((String) SchemaUtils.validateSameMember($SCHEMA_TERM_REGEX, member, value));
                default -> ShapeBuilder.super.setMemberValue(member, value);
            }
        }

        @Override
        public ShapeBuilder<QuerySecondaryIndexRangeInput> errorCorrection() {
            if (tracker.allSet()) {
                return this;
            }
            if (!tracker.checkMember($SCHEMA_BUCKET_TYPE)) {
                bucketType("");
            }
            if (!tracker.checkMember($SCHEMA_BUCKET)) {
                bucket("");
            }
            if (!tracker.checkMember($SCHEMA_FIELD)) {
                field("");
            }
            if (!tracker.checkMember($SCHEMA_START)) {
                start("");
            }
            if (!tracker.checkMember($SCHEMA_END)) {
                end("");
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
                    case 1 -> builder.bucket(de.readString(member));
                    case 2 -> builder.field(de.readString(member));
                    case 3 -> builder.start(de.readString(member));
                    case 4 -> builder.end(de.readString(member));
                    case 5 -> builder.timeout(de.readInteger(member));
                    case 6 -> builder.maxResults(de.readInteger(member));
                    case 7 -> builder.continuation(de.readString(member));
                    case 8 -> builder.returnTerms(de.readBoolean(member));
                    case 9 -> builder.paginationSort(de.readBoolean(member));
                    case 10 -> builder.termRegex(de.readString(member));
                    default -> throw new IllegalArgumentException("Unexpected member: " + member.memberName());
                }
            }
        }
    }
}
