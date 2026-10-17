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
public final class GetDatatypeInput implements SerializableStruct {

    public static final Schema $SCHEMA = Schemas.GET_DATATYPE_INPUT;
    private static final Schema $SCHEMA_BUCKET_TYPE = $SCHEMA.member("bucketType");
    private static final Schema $SCHEMA_BUCKET = $SCHEMA.member("bucket");
    private static final Schema $SCHEMA_KEY = $SCHEMA.member("key");
    private static final Schema $SCHEMA_TIMEOUT = $SCHEMA.member("timeout");
    private static final Schema $SCHEMA_R = $SCHEMA.member("r");
    private static final Schema $SCHEMA_PR = $SCHEMA.member("pr");
    private static final Schema $SCHEMA_W = $SCHEMA.member("w");
    private static final Schema $SCHEMA_PW = $SCHEMA.member("pw");
    private static final Schema $SCHEMA_DW = $SCHEMA.member("dw");
    private static final Schema $SCHEMA_RETURN_BODY = $SCHEMA.member("returnBody");
    private static final Schema $SCHEMA_INCLUDE_CONTEXT = $SCHEMA.member("includeContext");

    public static final ShapeId $ID = $SCHEMA.id();

    private final transient String bucketType;
    private final transient String bucket;
    private final transient String key;
    private final transient Integer timeout;
    private final transient String r;
    private final transient String pr;
    private final transient String w;
    private final transient String pw;
    private final transient String dw;
    private final transient Boolean returnBody;
    private final transient Boolean includeContext;

    private GetDatatypeInput(Builder builder) {
        this.bucketType = builder.bucketType;
        this.bucket = builder.bucket;
        this.key = builder.key;
        this.timeout = builder.timeout;
        this.r = builder.r;
        this.pr = builder.pr;
        this.w = builder.w;
        this.pw = builder.pw;
        this.dw = builder.dw;
        this.returnBody = builder.returnBody;
        this.includeContext = builder.includeContext;
    }

    public String getBucketType() {
        return bucketType;
    }

    public String getBucket() {
        return bucket;
    }

    public String getKey() {
        return key;
    }

    public Integer getTimeout() {
        return timeout;
    }

    public String getR() {
        return r;
    }

    public String getPr() {
        return pr;
    }

    public String getW() {
        return w;
    }

    public String getPw() {
        return pw;
    }

    public String getDw() {
        return dw;
    }

    public Boolean isReturnBody() {
        return returnBody;
    }

    public Boolean isIncludeContext() {
        return includeContext;
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
        GetDatatypeInput that = (GetDatatypeInput) other;
        return Objects.equals(this.returnBody, that.returnBody)
               && Objects.equals(this.includeContext, that.includeContext)
               && Objects.equals(this.timeout, that.timeout)
               && Objects.equals(this.bucketType, that.bucketType)
               && Objects.equals(this.bucket, that.bucket)
               && Objects.equals(this.key, that.key)
               && Objects.equals(this.r, that.r)
               && Objects.equals(this.pr, that.pr)
               && Objects.equals(this.w, that.w)
               && Objects.equals(this.pw, that.pw)
               && Objects.equals(this.dw, that.dw);
    }

    @Override
    public int hashCode() {
        int $hc = Objects.hashCode(bucketType);
        $hc = 31 * $hc + Objects.hashCode(bucket);
        $hc = 31 * $hc + Objects.hashCode(key);
        $hc = 31 * $hc + Objects.hashCode(timeout);
        $hc = 31 * $hc + Objects.hashCode(r);
        $hc = 31 * $hc + Objects.hashCode(pr);
        $hc = 31 * $hc + Objects.hashCode(w);
        $hc = 31 * $hc + Objects.hashCode(pw);
        $hc = 31 * $hc + Objects.hashCode(dw);
        $hc = 31 * $hc + Objects.hashCode(returnBody);
        $hc = 31 * $hc + Objects.hashCode(includeContext);
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
        serializer.writeString($SCHEMA_KEY, key);
        if (timeout != null) {
            serializer.writeInteger($SCHEMA_TIMEOUT, timeout);
        }
        if (r != null) {
            serializer.writeString($SCHEMA_R, r);
        }
        if (pr != null) {
            serializer.writeString($SCHEMA_PR, pr);
        }
        if (w != null) {
            serializer.writeString($SCHEMA_W, w);
        }
        if (pw != null) {
            serializer.writeString($SCHEMA_PW, pw);
        }
        if (dw != null) {
            serializer.writeString($SCHEMA_DW, dw);
        }
        if (returnBody != null) {
            serializer.writeBoolean($SCHEMA_RETURN_BODY, returnBody);
        }
        if (includeContext != null) {
            serializer.writeBoolean($SCHEMA_INCLUDE_CONTEXT, includeContext);
        }
    }

    @Override
    @SuppressWarnings("unchecked")
    public <T> T getMemberValue(Schema member) {
        return switch (member.memberIndex()) {
            case 0 -> (T) SchemaUtils.validateSameMember($SCHEMA_BUCKET_TYPE, member, bucketType);
            case 1 -> (T) SchemaUtils.validateSameMember($SCHEMA_BUCKET, member, bucket);
            case 2 -> (T) SchemaUtils.validateSameMember($SCHEMA_KEY, member, key);
            case 3 -> (T) SchemaUtils.validateSameMember($SCHEMA_TIMEOUT, member, timeout);
            case 4 -> (T) SchemaUtils.validateSameMember($SCHEMA_R, member, r);
            case 5 -> (T) SchemaUtils.validateSameMember($SCHEMA_PR, member, pr);
            case 6 -> (T) SchemaUtils.validateSameMember($SCHEMA_W, member, w);
            case 7 -> (T) SchemaUtils.validateSameMember($SCHEMA_PW, member, pw);
            case 8 -> (T) SchemaUtils.validateSameMember($SCHEMA_DW, member, dw);
            case 9 -> (T) SchemaUtils.validateSameMember($SCHEMA_RETURN_BODY, member, returnBody);
            case 10 -> (T) SchemaUtils.validateSameMember($SCHEMA_INCLUDE_CONTEXT, member, includeContext);
            default -> throw new IllegalArgumentException("Attempted to get non-existent member: " + member.id());
        };
    }

    /**
     * Create a new builder containing all the current property values of this object.
     *
     * <p><strong>Note:</strong> This method performs only a shallow copy of the original properties.
     *
     * @return a builder for {@link GetDatatypeInput}.
     */
    public Builder toBuilder() {
        var builder = new Builder();
        builder.bucketType(this.bucketType);
        builder.bucket(this.bucket);
        builder.key(this.key);
        builder.timeout(this.timeout);
        builder.r(this.r);
        builder.pr(this.pr);
        builder.w(this.w);
        builder.pw(this.pw);
        builder.dw(this.dw);
        builder.returnBody(this.returnBody);
        builder.includeContext(this.includeContext);
        return builder;
    }

    /**
     * @return returns a new Builder.
     */
    public static Builder builder() {
        return new Builder();
    }

    /**
     * Builder for {@link GetDatatypeInput}.
     */
    public static final class Builder implements ShapeBuilder<GetDatatypeInput> {
        private final PresenceTracker tracker = PresenceTracker.of($SCHEMA);
        private String bucketType;
        private String bucket;
        private String key;
        private Integer timeout;
        private String r;
        private String pr;
        private String w;
        private String pw;
        private String dw;
        private Boolean returnBody;
        private Boolean includeContext;

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
         * <p><strong>Required</strong>
         * @return this builder.
         */
        public Builder key(String key) {
            this.key = Objects.requireNonNull(key, "key cannot be null");
            tracker.setMember($SCHEMA_KEY);
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
        public Builder r(String r) {
            this.r = r;
            return this;
        }

        /**
         * @return this builder.
         */
        public Builder pr(String pr) {
            this.pr = pr;
            return this;
        }

        /**
         * @return this builder.
         */
        public Builder w(String w) {
            this.w = w;
            return this;
        }

        /**
         * @return this builder.
         */
        public Builder pw(String pw) {
            this.pw = pw;
            return this;
        }

        /**
         * @return this builder.
         */
        public Builder dw(String dw) {
            this.dw = dw;
            return this;
        }

        /**
         * @return this builder.
         */
        public Builder returnBody(Boolean returnBody) {
            this.returnBody = returnBody;
            return this;
        }

        /**
         * @return this builder.
         */
        public Builder includeContext(Boolean includeContext) {
            this.includeContext = includeContext;
            return this;
        }

        @Override
        public GetDatatypeInput build() {
            tracker.validate();
            return new GetDatatypeInput(this);
        }

        @Override
        @SuppressWarnings("unchecked")
        public void setMemberValue(Schema member, Object value) {
            switch (member.memberIndex()) {
                case 0 -> bucketType((String) SchemaUtils.validateSameMember($SCHEMA_BUCKET_TYPE, member, value));
                case 1 -> bucket((String) SchemaUtils.validateSameMember($SCHEMA_BUCKET, member, value));
                case 2 -> key((String) SchemaUtils.validateSameMember($SCHEMA_KEY, member, value));
                case 3 -> timeout((Integer) SchemaUtils.validateSameMember($SCHEMA_TIMEOUT, member, value));
                case 4 -> r((String) SchemaUtils.validateSameMember($SCHEMA_R, member, value));
                case 5 -> pr((String) SchemaUtils.validateSameMember($SCHEMA_PR, member, value));
                case 6 -> w((String) SchemaUtils.validateSameMember($SCHEMA_W, member, value));
                case 7 -> pw((String) SchemaUtils.validateSameMember($SCHEMA_PW, member, value));
                case 8 -> dw((String) SchemaUtils.validateSameMember($SCHEMA_DW, member, value));
                case 9 -> returnBody((Boolean) SchemaUtils.validateSameMember($SCHEMA_RETURN_BODY, member, value));
                case 10 -> includeContext((Boolean) SchemaUtils.validateSameMember($SCHEMA_INCLUDE_CONTEXT, member, value));
                default -> ShapeBuilder.super.setMemberValue(member, value);
            }
        }

        @Override
        public ShapeBuilder<GetDatatypeInput> errorCorrection() {
            if (tracker.allSet()) {
                return this;
            }
            if (!tracker.checkMember($SCHEMA_BUCKET_TYPE)) {
                bucketType("");
            }
            if (!tracker.checkMember($SCHEMA_BUCKET)) {
                bucket("");
            }
            if (!tracker.checkMember($SCHEMA_KEY)) {
                key("");
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
                    case 2 -> builder.key(de.readString(member));
                    case 3 -> builder.timeout(de.readInteger(member));
                    case 4 -> builder.r(de.readString(member));
                    case 5 -> builder.pr(de.readString(member));
                    case 6 -> builder.w(de.readString(member));
                    case 7 -> builder.pw(de.readString(member));
                    case 8 -> builder.dw(de.readString(member));
                    case 9 -> builder.returnBody(de.readBoolean(member));
                    case 10 -> builder.includeContext(de.readBoolean(member));
                    default -> throw new IllegalArgumentException("Unexpected member: " + member.memberName());
                }
            }
        }
    }
}
