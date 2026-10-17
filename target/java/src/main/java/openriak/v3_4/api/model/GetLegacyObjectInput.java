package openriak.v3_4.api.model;

import java.time.Instant;
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
 * Accept drives sibling resolution: multipart/mixed returns all siblings at 200; other values may
 * yield 300 with a vtag list when siblings are unresolved.
 */
@SmithyGenerated
public final class GetLegacyObjectInput implements SerializableStruct {

    public static final Schema $SCHEMA = Schemas.GET_LEGACY_OBJECT_INPUT;
    private static final Schema $SCHEMA_BUCKET = $SCHEMA.member("bucket");
    private static final Schema $SCHEMA_KEY = $SCHEMA.member("key");
    private static final Schema $SCHEMA_TIMEOUT = $SCHEMA.member("timeout");
    private static final Schema $SCHEMA_R = $SCHEMA.member("r");
    private static final Schema $SCHEMA_PR = $SCHEMA.member("pr");
    private static final Schema $SCHEMA_BASIC_QUORUM = $SCHEMA.member("basicQuorum");
    private static final Schema $SCHEMA_NOTFOUND_OK = $SCHEMA.member("notfoundOk");
    private static final Schema $SCHEMA_NODE_CONFIRMS = $SCHEMA.member("nodeConfirms");
    private static final Schema $SCHEMA_DELETED_V_CLOCK = $SCHEMA.member("deletedVClock");
    private static final Schema $SCHEMA_ACCEPT = $SCHEMA.member("accept");
    private static final Schema $SCHEMA_IF_NONE_MATCH = $SCHEMA.member("ifNoneMatch");
    private static final Schema $SCHEMA_IF_MODIFIED_SINCE = $SCHEMA.member("ifModifiedSince");
    private static final Schema $SCHEMA_VTAG = $SCHEMA.member("vtag");

    public static final ShapeId $ID = $SCHEMA.id();

    private final transient String bucket;
    private final transient String key;
    private final transient Integer timeout;
    private final transient String r;
    private final transient String pr;
    private final transient Boolean basicQuorum;
    private final transient Boolean notfoundOk;
    private final transient Integer nodeConfirms;
    private final transient Boolean deletedVClock;
    private final transient String accept;
    private final transient String ifNoneMatch;
    private final transient Instant ifModifiedSince;
    private final transient String vtag;

    private GetLegacyObjectInput(Builder builder) {
        this.bucket = builder.bucket;
        this.key = builder.key;
        this.timeout = builder.timeout;
        this.r = builder.r;
        this.pr = builder.pr;
        this.basicQuorum = builder.basicQuorum;
        this.notfoundOk = builder.notfoundOk;
        this.nodeConfirms = builder.nodeConfirms;
        this.deletedVClock = builder.deletedVClock;
        this.accept = builder.accept;
        this.ifNoneMatch = builder.ifNoneMatch;
        this.ifModifiedSince = builder.ifModifiedSince;
        this.vtag = builder.vtag;
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

    public Boolean isBasicQuorum() {
        return basicQuorum;
    }

    public Boolean isNotfoundOk() {
        return notfoundOk;
    }

    public Integer getNodeConfirms() {
        return nodeConfirms;
    }

    public Boolean isDeletedVClock() {
        return deletedVClock;
    }

    public String getAccept() {
        return accept;
    }

    public String getIfNoneMatch() {
        return ifNoneMatch;
    }

    public Instant getIfModifiedSince() {
        return ifModifiedSince;
    }

    public String getVtag() {
        return vtag;
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
        GetLegacyObjectInput that = (GetLegacyObjectInput) other;
        return Objects.equals(this.basicQuorum, that.basicQuorum)
               && Objects.equals(this.notfoundOk, that.notfoundOk)
               && Objects.equals(this.deletedVClock, that.deletedVClock)
               && Objects.equals(this.timeout, that.timeout)
               && Objects.equals(this.nodeConfirms, that.nodeConfirms)
               && Objects.equals(this.bucket, that.bucket)
               && Objects.equals(this.key, that.key)
               && Objects.equals(this.r, that.r)
               && Objects.equals(this.pr, that.pr)
               && Objects.equals(this.accept, that.accept)
               && Objects.equals(this.ifNoneMatch, that.ifNoneMatch)
               && Objects.equals(this.vtag, that.vtag)
               && Objects.equals(this.ifModifiedSince, that.ifModifiedSince);
    }

    @Override
    public int hashCode() {
        int $hc = Objects.hashCode(bucket);
        $hc = 31 * $hc + Objects.hashCode(key);
        $hc = 31 * $hc + Objects.hashCode(timeout);
        $hc = 31 * $hc + Objects.hashCode(r);
        $hc = 31 * $hc + Objects.hashCode(pr);
        $hc = 31 * $hc + Objects.hashCode(basicQuorum);
        $hc = 31 * $hc + Objects.hashCode(notfoundOk);
        $hc = 31 * $hc + Objects.hashCode(nodeConfirms);
        $hc = 31 * $hc + Objects.hashCode(deletedVClock);
        $hc = 31 * $hc + Objects.hashCode(accept);
        $hc = 31 * $hc + Objects.hashCode(ifNoneMatch);
        $hc = 31 * $hc + Objects.hashCode(ifModifiedSince);
        $hc = 31 * $hc + Objects.hashCode(vtag);
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
        if (pr != null) {
            serializer.writeString($SCHEMA_PR, pr);
        }
        if (basicQuorum != null) {
            serializer.writeBoolean($SCHEMA_BASIC_QUORUM, basicQuorum);
        }
        if (notfoundOk != null) {
            serializer.writeBoolean($SCHEMA_NOTFOUND_OK, notfoundOk);
        }
        if (nodeConfirms != null) {
            serializer.writeInteger($SCHEMA_NODE_CONFIRMS, nodeConfirms);
        }
        if (deletedVClock != null) {
            serializer.writeBoolean($SCHEMA_DELETED_V_CLOCK, deletedVClock);
        }
        if (accept != null) {
            serializer.writeString($SCHEMA_ACCEPT, accept);
        }
        if (ifNoneMatch != null) {
            serializer.writeString($SCHEMA_IF_NONE_MATCH, ifNoneMatch);
        }
        if (ifModifiedSince != null) {
            serializer.writeTimestamp($SCHEMA_IF_MODIFIED_SINCE, ifModifiedSince);
        }
        if (vtag != null) {
            serializer.writeString($SCHEMA_VTAG, vtag);
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
            case 4 -> (T) SchemaUtils.validateSameMember($SCHEMA_PR, member, pr);
            case 5 -> (T) SchemaUtils.validateSameMember($SCHEMA_BASIC_QUORUM, member, basicQuorum);
            case 6 -> (T) SchemaUtils.validateSameMember($SCHEMA_NOTFOUND_OK, member, notfoundOk);
            case 7 -> (T) SchemaUtils.validateSameMember($SCHEMA_NODE_CONFIRMS, member, nodeConfirms);
            case 8 -> (T) SchemaUtils.validateSameMember($SCHEMA_DELETED_V_CLOCK, member, deletedVClock);
            case 9 -> (T) SchemaUtils.validateSameMember($SCHEMA_ACCEPT, member, accept);
            case 10 -> (T) SchemaUtils.validateSameMember($SCHEMA_IF_NONE_MATCH, member, ifNoneMatch);
            case 11 -> (T) SchemaUtils.validateSameMember($SCHEMA_IF_MODIFIED_SINCE, member, ifModifiedSince);
            case 12 -> (T) SchemaUtils.validateSameMember($SCHEMA_VTAG, member, vtag);
            default -> throw new IllegalArgumentException("Attempted to get non-existent member: " + member.id());
        };
    }

    /**
     * Create a new builder containing all the current property values of this object.
     *
     * <p><strong>Note:</strong> This method performs only a shallow copy of the original properties.
     *
     * @return a builder for {@link GetLegacyObjectInput}.
     */
    public Builder toBuilder() {
        var builder = new Builder();
        builder.bucket(this.bucket);
        builder.key(this.key);
        builder.timeout(this.timeout);
        builder.r(this.r);
        builder.pr(this.pr);
        builder.basicQuorum(this.basicQuorum);
        builder.notfoundOk(this.notfoundOk);
        builder.nodeConfirms(this.nodeConfirms);
        builder.deletedVClock(this.deletedVClock);
        builder.accept(this.accept);
        builder.ifNoneMatch(this.ifNoneMatch);
        builder.ifModifiedSince(this.ifModifiedSince);
        builder.vtag(this.vtag);
        return builder;
    }

    /**
     * @return returns a new Builder.
     */
    public static Builder builder() {
        return new Builder();
    }

    /**
     * Builder for {@link GetLegacyObjectInput}.
     */
    public static final class Builder implements ShapeBuilder<GetLegacyObjectInput> {
        private final PresenceTracker tracker = PresenceTracker.of($SCHEMA);
        private String bucket;
        private String key;
        private Integer timeout;
        private String r;
        private String pr;
        private Boolean basicQuorum;
        private Boolean notfoundOk;
        private Integer nodeConfirms;
        private Boolean deletedVClock;
        private String accept;
        private String ifNoneMatch;
        private Instant ifModifiedSince;
        private String vtag;

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
        public Builder pr(String pr) {
            this.pr = pr;
            return this;
        }

        /**
         * @return this builder.
         */
        public Builder basicQuorum(Boolean basicQuorum) {
            this.basicQuorum = basicQuorum;
            return this;
        }

        /**
         * @return this builder.
         */
        public Builder notfoundOk(Boolean notfoundOk) {
            this.notfoundOk = notfoundOk;
            return this;
        }

        /**
         * @return this builder.
         */
        public Builder nodeConfirms(Integer nodeConfirms) {
            this.nodeConfirms = nodeConfirms;
            return this;
        }

        /**
         * @return this builder.
         */
        public Builder deletedVClock(Boolean deletedVClock) {
            this.deletedVClock = deletedVClock;
            return this;
        }

        /**
         * @return this builder.
         */
        public Builder accept(String accept) {
            this.accept = accept;
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
        public Builder ifModifiedSince(Instant ifModifiedSince) {
            this.ifModifiedSince = ifModifiedSince;
            return this;
        }

        /**
         * @return this builder.
         */
        public Builder vtag(String vtag) {
            this.vtag = vtag;
            return this;
        }

        @Override
        public GetLegacyObjectInput build() {
            tracker.validate();
            return new GetLegacyObjectInput(this);
        }

        @Override
        @SuppressWarnings("unchecked")
        public void setMemberValue(Schema member, Object value) {
            switch (member.memberIndex()) {
                case 0 -> bucket((String) SchemaUtils.validateSameMember($SCHEMA_BUCKET, member, value));
                case 1 -> key((String) SchemaUtils.validateSameMember($SCHEMA_KEY, member, value));
                case 2 -> timeout((Integer) SchemaUtils.validateSameMember($SCHEMA_TIMEOUT, member, value));
                case 3 -> r((String) SchemaUtils.validateSameMember($SCHEMA_R, member, value));
                case 4 -> pr((String) SchemaUtils.validateSameMember($SCHEMA_PR, member, value));
                case 5 -> basicQuorum((Boolean) SchemaUtils.validateSameMember($SCHEMA_BASIC_QUORUM, member, value));
                case 6 -> notfoundOk((Boolean) SchemaUtils.validateSameMember($SCHEMA_NOTFOUND_OK, member, value));
                case 7 -> nodeConfirms((Integer) SchemaUtils.validateSameMember($SCHEMA_NODE_CONFIRMS, member, value));
                case 8 -> deletedVClock((Boolean) SchemaUtils.validateSameMember($SCHEMA_DELETED_V_CLOCK, member, value));
                case 9 -> accept((String) SchemaUtils.validateSameMember($SCHEMA_ACCEPT, member, value));
                case 10 -> ifNoneMatch((String) SchemaUtils.validateSameMember($SCHEMA_IF_NONE_MATCH, member, value));
                case 11 -> ifModifiedSince((Instant) SchemaUtils.validateSameMember($SCHEMA_IF_MODIFIED_SINCE, member, value));
                case 12 -> vtag((String) SchemaUtils.validateSameMember($SCHEMA_VTAG, member, value));
                default -> ShapeBuilder.super.setMemberValue(member, value);
            }
        }

        @Override
        public ShapeBuilder<GetLegacyObjectInput> errorCorrection() {
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
                    case 4 -> builder.pr(de.readString(member));
                    case 5 -> builder.basicQuorum(de.readBoolean(member));
                    case 6 -> builder.notfoundOk(de.readBoolean(member));
                    case 7 -> builder.nodeConfirms(de.readInteger(member));
                    case 8 -> builder.deletedVClock(de.readBoolean(member));
                    case 9 -> builder.accept(de.readString(member));
                    case 10 -> builder.ifNoneMatch(de.readString(member));
                    case 11 -> builder.ifModifiedSince(de.readTimestamp(member));
                    case 12 -> builder.vtag(de.readString(member));
                    default -> throw new IllegalArgumentException("Unexpected member: " + member.memberName());
                }
            }
        }
    }
}
