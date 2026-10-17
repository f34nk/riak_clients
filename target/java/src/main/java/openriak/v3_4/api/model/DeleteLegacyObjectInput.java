package openriak.v3_4.api.model;

import java.time.Instant;
import java.util.Collections;
import java.util.Map;
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

/**
 * Riak-native conditional writes use x-riak-if-not-modified with an encoded vclock from a prior read,
 * alongside standard If-Match and If-Unmodified-Since headers. Set riakHeaders key if-not-modified to
 * the encoded vclock.
 */
@SmithyGenerated
public final class DeleteLegacyObjectInput implements SerializableStruct {

    public static final Schema $SCHEMA = Schemas.DELETE_LEGACY_OBJECT_INPUT;
    private static final Schema $SCHEMA_BUCKET = $SCHEMA.member("bucket");
    private static final Schema $SCHEMA_KEY = $SCHEMA.member("key");
    private static final Schema $SCHEMA_TIMEOUT = $SCHEMA.member("timeout");
    private static final Schema $SCHEMA_R = $SCHEMA.member("r");
    private static final Schema $SCHEMA_W = $SCHEMA.member("w");
    private static final Schema $SCHEMA_RW = $SCHEMA.member("rw");
    private static final Schema $SCHEMA_PR = $SCHEMA.member("pr");
    private static final Schema $SCHEMA_PW = $SCHEMA.member("pw");
    private static final Schema $SCHEMA_DW = $SCHEMA.member("dw");
    private static final Schema $SCHEMA_IF_NONE_MATCH = $SCHEMA.member("ifNoneMatch");
    private static final Schema $SCHEMA_IF_MATCH = $SCHEMA.member("ifMatch");
    private static final Schema $SCHEMA_IF_UNMODIFIED_SINCE = $SCHEMA.member("ifUnmodifiedSince");
    private static final Schema $SCHEMA_RIAK_HEADERS = $SCHEMA.member("riakHeaders");

    public static final ShapeId $ID = $SCHEMA.id();

    private final transient String bucket;
    private final transient String key;
    private final transient Integer timeout;
    private final transient String r;
    private final transient String w;
    private final transient String rw;
    private final transient String pr;
    private final transient String pw;
    private final transient String dw;
    private final transient String ifNoneMatch;
    private final transient String ifMatch;
    private final transient Instant ifUnmodifiedSince;
    private final transient Map<String, String> riakHeaders;

    private DeleteLegacyObjectInput(Builder builder) {
        this.bucket = builder.bucket;
        this.key = builder.key;
        this.timeout = builder.timeout;
        this.r = builder.r;
        this.w = builder.w;
        this.rw = builder.rw;
        this.pr = builder.pr;
        this.pw = builder.pw;
        this.dw = builder.dw;
        this.ifNoneMatch = builder.ifNoneMatch;
        this.ifMatch = builder.ifMatch;
        this.ifUnmodifiedSince = builder.ifUnmodifiedSince;
        this.riakHeaders = builder.riakHeaders == null ? null : Collections.unmodifiableMap(builder.riakHeaders);
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

    public String getW() {
        return w;
    }

    public String getRw() {
        return rw;
    }

    public String getPr() {
        return pr;
    }

    public String getPw() {
        return pw;
    }

    public String getDw() {
        return dw;
    }

    public String getIfNoneMatch() {
        return ifNoneMatch;
    }

    public String getIfMatch() {
        return ifMatch;
    }

    public Instant getIfUnmodifiedSince() {
        return ifUnmodifiedSince;
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
    public boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (other == null || getClass() != other.getClass()) {
            return false;
        }
        DeleteLegacyObjectInput that = (DeleteLegacyObjectInput) other;
        return Objects.equals(this.timeout, that.timeout)
               && Objects.equals(this.bucket, that.bucket)
               && Objects.equals(this.key, that.key)
               && Objects.equals(this.r, that.r)
               && Objects.equals(this.w, that.w)
               && Objects.equals(this.rw, that.rw)
               && Objects.equals(this.pr, that.pr)
               && Objects.equals(this.pw, that.pw)
               && Objects.equals(this.dw, that.dw)
               && Objects.equals(this.ifNoneMatch, that.ifNoneMatch)
               && Objects.equals(this.ifMatch, that.ifMatch)
               && Objects.equals(this.ifUnmodifiedSince, that.ifUnmodifiedSince)
               && Objects.equals(this.riakHeaders, that.riakHeaders);
    }

    @Override
    public int hashCode() {
        int $hc = Objects.hashCode(bucket);
        $hc = 31 * $hc + Objects.hashCode(key);
        $hc = 31 * $hc + Objects.hashCode(timeout);
        $hc = 31 * $hc + Objects.hashCode(r);
        $hc = 31 * $hc + Objects.hashCode(w);
        $hc = 31 * $hc + Objects.hashCode(rw);
        $hc = 31 * $hc + Objects.hashCode(pr);
        $hc = 31 * $hc + Objects.hashCode(pw);
        $hc = 31 * $hc + Objects.hashCode(dw);
        $hc = 31 * $hc + Objects.hashCode(ifNoneMatch);
        $hc = 31 * $hc + Objects.hashCode(ifMatch);
        $hc = 31 * $hc + Objects.hashCode(ifUnmodifiedSince);
        $hc = 31 * $hc + Objects.hashCode(riakHeaders);
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
        if (r != null) {
            serializer.writeString($SCHEMA_R, r);
        }
        if (w != null) {
            serializer.writeString($SCHEMA_W, w);
        }
        if (rw != null) {
            serializer.writeString($SCHEMA_RW, rw);
        }
        if (pr != null) {
            serializer.writeString($SCHEMA_PR, pr);
        }
        if (pw != null) {
            serializer.writeString($SCHEMA_PW, pw);
        }
        if (dw != null) {
            serializer.writeString($SCHEMA_DW, dw);
        }
        if (ifNoneMatch != null) {
            serializer.writeString($SCHEMA_IF_NONE_MATCH, ifNoneMatch);
        }
        if (ifMatch != null) {
            serializer.writeString($SCHEMA_IF_MATCH, ifMatch);
        }
        if (ifUnmodifiedSince != null) {
            serializer.writeTimestamp($SCHEMA_IF_UNMODIFIED_SINCE, ifUnmodifiedSince);
        }
        if (riakHeaders != null) {
            serializer.writeMap($SCHEMA_RIAK_HEADERS, riakHeaders, riakHeaders.size(), SharedSerde.RiakHeadersSerializer.INSTANCE);
        }
    }

    @Override
    @SuppressWarnings("unchecked")
    public <T> T getMemberValue(Schema member) {
        return switch (member.memberIndex()) {
            case 0 -> (T) SchemaUtils.validateSameMember($SCHEMA_BUCKET, member, bucket);
            case 1 -> (T) SchemaUtils.validateSameMember($SCHEMA_KEY, member, key);
            case 2 -> (T) SchemaUtils.validateSameMember($SCHEMA_TIMEOUT, member, timeout);
            case 3 -> (T) SchemaUtils.validateSameMember($SCHEMA_R, member, r);
            case 4 -> (T) SchemaUtils.validateSameMember($SCHEMA_W, member, w);
            case 5 -> (T) SchemaUtils.validateSameMember($SCHEMA_RW, member, rw);
            case 6 -> (T) SchemaUtils.validateSameMember($SCHEMA_PR, member, pr);
            case 7 -> (T) SchemaUtils.validateSameMember($SCHEMA_PW, member, pw);
            case 8 -> (T) SchemaUtils.validateSameMember($SCHEMA_DW, member, dw);
            case 9 -> (T) SchemaUtils.validateSameMember($SCHEMA_IF_NONE_MATCH, member, ifNoneMatch);
            case 10 -> (T) SchemaUtils.validateSameMember($SCHEMA_IF_MATCH, member, ifMatch);
            case 11 -> (T) SchemaUtils.validateSameMember($SCHEMA_IF_UNMODIFIED_SINCE, member, ifUnmodifiedSince);
            case 12 -> (T) SchemaUtils.validateSameMember($SCHEMA_RIAK_HEADERS, member, riakHeaders);
            default -> throw new IllegalArgumentException("Attempted to get non-existent member: " + member.id());
        };
    }

    /**
     * Create a new builder containing all the current property values of this object.
     *
     * <p><strong>Note:</strong> This method performs only a shallow copy of the original properties.
     *
     * @return a builder for {@link DeleteLegacyObjectInput}.
     */
    public Builder toBuilder() {
        var builder = new Builder();
        builder.bucket(this.bucket);
        builder.key(this.key);
        builder.timeout(this.timeout);
        builder.r(this.r);
        builder.w(this.w);
        builder.rw(this.rw);
        builder.pr(this.pr);
        builder.pw(this.pw);
        builder.dw(this.dw);
        builder.ifNoneMatch(this.ifNoneMatch);
        builder.ifMatch(this.ifMatch);
        builder.ifUnmodifiedSince(this.ifUnmodifiedSince);
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
     * Builder for {@link DeleteLegacyObjectInput}.
     */
    public static final class Builder implements ShapeBuilder<DeleteLegacyObjectInput> {
        private final PresenceTracker tracker = PresenceTracker.of($SCHEMA);
        private String bucket;
        private String key;
        private Integer timeout;
        private String r;
        private String w;
        private String rw;
        private String pr;
        private String pw;
        private String dw;
        private String ifNoneMatch;
        private String ifMatch;
        private Instant ifUnmodifiedSince;
        private Map<String, String> riakHeaders;

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
        public Builder r(String r) {
            this.r = r;
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
        public Builder rw(String rw) {
            this.rw = rw;
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
        public Builder ifNoneMatch(String ifNoneMatch) {
            this.ifNoneMatch = ifNoneMatch;
            return this;
        }

        /**
         * @return this builder.
         */
        public Builder ifMatch(String ifMatch) {
            this.ifMatch = ifMatch;
            return this;
        }

        /**
         * @return this builder.
         */
        public Builder ifUnmodifiedSince(Instant ifUnmodifiedSince) {
            this.ifUnmodifiedSince = ifUnmodifiedSince;
            return this;
        }

        /**
         * @return this builder.
         */
        public Builder riakHeaders(Map<String, String> riakHeaders) {
            this.riakHeaders = riakHeaders;
            return this;
        }

        @Override
        public DeleteLegacyObjectInput build() {
            tracker.validate();
            return new DeleteLegacyObjectInput(this);
        }

        @Override
        @SuppressWarnings("unchecked")
        public void setMemberValue(Schema member, Object value) {
            switch (member.memberIndex()) {
                case 0 -> bucket((String) SchemaUtils.validateSameMember($SCHEMA_BUCKET, member, value));
                case 1 -> key((String) SchemaUtils.validateSameMember($SCHEMA_KEY, member, value));
                case 2 -> timeout((Integer) SchemaUtils.validateSameMember($SCHEMA_TIMEOUT, member, value));
                case 3 -> r((String) SchemaUtils.validateSameMember($SCHEMA_R, member, value));
                case 4 -> w((String) SchemaUtils.validateSameMember($SCHEMA_W, member, value));
                case 5 -> rw((String) SchemaUtils.validateSameMember($SCHEMA_RW, member, value));
                case 6 -> pr((String) SchemaUtils.validateSameMember($SCHEMA_PR, member, value));
                case 7 -> pw((String) SchemaUtils.validateSameMember($SCHEMA_PW, member, value));
                case 8 -> dw((String) SchemaUtils.validateSameMember($SCHEMA_DW, member, value));
                case 9 -> ifNoneMatch((String) SchemaUtils.validateSameMember($SCHEMA_IF_NONE_MATCH, member, value));
                case 10 -> ifMatch((String) SchemaUtils.validateSameMember($SCHEMA_IF_MATCH, member, value));
                case 11 -> ifUnmodifiedSince((Instant) SchemaUtils.validateSameMember($SCHEMA_IF_UNMODIFIED_SINCE, member, value));
                case 12 -> riakHeaders((Map<String, String>) SchemaUtils.validateSameMember($SCHEMA_RIAK_HEADERS, member, value));
                default -> ShapeBuilder.super.setMemberValue(member, value);
            }
        }

        @Override
        public ShapeBuilder<DeleteLegacyObjectInput> errorCorrection() {
            if (tracker.allSet()) {
                return this;
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
                    case 0 -> builder.bucket(de.readString(member));
                    case 1 -> builder.key(de.readString(member));
                    case 2 -> builder.timeout(de.readInteger(member));
                    case 3 -> builder.r(de.readString(member));
                    case 4 -> builder.w(de.readString(member));
                    case 5 -> builder.rw(de.readString(member));
                    case 6 -> builder.pr(de.readString(member));
                    case 7 -> builder.pw(de.readString(member));
                    case 8 -> builder.dw(de.readString(member));
                    case 9 -> builder.ifNoneMatch(de.readString(member));
                    case 10 -> builder.ifMatch(de.readString(member));
                    case 11 -> builder.ifUnmodifiedSince(de.readTimestamp(member));
                    case 12 -> builder.riakHeaders(SharedSerde.deserializeRiakHeaders(member, de));
                    default -> throw new IllegalArgumentException("Unexpected member: " + member.memberName());
                }
            }
        }
    }
}
