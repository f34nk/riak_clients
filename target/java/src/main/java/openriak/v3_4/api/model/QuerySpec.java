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
public final class QuerySpec implements SerializableStruct {

    public static final Schema $SCHEMA = Schemas.QUERY_SPEC;
    private static final Schema $SCHEMA_INDEX_NAME = $SCHEMA.member("indexName");
    private static final Schema $SCHEMA_START_TERM = $SCHEMA.member("startTerm");
    private static final Schema $SCHEMA_END_TERM = $SCHEMA.member("endTerm");
    private static final Schema $SCHEMA_AGGREGATION_TAG = $SCHEMA.member("aggregationTag");
    private static final Schema $SCHEMA_REGULAR_EXPRESSION = $SCHEMA.member("regularExpression");
    private static final Schema $SCHEMA_EVALUATION_EXPRESSION = $SCHEMA.member("evaluationExpression");
    private static final Schema $SCHEMA_FILTER_EXPRESSION = $SCHEMA.member("filterExpression");

    public static final ShapeId $ID = $SCHEMA.id();

    private final transient String indexName;
    private final transient String startTerm;
    private final transient String endTerm;
    private final transient String aggregationTag;
    private final transient String regularExpression;
    private final transient String evaluationExpression;
    private final transient String filterExpression;

    private QuerySpec(Builder builder) {
        this.indexName = builder.indexName;
        this.startTerm = builder.startTerm;
        this.endTerm = builder.endTerm;
        this.aggregationTag = builder.aggregationTag;
        this.regularExpression = builder.regularExpression;
        this.evaluationExpression = builder.evaluationExpression;
        this.filterExpression = builder.filterExpression;
    }

    public String getIndexName() {
        return indexName;
    }

    public String getStartTerm() {
        return startTerm;
    }

    public String getEndTerm() {
        return endTerm;
    }

    public String getAggregationTag() {
        return aggregationTag;
    }

    public String getRegularExpression() {
        return regularExpression;
    }

    public String getEvaluationExpression() {
        return evaluationExpression;
    }

    public String getFilterExpression() {
        return filterExpression;
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
        QuerySpec that = (QuerySpec) other;
        return Objects.equals(this.indexName, that.indexName)
               && Objects.equals(this.startTerm, that.startTerm)
               && Objects.equals(this.endTerm, that.endTerm)
               && Objects.equals(this.aggregationTag, that.aggregationTag)
               && Objects.equals(this.regularExpression, that.regularExpression)
               && Objects.equals(this.evaluationExpression, that.evaluationExpression)
               && Objects.equals(this.filterExpression, that.filterExpression);
    }

    @Override
    public int hashCode() {
        int $hc = Objects.hashCode(indexName);
        $hc = 31 * $hc + Objects.hashCode(startTerm);
        $hc = 31 * $hc + Objects.hashCode(endTerm);
        $hc = 31 * $hc + Objects.hashCode(aggregationTag);
        $hc = 31 * $hc + Objects.hashCode(regularExpression);
        $hc = 31 * $hc + Objects.hashCode(evaluationExpression);
        $hc = 31 * $hc + Objects.hashCode(filterExpression);
        return $hc;
    }

    @Override
    public Schema schema() {
        return $SCHEMA;
    }

    @Override
    public void serializeMembers(ShapeSerializer serializer) {
        serializer.writeString($SCHEMA_INDEX_NAME, indexName);
        if (startTerm != null) {
            serializer.writeString($SCHEMA_START_TERM, startTerm);
        }
        if (endTerm != null) {
            serializer.writeString($SCHEMA_END_TERM, endTerm);
        }
        if (aggregationTag != null) {
            serializer.writeString($SCHEMA_AGGREGATION_TAG, aggregationTag);
        }
        if (regularExpression != null) {
            serializer.writeString($SCHEMA_REGULAR_EXPRESSION, regularExpression);
        }
        if (evaluationExpression != null) {
            serializer.writeString($SCHEMA_EVALUATION_EXPRESSION, evaluationExpression);
        }
        if (filterExpression != null) {
            serializer.writeString($SCHEMA_FILTER_EXPRESSION, filterExpression);
        }
    }

    @Override
    @SuppressWarnings("unchecked")
    public <T> T getMemberValue(Schema member) {
        return switch (member.memberIndex()) {
            case 0 -> (T) SchemaUtils.validateSameMember($SCHEMA_INDEX_NAME, member, indexName);
            case 1 -> (T) SchemaUtils.validateSameMember($SCHEMA_START_TERM, member, startTerm);
            case 2 -> (T) SchemaUtils.validateSameMember($SCHEMA_END_TERM, member, endTerm);
            case 3 -> (T) SchemaUtils.validateSameMember($SCHEMA_AGGREGATION_TAG, member, aggregationTag);
            case 4 -> (T) SchemaUtils.validateSameMember($SCHEMA_REGULAR_EXPRESSION, member, regularExpression);
            case 5 -> (T) SchemaUtils.validateSameMember($SCHEMA_EVALUATION_EXPRESSION, member, evaluationExpression);
            case 6 -> (T) SchemaUtils.validateSameMember($SCHEMA_FILTER_EXPRESSION, member, filterExpression);
            default -> throw new IllegalArgumentException("Attempted to get non-existent member: " + member.id());
        };
    }

    /**
     * Create a new builder containing all the current property values of this object.
     *
     * <p><strong>Note:</strong> This method performs only a shallow copy of the original properties.
     *
     * @return a builder for {@link QuerySpec}.
     */
    public Builder toBuilder() {
        var builder = new Builder();
        builder.indexName(this.indexName);
        builder.startTerm(this.startTerm);
        builder.endTerm(this.endTerm);
        builder.aggregationTag(this.aggregationTag);
        builder.regularExpression(this.regularExpression);
        builder.evaluationExpression(this.evaluationExpression);
        builder.filterExpression(this.filterExpression);
        return builder;
    }

    /**
     * @return returns a new Builder.
     */
    public static Builder builder() {
        return new Builder();
    }

    /**
     * Builder for {@link QuerySpec}.
     */
    public static final class Builder implements ShapeBuilder<QuerySpec> {
        private final PresenceTracker tracker = PresenceTracker.of($SCHEMA);
        private String indexName;
        private String startTerm;
        private String endTerm;
        private String aggregationTag;
        private String regularExpression;
        private String evaluationExpression;
        private String filterExpression;

        private Builder() {}

        @Override
        public Schema schema() {
            return $SCHEMA;
        }

        /**
         * <p><strong>Required</strong>
         * @return this builder.
         */
        public Builder indexName(String indexName) {
            this.indexName = Objects.requireNonNull(indexName, "indexName cannot be null");
            tracker.setMember($SCHEMA_INDEX_NAME);
            return this;
        }

        /**
         * @return this builder.
         */
        public Builder startTerm(String startTerm) {
            this.startTerm = startTerm;
            return this;
        }

        /**
         * @return this builder.
         */
        public Builder endTerm(String endTerm) {
            this.endTerm = endTerm;
            return this;
        }

        /**
         * @return this builder.
         */
        public Builder aggregationTag(String aggregationTag) {
            this.aggregationTag = aggregationTag;
            return this;
        }

        /**
         * @return this builder.
         */
        public Builder regularExpression(String regularExpression) {
            this.regularExpression = regularExpression;
            return this;
        }

        /**
         * @return this builder.
         */
        public Builder evaluationExpression(String evaluationExpression) {
            this.evaluationExpression = evaluationExpression;
            return this;
        }

        /**
         * @return this builder.
         */
        public Builder filterExpression(String filterExpression) {
            this.filterExpression = filterExpression;
            return this;
        }

        @Override
        public QuerySpec build() {
            tracker.validate();
            return new QuerySpec(this);
        }

        @Override
        @SuppressWarnings("unchecked")
        public void setMemberValue(Schema member, Object value) {
            switch (member.memberIndex()) {
                case 0 -> indexName((String) SchemaUtils.validateSameMember($SCHEMA_INDEX_NAME, member, value));
                case 1 -> startTerm((String) SchemaUtils.validateSameMember($SCHEMA_START_TERM, member, value));
                case 2 -> endTerm((String) SchemaUtils.validateSameMember($SCHEMA_END_TERM, member, value));
                case 3 -> aggregationTag((String) SchemaUtils.validateSameMember($SCHEMA_AGGREGATION_TAG, member, value));
                case 4 -> regularExpression((String) SchemaUtils.validateSameMember($SCHEMA_REGULAR_EXPRESSION, member, value));
                case 5 -> evaluationExpression((String) SchemaUtils.validateSameMember($SCHEMA_EVALUATION_EXPRESSION, member, value));
                case 6 -> filterExpression((String) SchemaUtils.validateSameMember($SCHEMA_FILTER_EXPRESSION, member, value));
                default -> ShapeBuilder.super.setMemberValue(member, value);
            }
        }

        @Override
        public ShapeBuilder<QuerySpec> errorCorrection() {
            if (tracker.allSet()) {
                return this;
            }
            if (!tracker.checkMember($SCHEMA_INDEX_NAME)) {
                indexName("");
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
                    case 0 -> builder.indexName(de.readString(member));
                    case 1 -> builder.startTerm(de.readString(member));
                    case 2 -> builder.endTerm(de.readString(member));
                    case 3 -> builder.aggregationTag(de.readString(member));
                    case 4 -> builder.regularExpression(de.readString(member));
                    case 5 -> builder.evaluationExpression(de.readString(member));
                    case 6 -> builder.filterExpression(de.readString(member));
                    default -> throw new IllegalArgumentException("Unexpected member: " + member.memberName());
                }
            }
        }
    }
}
