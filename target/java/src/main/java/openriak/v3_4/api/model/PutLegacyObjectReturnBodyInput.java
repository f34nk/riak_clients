package openriak.v3_4.api.model;

import java.io.Closeable;
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
import software.amazon.smithy.java.io.datastream.DataStream;
import software.amazon.smithy.model.shapes.ShapeId;
import software.amazon.smithy.utils.SmithyGenerated;

/**
 * Supports x-riak-if-not-modified and standard conditional headers for Riak-native conditional
 * updates.
 */
@SmithyGenerated
public final class PutLegacyObjectReturnBodyInput implements SerializableStruct, Closeable {

    public static final Schema $SCHEMA = Schemas.PUT_LEGACY_OBJECT_RETURN_BODY_INPUT;
    private static final Schema $SCHEMA_BUCKET = $SCHEMA.member("bucket");
    private static final Schema $SCHEMA_KEY = $SCHEMA.member("key");
    private static final Schema $SCHEMA_TIMEOUT = $SCHEMA.member("timeout");
    private static final Schema $SCHEMA_W = $SCHEMA.member("w");
    private static final Schema $SCHEMA_DW = $SCHEMA.member("dw");
    private static final Schema $SCHEMA_PW = $SCHEMA.member("pw");
    private static final Schema $SCHEMA_NODE_CONFIRMS = $SCHEMA.member("nodeConfirms");
    private static final Schema $SCHEMA_SYNC_ON_WRITE = $SCHEMA.member("syncOnWrite");
    private static final Schema $SCHEMA_ASIS = $SCHEMA.member("asis");
    private static final Schema $SCHEMA_IF_NONE_MATCH = $SCHEMA.member("ifNoneMatch");
    private static final Schema $SCHEMA_IF_MATCH = $SCHEMA.member("ifMatch");
    private static final Schema $SCHEMA_IF_UNMODIFIED_SINCE = $SCHEMA.member("ifUnmodifiedSince");
    private static final Schema $SCHEMA_CONTENT_TYPE = $SCHEMA.member("contentType");
    private static final Schema $SCHEMA_CONTENT_ENCODING = $SCHEMA.member("contentEncoding");
    private static final Schema $SCHEMA_LINK = $SCHEMA.member("link");
    private static final Schema $SCHEMA_RIAK_HEADERS = $SCHEMA.member("riakHeaders");
    private static final Schema $SCHEMA_BODY = $SCHEMA.member("body");

    public static final ShapeId $ID = $SCHEMA.id();

    private final transient String bucket;
    private final transient String key;
    private final transient Integer timeout;
    private final transient String w;
    private final transient String dw;
    private final transient String pw;
    private final transient Integer nodeConfirms;
    private final transient SyncOnWrite syncOnWrite;
    private final transient Boolean asis;
    private final transient String ifNoneMatch;
    private final transient String ifMatch;
    private final transient Instant ifUnmodifiedSince;
    private final transient String contentType;
    private final transient String contentEncoding;
    private final transient String link;
    private final transient Map<String, String> riakHeaders;
    private final transient DataStream body;

    private PutLegacyObjectReturnBodyInput(Builder builder) {
        this.bucket = builder.bucket;
        this.key = builder.key;
        this.timeout = builder.timeout;
        this.w = builder.w;
        this.dw = builder.dw;
        this.pw = builder.pw;
        this.nodeConfirms = builder.nodeConfirms;
        this.syncOnWrite = builder.syncOnWrite;
        this.asis = builder.asis;
        this.ifNoneMatch = builder.ifNoneMatch;
        this.ifMatch = builder.ifMatch;
        this.ifUnmodifiedSince = builder.ifUnmodifiedSince;
        this.contentType = builder.contentType;
        this.contentEncoding = builder.contentEncoding;
        this.link = builder.link;
        this.riakHeaders = builder.riakHeaders == null ? null : Collections.unmodifiableMap(builder.riakHeaders);
        this.body = builder.body;
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

    public String getDw() {
        return dw;
    }

    public String getPw() {
        return pw;
    }

    public Integer getNodeConfirms() {
        return nodeConfirms;
    }

    public SyncOnWrite getSyncOnWrite() {
        return syncOnWrite;
    }

    public Boolean isAsis() {
        return asis;
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

    public String getContentType() {
        return contentType;
    }

    public String getContentEncoding() {
        return contentEncoding;
    }

    public String getLink() {
        return link;
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

    public DataStream getBody() {
        return body;
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
        PutLegacyObjectReturnBodyInput that = (PutLegacyObjectReturnBodyInput) other;
        return Objects.equals(this.asis, that.asis)
               && Objects.equals(this.timeout, that.timeout)
               && Objects.equals(this.nodeConfirms, that.nodeConfirms)
               && Objects.equals(this.bucket, that.bucket)
               && Objects.equals(this.key, that.key)
               && Objects.equals(this.w, that.w)
               && Objects.equals(this.dw, that.dw)
               && Objects.equals(this.pw, that.pw)
               && Objects.equals(this.ifNoneMatch, that.ifNoneMatch)
               && Objects.equals(this.ifMatch, that.ifMatch)
               && Objects.equals(this.contentType, that.contentType)
               && Objects.equals(this.contentEncoding, that.contentEncoding)
               && Objects.equals(this.link, that.link)
               && Objects.equals(this.syncOnWrite, that.syncOnWrite)
               && Objects.equals(this.ifUnmodifiedSince, that.ifUnmodifiedSince)
               && Objects.equals(this.body, that.body)
               && Objects.equals(this.riakHeaders, that.riakHeaders);
    }

    @Override
    public int hashCode() {
        int $hc = Objects.hashCode(bucket);
        $hc = 31 * $hc + Objects.hashCode(key);
        $hc = 31 * $hc + Objects.hashCode(timeout);
        $hc = 31 * $hc + Objects.hashCode(w);
        $hc = 31 * $hc + Objects.hashCode(dw);
        $hc = 31 * $hc + Objects.hashCode(pw);
        $hc = 31 * $hc + Objects.hashCode(nodeConfirms);
        $hc = 31 * $hc + Objects.hashCode(syncOnWrite);
        $hc = 31 * $hc + Objects.hashCode(asis);
        $hc = 31 * $hc + Objects.hashCode(ifNoneMatch);
        $hc = 31 * $hc + Objects.hashCode(ifMatch);
        $hc = 31 * $hc + Objects.hashCode(ifUnmodifiedSince);
        $hc = 31 * $hc + Objects.hashCode(contentType);
        $hc = 31 * $hc + Objects.hashCode(contentEncoding);
        $hc = 31 * $hc + Objects.hashCode(link);
        $hc = 31 * $hc + Objects.hashCode(riakHeaders);
        $hc = 31 * $hc + Objects.hashCode(body);
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
        if (dw != null) {
            serializer.writeString($SCHEMA_DW, dw);
        }
        if (pw != null) {
            serializer.writeString($SCHEMA_PW, pw);
        }
        if (nodeConfirms != null) {
            serializer.writeInteger($SCHEMA_NODE_CONFIRMS, nodeConfirms);
        }
        if (syncOnWrite != null) {
            serializer.writeString($SCHEMA_SYNC_ON_WRITE, syncOnWrite.getValue());
        }
        if (asis != null) {
            serializer.writeBoolean($SCHEMA_ASIS, asis);
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
        serializer.writeString($SCHEMA_CONTENT_TYPE, contentType);
        if (contentEncoding != null) {
            serializer.writeString($SCHEMA_CONTENT_ENCODING, contentEncoding);
        }
        if (link != null) {
            serializer.writeString($SCHEMA_LINK, link);
        }
        if (riakHeaders != null) {
            serializer.writeMap($SCHEMA_RIAK_HEADERS, riakHeaders, riakHeaders.size(), SharedSerde.RiakHeadersSerializer.INSTANCE);
        }
        serializer.writeDataStream($SCHEMA_BODY, body);
    }

    @Override
    @SuppressWarnings("unchecked")
    public <T> T getMemberValue(Schema member) {
        return switch (member.memberIndex()) {
            case 0 -> (T) SchemaUtils.validateSameMember($SCHEMA_BUCKET, member, bucket);
            case 1 -> (T) SchemaUtils.validateSameMember($SCHEMA_KEY, member, key);
            case 2 -> (T) SchemaUtils.validateSameMember($SCHEMA_CONTENT_TYPE, member, contentType);
            case 3 -> (T) SchemaUtils.validateSameMember($SCHEMA_BODY, member, body);
            case 4 -> (T) SchemaUtils.validateSameMember($SCHEMA_TIMEOUT, member, timeout);
            case 5 -> (T) SchemaUtils.validateSameMember($SCHEMA_W, member, w);
            case 6 -> (T) SchemaUtils.validateSameMember($SCHEMA_DW, member, dw);
            case 7 -> (T) SchemaUtils.validateSameMember($SCHEMA_PW, member, pw);
            case 8 -> (T) SchemaUtils.validateSameMember($SCHEMA_NODE_CONFIRMS, member, nodeConfirms);
            case 9 -> (T) SchemaUtils.validateSameMember($SCHEMA_SYNC_ON_WRITE, member, syncOnWrite);
            case 10 -> (T) SchemaUtils.validateSameMember($SCHEMA_ASIS, member, asis);
            case 11 -> (T) SchemaUtils.validateSameMember($SCHEMA_IF_NONE_MATCH, member, ifNoneMatch);
            case 12 -> (T) SchemaUtils.validateSameMember($SCHEMA_IF_MATCH, member, ifMatch);
            case 13 -> (T) SchemaUtils.validateSameMember($SCHEMA_IF_UNMODIFIED_SINCE, member, ifUnmodifiedSince);
            case 14 -> (T) SchemaUtils.validateSameMember($SCHEMA_CONTENT_ENCODING, member, contentEncoding);
            case 15 -> (T) SchemaUtils.validateSameMember($SCHEMA_LINK, member, link);
            case 16 -> (T) SchemaUtils.validateSameMember($SCHEMA_RIAK_HEADERS, member, riakHeaders);
            default -> throw new IllegalArgumentException("Attempted to get non-existent member: " + member.id());
        };
    }

    /**
     * Closes the underlying stream.
     */
    @Override
    public void close() {
        if (body != null) {
            body.close();
        }
    }

    /**
     * Create a new builder containing all the current property values of this object.
     *
     * <p><strong>Note:</strong> This method performs only a shallow copy of the original properties.
     *
     * @return a builder for {@link PutLegacyObjectReturnBodyInput}.
     */
    public Builder toBuilder() {
        var builder = new Builder();
        builder.bucket(this.bucket);
        builder.key(this.key);
        builder.timeout(this.timeout);
        builder.w(this.w);
        builder.dw(this.dw);
        builder.pw(this.pw);
        builder.nodeConfirms(this.nodeConfirms);
        builder.syncOnWrite(this.syncOnWrite);
        builder.asis(this.asis);
        builder.ifNoneMatch(this.ifNoneMatch);
        builder.ifMatch(this.ifMatch);
        builder.ifUnmodifiedSince(this.ifUnmodifiedSince);
        builder.contentType(this.contentType);
        builder.contentEncoding(this.contentEncoding);
        builder.link(this.link);
        builder.riakHeaders(this.riakHeaders);
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
     * Builder for {@link PutLegacyObjectReturnBodyInput}.
     */
    public static final class Builder implements ShapeBuilder<PutLegacyObjectReturnBodyInput> {
        private final PresenceTracker tracker = PresenceTracker.of($SCHEMA);
        private String bucket;
        private String key;
        private Integer timeout;
        private String w;
        private String dw;
        private String pw;
        private Integer nodeConfirms;
        private SyncOnWrite syncOnWrite;
        private Boolean asis;
        private String ifNoneMatch;
        private String ifMatch;
        private Instant ifUnmodifiedSince;
        private String contentType;
        private String contentEncoding;
        private String link;
        private Map<String, String> riakHeaders;
        private DataStream body;

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
        public Builder dw(String dw) {
            this.dw = dw;
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
        public Builder nodeConfirms(Integer nodeConfirms) {
            this.nodeConfirms = nodeConfirms;
            return this;
        }

        /**
         * @return this builder.
         */
        public Builder syncOnWrite(SyncOnWrite syncOnWrite) {
            this.syncOnWrite = syncOnWrite;
            return this;
        }

        /**
         * @return this builder.
         */
        public Builder asis(Boolean asis) {
            this.asis = asis;
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
         * <p><strong>Required</strong>
         * @return this builder.
         */
        public Builder contentType(String contentType) {
            this.contentType = Objects.requireNonNull(contentType, "contentType cannot be null");
            tracker.setMember($SCHEMA_CONTENT_TYPE);
            return this;
        }

        /**
         * @return this builder.
         */
        public Builder contentEncoding(String contentEncoding) {
            this.contentEncoding = contentEncoding;
            return this;
        }

        /**
         * @return this builder.
         */
        public Builder link(String link) {
            this.link = link;
            return this;
        }

        /**
         * @return this builder.
         */
        public Builder riakHeaders(Map<String, String> riakHeaders) {
            this.riakHeaders = riakHeaders;
            return this;
        }

        /**
         * <p><strong>Required</strong>
         * @return this builder.
         */
        public Builder body(DataStream body) {
            this.body = Objects.requireNonNull(body, "body cannot be null");
            tracker.setMember($SCHEMA_BODY);
            return this;
        }

        @Override
        public PutLegacyObjectReturnBodyInput build() {
            tracker.validate();
            return new PutLegacyObjectReturnBodyInput(this);
        }

        @Override
        @SuppressWarnings("unchecked")
        public void setMemberValue(Schema member, Object value) {
            switch (member.memberIndex()) {
                case 0 -> bucket((String) SchemaUtils.validateSameMember($SCHEMA_BUCKET, member, value));
                case 1 -> key((String) SchemaUtils.validateSameMember($SCHEMA_KEY, member, value));
                case 2 -> contentType((String) SchemaUtils.validateSameMember($SCHEMA_CONTENT_TYPE, member, value));
                case 3 -> body((DataStream) SchemaUtils.validateSameMember($SCHEMA_BODY, member, value));
                case 4 -> timeout((Integer) SchemaUtils.validateSameMember($SCHEMA_TIMEOUT, member, value));
                case 5 -> w((String) SchemaUtils.validateSameMember($SCHEMA_W, member, value));
                case 6 -> dw((String) SchemaUtils.validateSameMember($SCHEMA_DW, member, value));
                case 7 -> pw((String) SchemaUtils.validateSameMember($SCHEMA_PW, member, value));
                case 8 -> nodeConfirms((Integer) SchemaUtils.validateSameMember($SCHEMA_NODE_CONFIRMS, member, value));
                case 9 -> syncOnWrite((SyncOnWrite) SchemaUtils.validateSameMember($SCHEMA_SYNC_ON_WRITE, member, value));
                case 10 -> asis((Boolean) SchemaUtils.validateSameMember($SCHEMA_ASIS, member, value));
                case 11 -> ifNoneMatch((String) SchemaUtils.validateSameMember($SCHEMA_IF_NONE_MATCH, member, value));
                case 12 -> ifMatch((String) SchemaUtils.validateSameMember($SCHEMA_IF_MATCH, member, value));
                case 13 -> ifUnmodifiedSince((Instant) SchemaUtils.validateSameMember($SCHEMA_IF_UNMODIFIED_SINCE, member, value));
                case 14 -> contentEncoding((String) SchemaUtils.validateSameMember($SCHEMA_CONTENT_ENCODING, member, value));
                case 15 -> link((String) SchemaUtils.validateSameMember($SCHEMA_LINK, member, value));
                case 16 -> riakHeaders((Map<String, String>) SchemaUtils.validateSameMember($SCHEMA_RIAK_HEADERS, member, value));
                default -> ShapeBuilder.super.setMemberValue(member, value);
            }
        }

        @Override
        public ShapeBuilder<PutLegacyObjectReturnBodyInput> errorCorrection() {
            if (tracker.allSet()) {
                return this;
            }
            if (!tracker.checkMember($SCHEMA_BUCKET)) {
                bucket("");
            }
            if (!tracker.checkMember($SCHEMA_KEY)) {
                key("");
            }
            if (!tracker.checkMember($SCHEMA_CONTENT_TYPE)) {
                contentType("");
            }
            if (!tracker.checkMember($SCHEMA_BODY)) {
                body(DataStream.ofEmpty());
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
                    case 2 -> builder.contentType(de.readString(member));
                    case 3 -> builder.body(de.readDataStream(member));
                    case 4 -> builder.timeout(de.readInteger(member));
                    case 5 -> builder.w(de.readString(member));
                    case 6 -> builder.dw(de.readString(member));
                    case 7 -> builder.pw(de.readString(member));
                    case 8 -> builder.nodeConfirms(de.readInteger(member));
                    case 9 -> builder.syncOnWrite(SyncOnWrite.builder().deserializeMember(de, member).build());
                    case 10 -> builder.asis(de.readBoolean(member));
                    case 11 -> builder.ifNoneMatch(de.readString(member));
                    case 12 -> builder.ifMatch(de.readString(member));
                    case 13 -> builder.ifUnmodifiedSince(de.readTimestamp(member));
                    case 14 -> builder.contentEncoding(de.readString(member));
                    case 15 -> builder.link(de.readString(member));
                    case 16 -> builder.riakHeaders(SharedSerde.deserializeRiakHeaders(member, de));
                    default -> throw new IllegalArgumentException("Unexpected member: " + member.memberName());
                }
            }
        }
    }
}
