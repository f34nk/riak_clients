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
public final class UpdateLegacyCounterInput implements SerializableStruct {

    public static final Schema $SCHEMA = Schemas.UPDATE_LEGACY_COUNTER_INPUT;
    private static final Schema $SCHEMA_BUCKET = $SCHEMA.member("bucket");
    private static final Schema $SCHEMA_KEY = $SCHEMA.member("key");
    private static final Schema $SCHEMA_TIMEOUT = $SCHEMA.member("timeout");
    private static final Schema $SCHEMA_W = $SCHEMA.member("w");
    private static final Schema $SCHEMA_PW = $SCHEMA.member("pw");
    private static final Schema $SCHEMA_DW = $SCHEMA.member("dw");
    private static final Schema $SCHEMA_RETURN_VALUE = $SCHEMA.member("returnValue");
    private static final Schema $SCHEMA_AMOUNT = $SCHEMA.member("amount");

    public static final ShapeId $ID = $SCHEMA.id();

    private final transient String bucket;
    private final transient String key;
    private final transient Integer timeout;
    private final transient String w;
    private final transient String pw;
    private final transient String dw;
    private final transient Boolean returnValue;
    private final transient String amount;

    private UpdateLegacyCounterInput(Builder builder) {
        this.bucket = builder.bucket;
        this.key = builder.key;
        this.timeout = builder.timeout;
        this.w = builder.w;
        this.pw = builder.pw;
        this.dw = builder.dw;
        this.returnValue = builder.returnValue;
        this.amount = builder.amount;
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

    public String getW() {
        return w;
    }

    public String getPw() {
        return pw;
    }

    public String getDw() {
        return dw;
    }

    public Boolean isReturnValue() {
        return returnValue;
    }

    public String getAmount() {
        return amount;
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
        UpdateLegacyCounterInput that = (UpdateLegacyCounterInput) other;
        return Objects.equals(this.returnValue, that.returnValue)
               && Objects.equals(this.timeout, that.timeout)
               && Objects.equals(this.bucket, that.bucket)
               && Objects.equals(this.key, that.key)
               && Objects.equals(this.w, that.w)
               && Objects.equals(this.pw, that.pw)
               && Objects.equals(this.dw, that.dw)
               && Objects.equals(this.amount, that.amount);
    }

    @Override
    public int hashCode() {
        int $hc = Objects.hashCode(bucket);
        $hc = 31 * $hc + Objects.hashCode(key);
        $hc = 31 * $hc + Objects.hashCode(timeout);
        $hc = 31 * $hc + Objects.hashCode(w);
        $hc = 31 * $hc + Objects.hashCode(pw);
        $hc = 31 * $hc + Objects.hashCode(dw);
        $hc = 31 * $hc + Objects.hashCode(returnValue);
        $hc = 31 * $hc + Objects.hashCode(amount);
        return $hc;
    }

    @Override
    public Schema schema() {
        return $SCHEMA;
    }

    @Override
    public void serializeMembers(ShapeSerializer serializer) {
        serializer.writeString($SCHEMA_BUCKET, bucket);
        serializer.writeString($SCHEMA_KEY, key);
        if (timeout != null) {
            serializer.writeInteger($SCHEMA_TIMEOUT, timeout);
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
        if (returnValue != null) {
            serializer.writeBoolean($SCHEMA_RETURN_VALUE, returnValue);
        }
        serializer.writeString($SCHEMA_AMOUNT, amount);
    }

    @Override
    @SuppressWarnings("unchecked")
    public <T> T getMemberValue(Schema member) {
        return switch (member.memberIndex()) {
            case 0 -> (T) SchemaUtils.validateSameMember($SCHEMA_BUCKET, member, bucket);
            case 1 -> (T) SchemaUtils.validateSameMember($SCHEMA_KEY, member, key);
            case 2 -> (T) SchemaUtils.validateSameMember($SCHEMA_AMOUNT, member, amount);
            case 3 -> (T) SchemaUtils.validateSameMember($SCHEMA_TIMEOUT, member, timeout);
            case 4 -> (T) SchemaUtils.validateSameMember($SCHEMA_W, member, w);
            case 5 -> (T) SchemaUtils.validateSameMember($SCHEMA_PW, member, pw);
            case 6 -> (T) SchemaUtils.validateSameMember($SCHEMA_DW, member, dw);
            case 7 -> (T) SchemaUtils.validateSameMember($SCHEMA_RETURN_VALUE, member, returnValue);
            default -> throw new IllegalArgumentException("Attempted to get non-existent member: " + member.id());
        };
    }

    /**
     * Create a new builder containing all the current property values of this object.
     *
     * <p><strong>Note:</strong> This method performs only a shallow copy of the original properties.
     *
     * @return a builder for {@link UpdateLegacyCounterInput}.
     */
    public Builder toBuilder() {
        var builder = new Builder();
        builder.bucket(this.bucket);
        builder.key(this.key);
        builder.timeout(this.timeout);
        builder.w(this.w);
        builder.pw(this.pw);
        builder.dw(this.dw);
        builder.returnValue(this.returnValue);
        builder.amount(this.amount);
        return builder;
    }

    /**
     * @return returns a new Builder.
     */
    public static Builder builder() {
        return new Builder();
    }

    /**
     * Builder for {@link UpdateLegacyCounterInput}.
     */
    public static final class Builder implements ShapeBuilder<UpdateLegacyCounterInput> {
        private final PresenceTracker tracker = PresenceTracker.of($SCHEMA);
        private String bucket;
        private String key;
        private Integer timeout;
        private String w;
        private String pw;
        private String dw;
        private Boolean returnValue;
        private String amount;

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
        public Builder returnValue(Boolean returnValue) {
            this.returnValue = returnValue;
            return this;
        }

        /**
         * <p><strong>Required</strong>
         * @return this builder.
         */
        public Builder amount(String amount) {
            this.amount = Objects.requireNonNull(amount, "amount cannot be null");
            tracker.setMember($SCHEMA_AMOUNT);
            return this;
        }

        @Override
        public UpdateLegacyCounterInput build() {
            tracker.validate();
            return new UpdateLegacyCounterInput(this);
        }

        @Override
        @SuppressWarnings("unchecked")
        public void setMemberValue(Schema member, Object value) {
            switch (member.memberIndex()) {
                case 0 -> bucket((String) SchemaUtils.validateSameMember($SCHEMA_BUCKET, member, value));
                case 1 -> key((String) SchemaUtils.validateSameMember($SCHEMA_KEY, member, value));
                case 2 -> amount((String) SchemaUtils.validateSameMember($SCHEMA_AMOUNT, member, value));
                case 3 -> timeout((Integer) SchemaUtils.validateSameMember($SCHEMA_TIMEOUT, member, value));
                case 4 -> w((String) SchemaUtils.validateSameMember($SCHEMA_W, member, value));
                case 5 -> pw((String) SchemaUtils.validateSameMember($SCHEMA_PW, member, value));
                case 6 -> dw((String) SchemaUtils.validateSameMember($SCHEMA_DW, member, value));
                case 7 -> returnValue((Boolean) SchemaUtils.validateSameMember($SCHEMA_RETURN_VALUE, member, value));
                default -> ShapeBuilder.super.setMemberValue(member, value);
            }
        }

        @Override
        public ShapeBuilder<UpdateLegacyCounterInput> errorCorrection() {
            if (tracker.allSet()) {
                return this;
            }
            if (!tracker.checkMember($SCHEMA_BUCKET)) {
                bucket("");
            }
            if (!tracker.checkMember($SCHEMA_KEY)) {
                key("");
            }
            if (!tracker.checkMember($SCHEMA_AMOUNT)) {
                amount("");
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
                    case 1 -> builder.key(de.readString(member));
                    case 2 -> builder.amount(de.readString(member));
                    case 3 -> builder.timeout(de.readInteger(member));
                    case 4 -> builder.w(de.readString(member));
                    case 5 -> builder.pw(de.readString(member));
                    case 6 -> builder.dw(de.readString(member));
                    case 7 -> builder.returnValue(de.readBoolean(member));
                    default -> throw new IllegalArgumentException("Unexpected member: " + member.memberName());
                }
            }
        }
    }
}
