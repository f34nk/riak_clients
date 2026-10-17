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
 * Tombstone reads expose X-Riak-Deleted via riakHeaders key deleted.
 */
@SmithyGenerated
public final class PostObjectReturnBodyOutput implements SerializableStruct, Closeable {

    public static final Schema $SCHEMA = Schemas.POST_OBJECT_RETURN_BODY_OUTPUT;
    private static final Schema $SCHEMA_STATUS_CODE = $SCHEMA.member("statusCode");
    private static final Schema $SCHEMA_CONTENT_TYPE = $SCHEMA.member("contentType");
    private static final Schema $SCHEMA_CONTENT_ENCODING = $SCHEMA.member("contentEncoding");
    private static final Schema $SCHEMA_ETAG = $SCHEMA.member("etag");
    private static final Schema $SCHEMA_LAST_MODIFIED = $SCHEMA.member("lastModified");
    private static final Schema $SCHEMA_LINK = $SCHEMA.member("link");
    private static final Schema $SCHEMA_RIAK_HEADERS = $SCHEMA.member("riakHeaders");
    private static final Schema $SCHEMA_BODY = $SCHEMA.member("body");

    public static final ShapeId $ID = $SCHEMA.id();

    private final transient Integer statusCode;
    private final transient String contentType;
    private final transient String contentEncoding;
    private final transient String etag;
    private final transient Instant lastModified;
    private final transient String link;
    private final transient Map<String, String> riakHeaders;
    private final transient DataStream body;

    private PostObjectReturnBodyOutput(Builder builder) {
        this.statusCode = builder.statusCode;
        this.contentType = builder.contentType;
        this.contentEncoding = builder.contentEncoding;
        this.etag = builder.etag;
        this.lastModified = builder.lastModified;
        this.link = builder.link;
        this.riakHeaders = builder.riakHeaders == null ? null : Collections.unmodifiableMap(builder.riakHeaders);
        this.body = builder.body;
    }

    public Integer getStatusCode() {
        return statusCode;
    }

    public String getContentType() {
        return contentType;
    }

    public String getContentEncoding() {
        return contentEncoding;
    }

    public String getEtag() {
        return etag;
    }

    public Instant getLastModified() {
        return lastModified;
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
        PostObjectReturnBodyOutput that = (PostObjectReturnBodyOutput) other;
        return Objects.equals(this.statusCode, that.statusCode)
               && Objects.equals(this.contentType, that.contentType)
               && Objects.equals(this.contentEncoding, that.contentEncoding)
               && Objects.equals(this.etag, that.etag)
               && Objects.equals(this.link, that.link)
               && Objects.equals(this.lastModified, that.lastModified)
               && Objects.equals(this.body, that.body)
               && Objects.equals(this.riakHeaders, that.riakHeaders);
    }

    @Override
    public int hashCode() {
        int $hc = Objects.hashCode(statusCode);
        $hc = 31 * $hc + Objects.hashCode(contentType);
        $hc = 31 * $hc + Objects.hashCode(contentEncoding);
        $hc = 31 * $hc + Objects.hashCode(etag);
        $hc = 31 * $hc + Objects.hashCode(lastModified);
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
        if (statusCode != null) {
            serializer.writeInteger($SCHEMA_STATUS_CODE, statusCode);
        }
        if (contentType != null) {
            serializer.writeString($SCHEMA_CONTENT_TYPE, contentType);
        }
        if (contentEncoding != null) {
            serializer.writeString($SCHEMA_CONTENT_ENCODING, contentEncoding);
        }
        if (etag != null) {
            serializer.writeString($SCHEMA_ETAG, etag);
        }
        if (lastModified != null) {
            serializer.writeTimestamp($SCHEMA_LAST_MODIFIED, lastModified);
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
            case 0 -> (T) SchemaUtils.validateSameMember($SCHEMA_BODY, member, body);
            case 1 -> (T) SchemaUtils.validateSameMember($SCHEMA_STATUS_CODE, member, statusCode);
            case 2 -> (T) SchemaUtils.validateSameMember($SCHEMA_CONTENT_TYPE, member, contentType);
            case 3 -> (T) SchemaUtils.validateSameMember($SCHEMA_CONTENT_ENCODING, member, contentEncoding);
            case 4 -> (T) SchemaUtils.validateSameMember($SCHEMA_ETAG, member, etag);
            case 5 -> (T) SchemaUtils.validateSameMember($SCHEMA_LAST_MODIFIED, member, lastModified);
            case 6 -> (T) SchemaUtils.validateSameMember($SCHEMA_LINK, member, link);
            case 7 -> (T) SchemaUtils.validateSameMember($SCHEMA_RIAK_HEADERS, member, riakHeaders);
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
     * @return a builder for {@link PostObjectReturnBodyOutput}.
     */
    public Builder toBuilder() {
        var builder = new Builder();
        builder.statusCode(this.statusCode);
        builder.contentType(this.contentType);
        builder.contentEncoding(this.contentEncoding);
        builder.etag(this.etag);
        builder.lastModified(this.lastModified);
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
     * Builder for {@link PostObjectReturnBodyOutput}.
     */
    public static final class Builder implements ShapeBuilder<PostObjectReturnBodyOutput> {
        private final PresenceTracker tracker = PresenceTracker.of($SCHEMA);
        private Integer statusCode;
        private String contentType;
        private String contentEncoding;
        private String etag;
        private Instant lastModified;
        private String link;
        private Map<String, String> riakHeaders;
        private DataStream body;

        private Builder() {}

        @Override
        public Schema schema() {
            return $SCHEMA;
        }

        /**
         * @return this builder.
         */
        public Builder statusCode(Integer statusCode) {
            this.statusCode = statusCode;
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
        public Builder contentEncoding(String contentEncoding) {
            this.contentEncoding = contentEncoding;
            return this;
        }

        /**
         * @return this builder.
         */
        public Builder etag(String etag) {
            this.etag = etag;
            return this;
        }

        /**
         * @return this builder.
         */
        public Builder lastModified(Instant lastModified) {
            this.lastModified = lastModified;
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
        public PostObjectReturnBodyOutput build() {
            tracker.validate();
            return new PostObjectReturnBodyOutput(this);
        }

        @Override
        @SuppressWarnings("unchecked")
        public void setMemberValue(Schema member, Object value) {
            switch (member.memberIndex()) {
                case 0 -> body((DataStream) SchemaUtils.validateSameMember($SCHEMA_BODY, member, value));
                case 1 -> statusCode((Integer) SchemaUtils.validateSameMember($SCHEMA_STATUS_CODE, member, value));
                case 2 -> contentType((String) SchemaUtils.validateSameMember($SCHEMA_CONTENT_TYPE, member, value));
                case 3 -> contentEncoding((String) SchemaUtils.validateSameMember($SCHEMA_CONTENT_ENCODING, member, value));
                case 4 -> etag((String) SchemaUtils.validateSameMember($SCHEMA_ETAG, member, value));
                case 5 -> lastModified((Instant) SchemaUtils.validateSameMember($SCHEMA_LAST_MODIFIED, member, value));
                case 6 -> link((String) SchemaUtils.validateSameMember($SCHEMA_LINK, member, value));
                case 7 -> riakHeaders((Map<String, String>) SchemaUtils.validateSameMember($SCHEMA_RIAK_HEADERS, member, value));
                default -> ShapeBuilder.super.setMemberValue(member, value);
            }
        }

        @Override
        public ShapeBuilder<PostObjectReturnBodyOutput> errorCorrection() {
            if (tracker.allSet()) {
                return this;
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
                    case 0 -> builder.body(de.readDataStream(member));
                    case 1 -> builder.statusCode(de.readInteger(member));
                    case 2 -> builder.contentType(de.readString(member));
                    case 3 -> builder.contentEncoding(de.readString(member));
                    case 4 -> builder.etag(de.readString(member));
                    case 5 -> builder.lastModified(de.readTimestamp(member));
                    case 6 -> builder.link(de.readString(member));
                    case 7 -> builder.riakHeaders(SharedSerde.deserializeRiakHeaders(member, de));
                    default -> throw new IllegalArgumentException("Unexpected member: " + member.memberName());
                }
            }
        }
    }
}
