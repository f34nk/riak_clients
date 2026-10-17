package openriak.v3_4.api.model;

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
public final class MultipleChoicesError extends OpenRiakException {

    public static final Schema $SCHEMA = Schemas.MULTIPLE_CHOICES_ERROR;
    private static final Schema $SCHEMA_CONTENT_TYPE = $SCHEMA.member("contentType");
    private static final Schema $SCHEMA_VCLOCK = $SCHEMA.member("vclock");
    private static final Schema $SCHEMA_BODY = $SCHEMA.member("body");

    public static final ShapeId $ID = $SCHEMA.id();

    private final transient String contentType;
    private final transient String vclock;
    private final transient String body;

    private MultipleChoicesError(Builder builder) {
        super($SCHEMA, null, builder.$cause, ErrorFault.CLIENT, builder.$captureStackTrace, builder.$deserialized);
        this.contentType = builder.contentType;
        this.vclock = builder.vclock;
        this.body = builder.body;
    }

    public String getContentType() {
        return contentType;
    }

    public String getVclock() {
        return vclock;
    }

    public String getBody() {
        return body;
    }

    @Override
    public String toString() {
        return ToStringSerializer.serialize(this);
    }

    @Override
    public void serializeMembers(ShapeSerializer serializer) {
        if (contentType != null) {
            serializer.writeString($SCHEMA_CONTENT_TYPE, contentType);
        }
        if (vclock != null) {
            serializer.writeString($SCHEMA_VCLOCK, vclock);
        }
        if (body != null) {
            serializer.writeString($SCHEMA_BODY, body);
        }
    }

    @Override
    @SuppressWarnings("unchecked")
    public <T> T getMemberValue(Schema member) {
        return switch (member.memberIndex()) {
            case 0 -> (T) SchemaUtils.validateSameMember($SCHEMA_CONTENT_TYPE, member, contentType);
            case 1 -> (T) SchemaUtils.validateSameMember($SCHEMA_VCLOCK, member, vclock);
            case 2 -> (T) SchemaUtils.validateSameMember($SCHEMA_BODY, member, body);
            default -> throw new IllegalArgumentException("Attempted to get non-existent member: " + member.id());
        };
    }

    /**
     * Create a new builder containing all the current property values of this object.
     *
     * <p><strong>Note:</strong> This method performs only a shallow copy of the original properties.
     *
     * @return a builder for {@link MultipleChoicesError}.
     */
    public Builder toBuilder() {
        var builder = new Builder();
        builder.contentType(this.contentType);
        builder.vclock(this.vclock);
        builder.body(this.body);
        return builder;
    }

    /**
     * @return returns a new Builder.
     */
    public static Builder builder() {
        return new Builder();
    }

    /**
     * Builder for {@link MultipleChoicesError}.
     */
    public static final class Builder implements ShapeBuilder<MultipleChoicesError> {
        private String contentType;
        private String vclock;
        private String body;
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
        public Builder contentType(String contentType) {
            this.contentType = contentType;
            return this;
        }

        /**
         * @return this builder.
         */
        public Builder vclock(String vclock) {
            this.vclock = vclock;
            return this;
        }

        /**
         * @return this builder.
         */
        public Builder body(String body) {
            this.body = body;
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
        public MultipleChoicesError build() {
            return new MultipleChoicesError(this);
        }

        @Override
        @SuppressWarnings("unchecked")
        public void setMemberValue(Schema member, Object value) {
            switch (member.memberIndex()) {
                case 0 -> contentType((String) SchemaUtils.validateSameMember($SCHEMA_CONTENT_TYPE, member, value));
                case 1 -> vclock((String) SchemaUtils.validateSameMember($SCHEMA_VCLOCK, member, value));
                case 2 -> body((String) SchemaUtils.validateSameMember($SCHEMA_BODY, member, value));
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
                    case 0 -> builder.contentType(de.readString(member));
                    case 1 -> builder.vclock(de.readString(member));
                    case 2 -> builder.body(de.readString(member));
                    default -> throw new IllegalArgumentException("Unexpected member: " + member.memberName());
                }
            }
        }
    }
}
