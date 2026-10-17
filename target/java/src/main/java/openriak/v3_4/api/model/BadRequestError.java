package openriak.v3_4.api.model;

import java.util.Collections;
import java.util.Map;
import software.amazon.smithy.java.core.error.ErrorFault;
import software.amazon.smithy.java.core.schema.Schema;
import software.amazon.smithy.java.core.schema.SchemaUtils;
import software.amazon.smithy.java.core.schema.ShapeBuilder;
import software.amazon.smithy.java.core.serde.ShapeDeserializer;
import software.amazon.smithy.java.core.serde.ShapeSerializer;
import software.amazon.smithy.java.core.serde.ToStringSerializer;
import software.amazon.smithy.model.shapes.ShapeId;
import software.amazon.smithy.utils.SmithyGenerated;

@SmithyGenerated
public final class BadRequestError extends OpenRiakException {

    public static final Schema $SCHEMA = Schemas.BAD_REQUEST_ERROR;
    private static final Schema $SCHEMA_MESSAGE = $SCHEMA.member("message");
    private static final Schema $SCHEMA_CONTENT_TYPE = $SCHEMA.member("contentType");
    private static final Schema $SCHEMA_RIAK_HEADERS = $SCHEMA.member("riakHeaders");

    public static final ShapeId $ID = $SCHEMA.id();

    private final transient String contentType;
    private final transient Map<String, String> riakHeaders;

    private BadRequestError(Builder builder) {
        super($SCHEMA, builder.message, builder.$cause, ErrorFault.CLIENT, builder.$captureStackTrace, builder.$deserialized);
        this.contentType = builder.contentType;
        this.riakHeaders = builder.riakHeaders == null ? null : Collections.unmodifiableMap(builder.riakHeaders);
    }

    public String getContentType() {
        return contentType;
    }

    public Map<String, String> getRiakHeaders() {
        if (riakHeaders == null) {
            return Collections.emptyMap();
        }
        return riakHeaders;
    }

    public boolean hasRiakHeaders() {
        return riakHeaders != null;
    }

    @Override
    public String toString() {
        return ToStringSerializer.serialize(this);
    }

    @Override
    public void serializeMembers(ShapeSerializer serializer) {
        if (getMessage() != null) {
            serializer.writeString($SCHEMA_MESSAGE, getMessage());
        }
        if (contentType != null) {
            serializer.writeString($SCHEMA_CONTENT_TYPE, contentType);
        }
        if (riakHeaders != null) {
            serializer.writeMap($SCHEMA_RIAK_HEADERS, riakHeaders, riakHeaders.size(), SharedSerde.RiakHeadersSerializer.INSTANCE);
        }
    }

    @Override
    @SuppressWarnings("unchecked")
    public <T> T getMemberValue(Schema member) {
        return switch (member.memberIndex()) {
            case 0 -> (T) SchemaUtils.validateSameMember($SCHEMA_MESSAGE, member, getMessage());
            case 1 -> (T) SchemaUtils.validateSameMember($SCHEMA_CONTENT_TYPE, member, contentType);
            case 2 -> (T) SchemaUtils.validateSameMember($SCHEMA_RIAK_HEADERS, member, riakHeaders);
            default -> throw new IllegalArgumentException("Attempted to get non-existent member: " + member.id());
        };
    }

    /**
     * Create a new builder containing all the current property values of this object.
     *
     * <p><strong>Note:</strong> This method performs only a shallow copy of the original properties.
     *
     * @return a builder for {@link BadRequestError}.
     */
    public Builder toBuilder() {
        var builder = new Builder();
        builder.message(getMessage());
        builder.contentType(this.contentType);
        builder.riakHeaders(this.riakHeaders);
        return builder;
    }

    /**
     * @return returns a new Builder.
     */
    public static Builder builder() {
        return new Builder();
    }

    /**
     * Builder for {@link BadRequestError}.
     */
    public static final class Builder implements ShapeBuilder<BadRequestError> {
        private String message;
        private String contentType;
        private Map<String, String> riakHeaders;
        private Throwable $cause;
        private Boolean $captureStackTrace;
        private boolean $deserialized;

        private Builder() {}

        @Override
        public Schema schema() {
            return $SCHEMA;
        }

        /**
         * @return this builder.
         */
        public Builder message(String message) {
            this.message = message;
            return this;
        }

        /**
         * @return this builder.
         */
        public Builder contentType(String contentType) {
            this.contentType = contentType;
            return this;
        }

        /**
         * @return this builder.
         */
        public Builder riakHeaders(Map<String, String> riakHeaders) {
            this.riakHeaders = riakHeaders;
            return this;
        }

        public Builder withStackTrace() {
            this.$captureStackTrace = true;
            return this;
        }

        public Builder withoutStackTrace() {
            this.$captureStackTrace = false;
            return this;
        }

        public Builder withCause(Throwable cause) {
            this.$cause = cause;
            return this;
        }

        @Override
        public BadRequestError build() {
            return new BadRequestError(this);
        }

        @Override
        @SuppressWarnings("unchecked")
        public void setMemberValue(Schema member, Object value) {
            switch (member.memberIndex()) {
                case 0 -> message((String) SchemaUtils.validateSameMember($SCHEMA_MESSAGE, member, value));
                case 1 -> contentType((String) SchemaUtils.validateSameMember($SCHEMA_CONTENT_TYPE, member, value));
                case 2 -> riakHeaders((Map<String, String>) SchemaUtils.validateSameMember($SCHEMA_RIAK_HEADERS, member, value));
                default -> ShapeBuilder.super.setMemberValue(member, value);
            }
        }

        @Override
        public Builder deserialize(ShapeDeserializer decoder) {
            this.$deserialized = true;
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
                    case 0 -> builder.message(de.readString(member));
                    case 1 -> builder.contentType(de.readString(member));
                    case 2 -> builder.riakHeaders(SharedSerde.deserializeRiakHeaders(member, de));
                    default -> throw new IllegalArgumentException("Unexpected member: " + member.memberName());
                }
            }
        }
    }
}
