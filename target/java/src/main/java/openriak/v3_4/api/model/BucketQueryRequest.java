package openriak.v3_4.api.model;

import java.util.Collections;
import java.util.List;
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

/**
 * Query request body. Wire JSON uses snake_case keys: query_list, aggregation_expression,
 * accumulation_option, accumulation_term, inactivity_timeout, max_results.
 */
@SmithyGenerated
public final class BucketQueryRequest implements SerializableStruct {

    public static final Schema $SCHEMA = Schemas.BUCKET_QUERY_REQUEST;
    private static final Schema $SCHEMA_QUERY_LIST = $SCHEMA.member("queryList");
    private static final Schema $SCHEMA_AGGREGATION_EXPRESSION = $SCHEMA.member("aggregationExpression");
    private static final Schema $SCHEMA_ACCUMULATION_OPTION = $SCHEMA.member("accumulationOption");
    private static final Schema $SCHEMA_ACCUMULATION_TERM = $SCHEMA.member("accumulationTerm");
    private static final Schema $SCHEMA_SUBSTITUTIONS = $SCHEMA.member("substitutions");
    private static final Schema $SCHEMA_TIMEOUT = $SCHEMA.member("timeout");
    private static final Schema $SCHEMA_INACTIVITY_TIMEOUT = $SCHEMA.member("inactivityTimeout");
    private static final Schema $SCHEMA_MAX_RESULTS = $SCHEMA.member("maxResults");
    private static final Schema $SCHEMA_CONTINUATION = $SCHEMA.member("continuation");

    public static final ShapeId $ID = $SCHEMA.id();

    private final transient List<QuerySpec> queryList;
    private final transient String aggregationExpression;
    private final transient String accumulationOption;
    private final transient String accumulationTerm;
    private final transient Document substitutions;
    private final transient Integer timeout;
    private final transient Integer inactivityTimeout;
    private final transient Integer maxResults;
    private final transient String continuation;

    private BucketQueryRequest(Builder builder) {
        this.queryList = Collections.unmodifiableList(builder.queryList);
        this.aggregationExpression = builder.aggregationExpression;
        this.accumulationOption = builder.accumulationOption;
        this.accumulationTerm = builder.accumulationTerm;
        this.substitutions = builder.substitutions;
        this.timeout = builder.timeout;
        this.inactivityTimeout = builder.inactivityTimeout;
        this.maxResults = builder.maxResults;
        this.continuation = builder.continuation;
    }

    public List<QuerySpec> getQueryList() {
        return queryList;
    }

    public boolean hasQueryList() {
        return true;
    }

    public String getAggregationExpression() {
        return aggregationExpression;
    }

    public String getAccumulationOption() {
        return accumulationOption;
    }

    public String getAccumulationTerm() {
        return accumulationTerm;
    }

    public Document getSubstitutions() {
        return substitutions;
    }

    public Integer getTimeout() {
        return timeout;
    }

    public Integer getInactivityTimeout() {
        return inactivityTimeout;
    }

    public Integer getMaxResults() {
        return maxResults;
    }

    public String getContinuation() {
        return continuation;
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
        BucketQueryRequest that = (BucketQueryRequest) other;
        return Objects.equals(this.timeout, that.timeout)
               && Objects.equals(this.inactivityTimeout, that.inactivityTimeout)
               && Objects.equals(this.maxResults, that.maxResults)
               && Objects.equals(this.aggregationExpression, that.aggregationExpression)
               && Objects.equals(this.accumulationOption, that.accumulationOption)
               && Objects.equals(this.accumulationTerm, that.accumulationTerm)
               && Objects.equals(this.continuation, that.continuation)
               && Objects.equals(this.queryList, that.queryList)
               && Objects.equals(this.substitutions, that.substitutions);
    }

    @Override
    public int hashCode() {
        int $hc = Objects.hashCode(queryList);
        $hc = 31 * $hc + Objects.hashCode(aggregationExpression);
        $hc = 31 * $hc + Objects.hashCode(accumulationOption);
        $hc = 31 * $hc + Objects.hashCode(accumulationTerm);
        $hc = 31 * $hc + Objects.hashCode(substitutions);
        $hc = 31 * $hc + Objects.hashCode(timeout);
        $hc = 31 * $hc + Objects.hashCode(inactivityTimeout);
        $hc = 31 * $hc + Objects.hashCode(maxResults);
        $hc = 31 * $hc + Objects.hashCode(continuation);
        return $hc;
    }

    @Override
    public Schema schema() {
        return $SCHEMA;
    }

    @Override
    public void serializeMembers(ShapeSerializer serializer) {
        serializer.writeList($SCHEMA_QUERY_LIST, queryList, queryList.size(), SharedSerde.QueryListSerializer.INSTANCE);
        if (aggregationExpression != null) {
            serializer.writeString($SCHEMA_AGGREGATION_EXPRESSION, aggregationExpression);
        }
        if (accumulationOption != null) {
            serializer.writeString($SCHEMA_ACCUMULATION_OPTION, accumulationOption);
        }
        if (accumulationTerm != null) {
            serializer.writeString($SCHEMA_ACCUMULATION_TERM, accumulationTerm);
        }
        if (substitutions != null) {
            serializer.writeDocument($SCHEMA_SUBSTITUTIONS, substitutions);
        }
        if (timeout != null) {
            serializer.writeInteger($SCHEMA_TIMEOUT, timeout);
        }
        if (inactivityTimeout != null) {
            serializer.writeInteger($SCHEMA_INACTIVITY_TIMEOUT, inactivityTimeout);
        }
        if (maxResults != null) {
            serializer.writeInteger($SCHEMA_MAX_RESULTS, maxResults);
        }
        if (continuation != null) {
            serializer.writeString($SCHEMA_CONTINUATION, continuation);
        }
    }

    @Override
    @SuppressWarnings("unchecked")
    public <T> T getMemberValue(Schema member) {
        return switch (member.memberIndex()) {
            case 0 -> (T) SchemaUtils.validateSameMember($SCHEMA_QUERY_LIST, member, queryList);
            case 1 -> (T) SchemaUtils.validateSameMember($SCHEMA_AGGREGATION_EXPRESSION, member, aggregationExpression);
            case 2 -> (T) SchemaUtils.validateSameMember($SCHEMA_ACCUMULATION_OPTION, member, accumulationOption);
            case 3 -> (T) SchemaUtils.validateSameMember($SCHEMA_ACCUMULATION_TERM, member, accumulationTerm);
            case 4 -> (T) SchemaUtils.validateSameMember($SCHEMA_SUBSTITUTIONS, member, substitutions);
            case 5 -> (T) SchemaUtils.validateSameMember($SCHEMA_TIMEOUT, member, timeout);
            case 6 -> (T) SchemaUtils.validateSameMember($SCHEMA_INACTIVITY_TIMEOUT, member, inactivityTimeout);
            case 7 -> (T) SchemaUtils.validateSameMember($SCHEMA_MAX_RESULTS, member, maxResults);
            case 8 -> (T) SchemaUtils.validateSameMember($SCHEMA_CONTINUATION, member, continuation);
            default -> throw new IllegalArgumentException("Attempted to get non-existent member: " + member.id());
        };
    }

    /**
     * Create a new builder containing all the current property values of this object.
     *
     * <p><strong>Note:</strong> This method performs only a shallow copy of the original properties.
     *
     * @return a builder for {@link BucketQueryRequest}.
     */
    public Builder toBuilder() {
        var builder = new Builder();
        builder.queryList(this.queryList);
        builder.aggregationExpression(this.aggregationExpression);
        builder.accumulationOption(this.accumulationOption);
        builder.accumulationTerm(this.accumulationTerm);
        builder.substitutions(this.substitutions);
        builder.timeout(this.timeout);
        builder.inactivityTimeout(this.inactivityTimeout);
        builder.maxResults(this.maxResults);
        builder.continuation(this.continuation);
        return builder;
    }

    /**
     * @return returns a new Builder.
     */
    public static Builder builder() {
        return new Builder();
    }

    /**
     * Builder for {@link BucketQueryRequest}.
     */
    public static final class Builder implements ShapeBuilder<BucketQueryRequest> {
        private final PresenceTracker tracker = PresenceTracker.of($SCHEMA);
        private List<QuerySpec> queryList;
        private String aggregationExpression;
        private String accumulationOption;
        private String accumulationTerm;
        private Document substitutions;
        private Integer timeout;
        private Integer inactivityTimeout;
        private Integer maxResults;
        private String continuation;

        private Builder() {}

        @Override
        public Schema schema() {
            return $SCHEMA;
        }

        /**
         * <p><strong>Required</strong>
         * @return this builder.
         */
        public Builder queryList(List<QuerySpec> queryList) {
            this.queryList = Objects.requireNonNull(queryList, "queryList cannot be null");
            tracker.setMember($SCHEMA_QUERY_LIST);
            return this;
        }

        /**
         * @return this builder.
         */
        public Builder aggregationExpression(String aggregationExpression) {
            this.aggregationExpression = aggregationExpression;
            return this;
        }

        /**
         * @return this builder.
         */
        public Builder accumulationOption(String accumulationOption) {
            this.accumulationOption = accumulationOption;
            return this;
        }

        /**
         * @return this builder.
         */
        public Builder accumulationTerm(String accumulationTerm) {
            this.accumulationTerm = accumulationTerm;
            return this;
        }

        /**
         * @return this builder.
         */
        public Builder substitutions(Document substitutions) {
            this.substitutions = substitutions;
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
        public Builder inactivityTimeout(Integer inactivityTimeout) {
            this.inactivityTimeout = inactivityTimeout;
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

        @Override
        public BucketQueryRequest build() {
            tracker.validate();
            return new BucketQueryRequest(this);
        }

        @Override
        @SuppressWarnings("unchecked")
        public void setMemberValue(Schema member, Object value) {
            switch (member.memberIndex()) {
                case 0 -> queryList((List<QuerySpec>) SchemaUtils.validateSameMember($SCHEMA_QUERY_LIST, member, value));
                case 1 -> aggregationExpression((String) SchemaUtils.validateSameMember($SCHEMA_AGGREGATION_EXPRESSION, member, value));
                case 2 -> accumulationOption((String) SchemaUtils.validateSameMember($SCHEMA_ACCUMULATION_OPTION, member, value));
                case 3 -> accumulationTerm((String) SchemaUtils.validateSameMember($SCHEMA_ACCUMULATION_TERM, member, value));
                case 4 -> substitutions((Document) SchemaUtils.validateSameMember($SCHEMA_SUBSTITUTIONS, member, value));
                case 5 -> timeout((Integer) SchemaUtils.validateSameMember($SCHEMA_TIMEOUT, member, value));
                case 6 -> inactivityTimeout((Integer) SchemaUtils.validateSameMember($SCHEMA_INACTIVITY_TIMEOUT, member, value));
                case 7 -> maxResults((Integer) SchemaUtils.validateSameMember($SCHEMA_MAX_RESULTS, member, value));
                case 8 -> continuation((String) SchemaUtils.validateSameMember($SCHEMA_CONTINUATION, member, value));
                default -> ShapeBuilder.super.setMemberValue(member, value);
            }
        }

        @Override
        public ShapeBuilder<BucketQueryRequest> errorCorrection() {
            if (tracker.allSet()) {
                return this;
            }
            if (!tracker.checkMember($SCHEMA_QUERY_LIST)) {
                queryList(Collections.emptyList());
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
                    case 0 -> builder.queryList(SharedSerde.deserializeQueryList(member, de));
                    case 1 -> builder.aggregationExpression(de.readString(member));
                    case 2 -> builder.accumulationOption(de.readString(member));
                    case 3 -> builder.accumulationTerm(de.readString(member));
                    case 4 -> builder.substitutions(de.readDocument());
                    case 5 -> builder.timeout(de.readInteger(member));
                    case 6 -> builder.inactivityTimeout(de.readInteger(member));
                    case 7 -> builder.maxResults(de.readInteger(member));
                    case 8 -> builder.continuation(de.readString(member));
                    default -> throw new IllegalArgumentException("Unexpected member: " + member.memberName());
                }
            }
        }
    }
}
