package openriak.v3_4.api.model;

import software.amazon.smithy.java.core.schema.PreludeSchemas;
import software.amazon.smithy.java.core.schema.Schema;
import software.amazon.smithy.model.shapes.ShapeId;
import software.amazon.smithy.model.traits.ErrorTrait;
import software.amazon.smithy.model.traits.LengthTrait;
import software.amazon.smithy.model.traits.PatternTrait;
import software.amazon.smithy.model.traits.RequiredTrait;
import software.amazon.smithy.model.traits.StreamingTrait;
import software.amazon.smithy.model.traits.UnitTypeTrait;

/**
 * Defines schemas for shapes in the model package.
 */
final class Schemas {
    static final Schema MEDIA_TYPE = Schema.createString(ShapeId.from("openriak.v3_4.api#MediaType"));
    static final Schema HEADER_VALUE = Schema.createString(ShapeId.from("openriak.v3_4.api#HeaderValue"));
    static final Schema RIAK_HEADERS = Schema.mapBuilder(ShapeId.from("openriak.v3_4.api#RiakHeaders"))
        .putMember("key", PreludeSchemas.STRING)
        .putMember("value", Schemas.HEADER_VALUE)
        .build();

    static final Schema BAD_REQUEST_ERROR = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#BadRequestError"),
            new ErrorTrait("client"))
             .putMember("message", PreludeSchemas.STRING)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("riakHeaders", Schemas.RIAK_HEADERS)
             .builderSupplier(BadRequestError::builder)
             .shapeClass(BadRequestError.class)
             .build();

    static final Schema URI_SAFE_IDENTIFIER = Schema.createString(ShapeId.from("openriak.v3_4.api#UriSafeIdentifier"),
            new PatternTrait("^[A-Za-z0-9._~-]+$"));
    static final Schema QUERY_SPEC = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#QuerySpec"))
             .putMember("indexName", PreludeSchemas.STRING,
                     new RequiredTrait())
             .putMember("startTerm", PreludeSchemas.STRING)
             .putMember("endTerm", PreludeSchemas.STRING)
             .putMember("aggregationTag", PreludeSchemas.STRING)
             .putMember("regularExpression", PreludeSchemas.STRING)
             .putMember("evaluationExpression", PreludeSchemas.STRING)
             .putMember("filterExpression", PreludeSchemas.STRING)
             .builderSupplier(QuerySpec::builder)
             .shapeClass(QuerySpec.class)
             .build();

    static final Schema QUERY_LIST = Schema.listBuilder(ShapeId.from("openriak.v3_4.api#QueryList"))
        .putMember("member", Schemas.QUERY_SPEC)
        .build();

    static final Schema BUCKET_QUERY_REQUEST = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#BucketQueryRequest"))
             .putMember("queryList", Schemas.QUERY_LIST,
                     new RequiredTrait())
             .putMember("aggregationExpression", PreludeSchemas.STRING)
             .putMember("accumulationOption", PreludeSchemas.STRING)
             .putMember("accumulationTerm", PreludeSchemas.STRING)
             .putMember("substitutions", PreludeSchemas.DOCUMENT)
             .putMember("timeout", PreludeSchemas.INTEGER)
             .putMember("inactivityTimeout", PreludeSchemas.INTEGER)
             .putMember("maxResults", PreludeSchemas.INTEGER)
             .putMember("continuation", PreludeSchemas.STRING)
             .builderSupplier(BucketQueryRequest::builder)
             .shapeClass(BucketQueryRequest.class)
             .build();

    static final Schema BYTE_STREAM = Schema.createBlob(ShapeId.from("openriak.v3_4.api#ByteStream"),
            new StreamingTrait());
    static final Schema CONFLICT_ERROR = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#ConflictError"),
            new ErrorTrait("client"))
             .putMember("message", PreludeSchemas.STRING)
             .putMember("riakHeaders", Schemas.RIAK_HEADERS)
             .builderSupplier(ConflictError::builder)
             .shapeClass(ConflictError.class)
             .build();

    static final Schema QUORUM = Schema.createString(ShapeId.from("openriak.v3_4.api#Quorum"),
            new PatternTrait("^(default|one|quorum|all|[0-9]+)$"));
    static final Schema DATATYPE_UPDATE_PAYLOAD = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#DatatypeUpdatePayload"))
             .putMember("increment", PreludeSchemas.INTEGER)
             .putMember("decrement", PreludeSchemas.INTEGER)
             .putMember("type", PreludeSchemas.STRING)
             .putMember("value", PreludeSchemas.DOCUMENT)
             .putMember("context", PreludeSchemas.STRING)
             .builderSupplier(DatatypeUpdatePayload::builder)
             .shapeClass(DatatypeUpdatePayload.class)
             .build();

    static final Schema CREATE_DATATYPE_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#DatatypeCreateInput"))
             .putMember("bucketType", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("bucket", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("timeout", PreludeSchemas.INTEGER)
             .putMember("r", Schemas.QUORUM)
             .putMember("pr", Schemas.QUORUM)
             .putMember("w", Schemas.QUORUM)
             .putMember("pw", Schemas.QUORUM)
             .putMember("dw", Schemas.QUORUM)
             .putMember("returnBody", PreludeSchemas.BOOLEAN)
             .putMember("includeContext", PreludeSchemas.BOOLEAN)
             .putMember("contentType", Schemas.MEDIA_TYPE,
                     new RequiredTrait())
             .putMember("update", Schemas.DATATYPE_UPDATE_PAYLOAD,
                     new RequiredTrait())
             .builderSupplier(CreateDatatypeInput::builder)
             .shapeClass(CreateDatatypeInput.class)
             .build();

    static final Schema JSON_DOCUMENT = Schema.createDocument(ShapeId.from("openriak.v3_4.api#JsonDocument"));
    static final Schema CREATE_DATATYPE_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#DatatypeCreateOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("location", PreludeSchemas.STRING)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("crdtContext", PreludeSchemas.STRING)
             .putMember("body", Schemas.JSON_DOCUMENT)
             .builderSupplier(CreateDatatypeOutput::builder)
             .shapeClass(CreateDatatypeOutput.class)
             .build();

    static final Schema FORBIDDEN_ERROR = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#ForbiddenError"),
            new ErrorTrait("client"))
             .putMember("message", PreludeSchemas.STRING)
             .builderSupplier(ForbiddenError::builder)
             .shapeClass(ForbiddenError.class)
             .build();

    static final Schema INTERNAL_SERVER_ERROR = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#InternalServerError"),
            new ErrorTrait("server"))
             .putMember("message", PreludeSchemas.STRING)
             .builderSupplier(InternalServerError::builder)
             .shapeClass(InternalServerError.class)
             .build();

    static final Schema MOVED_PERMANENTLY_ERROR = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#MovedPermanentlyError"),
            new ErrorTrait("client"))
             .putMember("message", PreludeSchemas.STRING)
             .putMember("location", PreludeSchemas.STRING)
             .builderSupplier(MovedPermanentlyError::builder)
             .shapeClass(MovedPermanentlyError.class)
             .build();

    static final Schema TIMEOUT_ERROR = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#TimeoutError"),
            new ErrorTrait("server"))
             .putMember("message", PreludeSchemas.STRING)
             .putMember("retryAfter", PreludeSchemas.STRING)
             .putMember("riakHeaders", Schemas.RIAK_HEADERS)
             .builderSupplier(TimeoutError::builder)
             .shapeClass(TimeoutError.class)
             .build();

    static final Schema UNAUTHORIZED_ERROR = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#UnauthorizedError"),
            new ErrorTrait("client"))
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("message", PreludeSchemas.STRING)
             .builderSupplier(UnauthorizedError::builder)
             .shapeClass(UnauthorizedError.class)
             .build();

    static final Schema UPGRADE_REQUIRED_ERROR = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#UpgradeRequiredError"),
            new ErrorTrait("client"))
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("message", PreludeSchemas.STRING)
             .builderSupplier(UpgradeRequiredError::builder)
             .shapeClass(UpgradeRequiredError.class)
             .build();

    static final Schema HTTP_DATE = Schema.createTimestamp(ShapeId.from("openriak.v3_4.api#HttpDate"));
    static final Schema CREATE_DEFAULT_OBJECT_OPERATION_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#CreateDefaultObjectInput"))
             .putMember("bucket", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("timeout", PreludeSchemas.INTEGER)
             .putMember("w", Schemas.QUORUM)
             .putMember("dw", Schemas.QUORUM)
             .putMember("pw", Schemas.QUORUM)
             .putMember("nodeConfirms", PreludeSchemas.INTEGER)
             .putMember("syncOnWrite", SyncOnWrite.$SCHEMA)
             .putMember("asis", PreludeSchemas.BOOLEAN)
             .putMember("ifNoneMatch", PreludeSchemas.STRING)
             .putMember("ifMatch", PreludeSchemas.STRING)
             .putMember("ifUnmodifiedSince", Schemas.HTTP_DATE)
             .putMember("contentType", Schemas.MEDIA_TYPE,
                     new RequiredTrait())
             .putMember("contentEncoding", PreludeSchemas.STRING)
             .putMember("link", PreludeSchemas.STRING)
             .putMember("riakHeaders", Schemas.RIAK_HEADERS)
             .putMember("body", Schemas.BYTE_STREAM,
                     new RequiredTrait())
             .builderSupplier(CreateDefaultObjectOperationInput::builder)
             .shapeClass(CreateDefaultObjectOperationInput.class)
             .build();

    static final Schema CREATE_DEFAULT_OBJECT_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#CreateObjectOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("location", PreludeSchemas.STRING)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("contentEncoding", PreludeSchemas.STRING)
             .putMember("etag", PreludeSchemas.STRING)
             .putMember("lastModified", Schemas.HTTP_DATE)
             .putMember("link", PreludeSchemas.STRING)
             .putMember("riakHeaders", Schemas.RIAK_HEADERS)
             .builderSupplier(CreateDefaultObjectOutput::builder)
             .shapeClass(CreateDefaultObjectOutput.class)
             .build();

    static final Schema NOT_ACCEPTABLE_ERROR = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#NotAcceptableError"),
            new ErrorTrait("client"))
             .putMember("message", PreludeSchemas.STRING)
             .builderSupplier(NotAcceptableError::builder)
             .shapeClass(NotAcceptableError.class)
             .build();

    static final Schema V_CLOCK = Schema.createString(ShapeId.from("openriak.v3_4.api#VClock"));
    static final Schema PRECONDITION_FAILED_ERROR = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#PreconditionFailedError"),
            new ErrorTrait("client"))
             .putMember("message", PreludeSchemas.STRING)
             .putMember("vclock", Schemas.V_CLOCK)
             .builderSupplier(PreconditionFailedError::builder)
             .shapeClass(PreconditionFailedError.class)
             .build();

    static final Schema CREATE_DEFAULT_OBJECT_RETURN_BODY_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#CreateDefaultObjectInput"))
             .putMember("bucket", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("timeout", PreludeSchemas.INTEGER)
             .putMember("w", Schemas.QUORUM)
             .putMember("dw", Schemas.QUORUM)
             .putMember("pw", Schemas.QUORUM)
             .putMember("nodeConfirms", PreludeSchemas.INTEGER)
             .putMember("syncOnWrite", SyncOnWrite.$SCHEMA)
             .putMember("asis", PreludeSchemas.BOOLEAN)
             .putMember("ifNoneMatch", PreludeSchemas.STRING)
             .putMember("ifMatch", PreludeSchemas.STRING)
             .putMember("ifUnmodifiedSince", Schemas.HTTP_DATE)
             .putMember("contentType", Schemas.MEDIA_TYPE,
                     new RequiredTrait())
             .putMember("contentEncoding", PreludeSchemas.STRING)
             .putMember("link", PreludeSchemas.STRING)
             .putMember("riakHeaders", Schemas.RIAK_HEADERS)
             .putMember("body", Schemas.BYTE_STREAM,
                     new RequiredTrait())
             .builderSupplier(CreateDefaultObjectReturnBodyInput::builder)
             .shapeClass(CreateDefaultObjectReturnBodyInput.class)
             .build();

    static final Schema CREATE_DEFAULT_OBJECT_RETURN_BODY_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#CreateObjectReturnBodyOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("location", PreludeSchemas.STRING)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("contentEncoding", PreludeSchemas.STRING)
             .putMember("etag", PreludeSchemas.STRING)
             .putMember("lastModified", Schemas.HTTP_DATE)
             .putMember("link", PreludeSchemas.STRING)
             .putMember("riakHeaders", Schemas.RIAK_HEADERS)
             .putMember("body", Schemas.BYTE_STREAM,
                     new RequiredTrait())
             .builderSupplier(CreateDefaultObjectReturnBodyOutput::builder)
             .shapeClass(CreateDefaultObjectReturnBodyOutput.class)
             .build();

    static final Schema CREATE_OBJECT_OPERATION_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#CreateObjectInput"))
             .putMember("bucketType", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("bucket", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("timeout", PreludeSchemas.INTEGER)
             .putMember("w", Schemas.QUORUM)
             .putMember("dw", Schemas.QUORUM)
             .putMember("pw", Schemas.QUORUM)
             .putMember("nodeConfirms", PreludeSchemas.INTEGER)
             .putMember("syncOnWrite", SyncOnWrite.$SCHEMA)
             .putMember("asis", PreludeSchemas.BOOLEAN)
             .putMember("ifNoneMatch", PreludeSchemas.STRING)
             .putMember("ifMatch", PreludeSchemas.STRING)
             .putMember("ifUnmodifiedSince", Schemas.HTTP_DATE)
             .putMember("contentType", Schemas.MEDIA_TYPE,
                     new RequiredTrait())
             .putMember("contentEncoding", PreludeSchemas.STRING)
             .putMember("link", PreludeSchemas.STRING)
             .putMember("riakHeaders", Schemas.RIAK_HEADERS)
             .putMember("body", Schemas.BYTE_STREAM,
                     new RequiredTrait())
             .builderSupplier(CreateObjectOperationInput::builder)
             .shapeClass(CreateObjectOperationInput.class)
             .build();

    static final Schema CREATE_OBJECT_OPERATION_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#CreateObjectOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("location", PreludeSchemas.STRING)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("contentEncoding", PreludeSchemas.STRING)
             .putMember("etag", PreludeSchemas.STRING)
             .putMember("lastModified", Schemas.HTTP_DATE)
             .putMember("link", PreludeSchemas.STRING)
             .putMember("riakHeaders", Schemas.RIAK_HEADERS)
             .builderSupplier(CreateObjectOperationOutput::builder)
             .shapeClass(CreateObjectOperationOutput.class)
             .build();

    static final Schema CREATE_OBJECT_RETURN_BODY_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#CreateObjectInput"))
             .putMember("bucketType", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("bucket", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("timeout", PreludeSchemas.INTEGER)
             .putMember("w", Schemas.QUORUM)
             .putMember("dw", Schemas.QUORUM)
             .putMember("pw", Schemas.QUORUM)
             .putMember("nodeConfirms", PreludeSchemas.INTEGER)
             .putMember("syncOnWrite", SyncOnWrite.$SCHEMA)
             .putMember("asis", PreludeSchemas.BOOLEAN)
             .putMember("ifNoneMatch", PreludeSchemas.STRING)
             .putMember("ifMatch", PreludeSchemas.STRING)
             .putMember("ifUnmodifiedSince", Schemas.HTTP_DATE)
             .putMember("contentType", Schemas.MEDIA_TYPE,
                     new RequiredTrait())
             .putMember("contentEncoding", PreludeSchemas.STRING)
             .putMember("link", PreludeSchemas.STRING)
             .putMember("riakHeaders", Schemas.RIAK_HEADERS)
             .putMember("body", Schemas.BYTE_STREAM,
                     new RequiredTrait())
             .builderSupplier(CreateObjectReturnBodyInput::builder)
             .shapeClass(CreateObjectReturnBodyInput.class)
             .build();

    static final Schema CREATE_OBJECT_RETURN_BODY_OPERATION_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#CreateObjectReturnBodyOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("location", PreludeSchemas.STRING)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("contentEncoding", PreludeSchemas.STRING)
             .putMember("etag", PreludeSchemas.STRING)
             .putMember("lastModified", Schemas.HTTP_DATE)
             .putMember("link", PreludeSchemas.STRING)
             .putMember("riakHeaders", Schemas.RIAK_HEADERS)
             .putMember("body", Schemas.BYTE_STREAM,
                     new RequiredTrait())
             .builderSupplier(CreateObjectReturnBodyOperationOutput::builder)
             .shapeClass(CreateObjectReturnBodyOperationOutput.class)
             .build();

    static final Schema DELETE_DEFAULT_OBJECT_OPERATION_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#DeleteDefaultObjectInput"))
             .putMember("bucket", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("key", PreludeSchemas.STRING,
                     new RequiredTrait())
             .putMember("timeout", PreludeSchemas.INTEGER)
             .putMember("r", Schemas.QUORUM)
             .putMember("w", Schemas.QUORUM)
             .putMember("rw", Schemas.QUORUM)
             .putMember("pr", Schemas.QUORUM)
             .putMember("pw", Schemas.QUORUM)
             .putMember("dw", Schemas.QUORUM)
             .putMember("ifNoneMatch", PreludeSchemas.STRING)
             .putMember("ifMatch", PreludeSchemas.STRING)
             .putMember("ifUnmodifiedSince", Schemas.HTTP_DATE)
             .putMember("riakHeaders", Schemas.RIAK_HEADERS)
             .builderSupplier(DeleteDefaultObjectOperationInput::builder)
             .shapeClass(DeleteDefaultObjectOperationInput.class)
             .build();

    static final Schema DELETE_DEFAULT_OBJECT_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#EmptyOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .builderSupplier(DeleteDefaultObjectOutput::builder)
             .shapeClass(DeleteDefaultObjectOutput.class)
             .build();

    static final Schema NOT_FOUND_ERROR = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#NotFoundError"),
            new ErrorTrait("client"))
             .putMember("message", PreludeSchemas.STRING)
             .putMember("riakHeaders", Schemas.RIAK_HEADERS)
             .builderSupplier(NotFoundError::builder)
             .shapeClass(NotFoundError.class)
             .build();

    static final Schema DELETE_LEGACY_OBJECT_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#DeleteDefaultObjectInput"))
             .putMember("bucket", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("key", PreludeSchemas.STRING,
                     new RequiredTrait())
             .putMember("timeout", PreludeSchemas.INTEGER)
             .putMember("r", Schemas.QUORUM)
             .putMember("w", Schemas.QUORUM)
             .putMember("rw", Schemas.QUORUM)
             .putMember("pr", Schemas.QUORUM)
             .putMember("pw", Schemas.QUORUM)
             .putMember("dw", Schemas.QUORUM)
             .putMember("ifNoneMatch", PreludeSchemas.STRING)
             .putMember("ifMatch", PreludeSchemas.STRING)
             .putMember("ifUnmodifiedSince", Schemas.HTTP_DATE)
             .putMember("riakHeaders", Schemas.RIAK_HEADERS)
             .builderSupplier(DeleteLegacyObjectInput::builder)
             .shapeClass(DeleteLegacyObjectInput.class)
             .build();

    static final Schema DELETE_LEGACY_OBJECT_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#EmptyOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .builderSupplier(DeleteLegacyObjectOutput::builder)
             .shapeClass(DeleteLegacyObjectOutput.class)
             .build();

    static final Schema DELETE_OBJECT_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#DeleteObjectInput"))
             .putMember("bucketType", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("bucket", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("key", PreludeSchemas.STRING,
                     new RequiredTrait())
             .putMember("timeout", PreludeSchemas.INTEGER)
             .putMember("r", Schemas.QUORUM)
             .putMember("w", Schemas.QUORUM)
             .putMember("rw", Schemas.QUORUM)
             .putMember("pr", Schemas.QUORUM)
             .putMember("pw", Schemas.QUORUM)
             .putMember("dw", Schemas.QUORUM)
             .putMember("ifNoneMatch", PreludeSchemas.STRING)
             .putMember("ifMatch", PreludeSchemas.STRING)
             .putMember("ifUnmodifiedSince", Schemas.HTTP_DATE)
             .putMember("riakHeaders", Schemas.RIAK_HEADERS)
             .builderSupplier(DeleteObjectInput::builder)
             .shapeClass(DeleteObjectInput.class)
             .build();

    static final Schema DELETE_OBJECT_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#EmptyOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .builderSupplier(DeleteObjectOutput::builder)
             .shapeClass(DeleteObjectOutput.class)
             .build();

    static final Schema GET_BUCKET_PROPERTIES_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#BucketInput"))
             .putMember("bucketType", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("bucket", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("timeout", PreludeSchemas.INTEGER)
             .builderSupplier(GetBucketPropertiesInput::builder)
             .shapeClass(GetBucketPropertiesInput.class)
             .build();

    static final Schema GET_BUCKET_PROPERTIES_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#JsonOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("body", Schemas.JSON_DOCUMENT)
             .builderSupplier(GetBucketPropertiesOutput::builder)
             .shapeClass(GetBucketPropertiesOutput.class)
             .build();

    static final Schema GET_BUCKET_QUERY_RESULTS_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#BucketQueryResultsInput"))
             .putMember("bucketType", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("bucket", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("timeout", PreludeSchemas.INTEGER)
             .putMember("resultQueue", PreludeSchemas.STRING,
                     new RequiredTrait())
             .putMember("maxResults", PreludeSchemas.INTEGER)
             .builderSupplier(GetBucketQueryResultsInput::builder)
             .shapeClass(GetBucketQueryResultsInput.class)
             .build();

    static final Schema GET_BUCKET_QUERY_RESULTS_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#QueryOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("continuation", PreludeSchemas.STRING)
             .putMember("body", Schemas.JSON_DOCUMENT)
             .builderSupplier(GetBucketQueryResultsOutput::builder)
             .shapeClass(GetBucketQueryResultsOutput.class)
             .build();

    static final Schema GONE_ERROR = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#GoneError"),
            new ErrorTrait("client"))
             .putMember("message", PreludeSchemas.STRING)
             .builderSupplier(GoneError::builder)
             .shapeClass(GoneError.class)
             .build();

    static final Schema GET_BUCKET_TYPE_PROPERTIES_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#BucketTypeInput"))
             .putMember("bucketType", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("timeout", PreludeSchemas.INTEGER)
             .builderSupplier(GetBucketTypePropertiesInput::builder)
             .shapeClass(GetBucketTypePropertiesInput.class)
             .build();

    static final Schema GET_BUCKET_TYPE_PROPERTIES_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#JsonOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("body", Schemas.JSON_DOCUMENT)
             .builderSupplier(GetBucketTypePropertiesOutput::builder)
             .shapeClass(GetBucketTypePropertiesOutput.class)
             .build();

    static final Schema GET_DATATYPE_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#DatatypeReadInput"))
             .putMember("bucketType", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("bucket", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("key", PreludeSchemas.STRING,
                     new RequiredTrait())
             .putMember("timeout", PreludeSchemas.INTEGER)
             .putMember("r", Schemas.QUORUM)
             .putMember("pr", Schemas.QUORUM)
             .putMember("w", Schemas.QUORUM)
             .putMember("pw", Schemas.QUORUM)
             .putMember("dw", Schemas.QUORUM)
             .putMember("returnBody", PreludeSchemas.BOOLEAN)
             .putMember("includeContext", PreludeSchemas.BOOLEAN)
             .builderSupplier(GetDatatypeInput::builder)
             .shapeClass(GetDatatypeInput.class)
             .build();

    static final Schema GET_DATATYPE_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#DatatypeOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("crdtContext", PreludeSchemas.STRING)
             .putMember("body", Schemas.JSON_DOCUMENT)
             .builderSupplier(GetDatatypeOutput::builder)
             .shapeClass(GetDatatypeOutput.class)
             .build();

    static final Schema GET_DEFAULT_BUCKET_PROPERTIES_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#DefaultBucketInput"))
             .putMember("bucket", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("timeout", PreludeSchemas.INTEGER)
             .builderSupplier(GetDefaultBucketPropertiesInput::builder)
             .shapeClass(GetDefaultBucketPropertiesInput.class)
             .build();

    static final Schema GET_DEFAULT_BUCKET_PROPERTIES_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#JsonOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("body", Schemas.JSON_DOCUMENT)
             .builderSupplier(GetDefaultBucketPropertiesOutput::builder)
             .shapeClass(GetDefaultBucketPropertiesOutput.class)
             .build();

    static final Schema GET_DEFAULT_BUCKET_QUERY_RESULTS_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#DefaultBucketQueryResultsInput"))
             .putMember("bucket", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("timeout", PreludeSchemas.INTEGER)
             .putMember("resultQueue", PreludeSchemas.STRING,
                     new RequiredTrait())
             .putMember("maxResults", PreludeSchemas.INTEGER)
             .builderSupplier(GetDefaultBucketQueryResultsInput::builder)
             .shapeClass(GetDefaultBucketQueryResultsInput.class)
             .build();

    static final Schema GET_DEFAULT_BUCKET_QUERY_RESULTS_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#QueryOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("continuation", PreludeSchemas.STRING)
             .putMember("body", Schemas.JSON_DOCUMENT)
             .builderSupplier(GetDefaultBucketQueryResultsOutput::builder)
             .shapeClass(GetDefaultBucketQueryResultsOutput.class)
             .build();

    static final Schema GET_DEFAULT_ERASE_KEYS_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#GetDefaultEraseKeysInput"))
             .putMember("bucket", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("filter", PreludeSchemas.STRING)
             .putMember("timeout", PreludeSchemas.INTEGER)
             .builderSupplier(GetDefaultEraseKeysInput::builder)
             .shapeClass(GetDefaultEraseKeysInput.class)
             .build();

    static final Schema GET_DEFAULT_ERASE_KEYS_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#StreamOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("link", PreludeSchemas.STRING)
             .putMember("riakHeaders", Schemas.RIAK_HEADERS)
             .putMember("body", Schemas.BYTE_STREAM,
                     new RequiredTrait())
             .builderSupplier(GetDefaultEraseKeysOutput::builder)
             .shapeClass(GetDefaultEraseKeysOutput.class)
             .build();

    static final Schema GET_DEFAULT_FETCH_CLOCKS_RANGE_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#GetDefaultFetchClocksRangeInput"))
             .putMember("bucket", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("filter", PreludeSchemas.STRING)
             .putMember("timeout", PreludeSchemas.INTEGER)
             .builderSupplier(GetDefaultFetchClocksRangeInput::builder)
             .shapeClass(GetDefaultFetchClocksRangeInput.class)
             .build();

    static final Schema GET_DEFAULT_FETCH_CLOCKS_RANGE_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#StreamOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("link", PreludeSchemas.STRING)
             .putMember("riakHeaders", Schemas.RIAK_HEADERS)
             .putMember("body", Schemas.BYTE_STREAM,
                     new RequiredTrait())
             .builderSupplier(GetDefaultFetchClocksRangeOutput::builder)
             .shapeClass(GetDefaultFetchClocksRangeOutput.class)
             .build();

    static final Schema GET_DEFAULT_FIND_KEYS_BY_OBJECT_SIZE_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#GetDefaultFindKeysByObjectSizeInput"))
             .putMember("bucket", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("size", PreludeSchemas.INTEGER,
                     new RequiredTrait())
             .putMember("filter", PreludeSchemas.STRING)
             .putMember("timeout", PreludeSchemas.INTEGER)
             .builderSupplier(GetDefaultFindKeysByObjectSizeInput::builder)
             .shapeClass(GetDefaultFindKeysByObjectSizeInput.class)
             .build();

    static final Schema GET_DEFAULT_FIND_KEYS_BY_OBJECT_SIZE_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#StreamOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("link", PreludeSchemas.STRING)
             .putMember("riakHeaders", Schemas.RIAK_HEADERS)
             .putMember("body", Schemas.BYTE_STREAM,
                     new RequiredTrait())
             .builderSupplier(GetDefaultFindKeysByObjectSizeOutput::builder)
             .shapeClass(GetDefaultFindKeysByObjectSizeOutput.class)
             .build();

    static final Schema GET_DEFAULT_FIND_KEYS_BY_SIBLING_COUNT_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#GetDefaultFindKeysBySiblingCountInput"))
             .putMember("bucket", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("count", PreludeSchemas.INTEGER,
                     new RequiredTrait())
             .putMember("filter", PreludeSchemas.STRING)
             .putMember("timeout", PreludeSchemas.INTEGER)
             .builderSupplier(GetDefaultFindKeysBySiblingCountInput::builder)
             .shapeClass(GetDefaultFindKeysBySiblingCountInput.class)
             .build();

    static final Schema GET_DEFAULT_FIND_KEYS_BY_SIBLING_COUNT_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#StreamOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("link", PreludeSchemas.STRING)
             .putMember("riakHeaders", Schemas.RIAK_HEADERS)
             .putMember("body", Schemas.BYTE_STREAM,
                     new RequiredTrait())
             .builderSupplier(GetDefaultFindKeysBySiblingCountOutput::builder)
             .shapeClass(GetDefaultFindKeysBySiblingCountOutput.class)
             .build();

    static final Schema GET_DEFAULT_FIND_TOMBS_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#GetDefaultFindTombsInput"))
             .putMember("bucket", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("filter", PreludeSchemas.STRING)
             .putMember("timeout", PreludeSchemas.INTEGER)
             .builderSupplier(GetDefaultFindTombsInput::builder)
             .shapeClass(GetDefaultFindTombsInput.class)
             .build();

    static final Schema GET_DEFAULT_FIND_TOMBS_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#StreamOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("link", PreludeSchemas.STRING)
             .putMember("riakHeaders", Schemas.RIAK_HEADERS)
             .putMember("body", Schemas.BYTE_STREAM,
                     new RequiredTrait())
             .builderSupplier(GetDefaultFindTombsOutput::builder)
             .shapeClass(GetDefaultFindTombsOutput.class)
             .build();

    static final Schema NON_EMPTY_STRING = Schema.createString(ShapeId.from("openriak.v3_4.api#NonEmptyString"),
            LengthTrait.builder().min(1L).build());
    static final Schema GET_DEFAULT_MERGE_TREE_RANGE_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#GetDefaultMergeTreeRangeInput"))
             .putMember("bucket", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("treeSize", Schemas.NON_EMPTY_STRING,
                     new RequiredTrait())
             .putMember("filter", PreludeSchemas.STRING)
             .putMember("timeout", PreludeSchemas.INTEGER)
             .builderSupplier(GetDefaultMergeTreeRangeInput::builder)
             .shapeClass(GetDefaultMergeTreeRangeInput.class)
             .build();

    static final Schema GET_DEFAULT_MERGE_TREE_RANGE_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#StreamOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("link", PreludeSchemas.STRING)
             .putMember("riakHeaders", Schemas.RIAK_HEADERS)
             .putMember("body", Schemas.BYTE_STREAM,
                     new RequiredTrait())
             .builderSupplier(GetDefaultMergeTreeRangeOutput::builder)
             .shapeClass(GetDefaultMergeTreeRangeOutput.class)
             .build();

    static final Schema V_TAG = Schema.createString(ShapeId.from("openriak.v3_4.api#VTag"));
    static final Schema GET_DEFAULT_OBJECT_OPERATION_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#GetDefaultObjectInput"))
             .putMember("bucket", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("key", PreludeSchemas.STRING,
                     new RequiredTrait())
             .putMember("timeout", PreludeSchemas.INTEGER)
             .putMember("r", Schemas.QUORUM)
             .putMember("pr", Schemas.QUORUM)
             .putMember("basicQuorum", PreludeSchemas.BOOLEAN)
             .putMember("notfoundOk", PreludeSchemas.BOOLEAN)
             .putMember("nodeConfirms", PreludeSchemas.INTEGER)
             .putMember("deletedVClock", PreludeSchemas.BOOLEAN)
             .putMember("accept", Schemas.MEDIA_TYPE)
             .putMember("ifNoneMatch", PreludeSchemas.STRING)
             .putMember("ifModifiedSince", Schemas.HTTP_DATE)
             .putMember("vtag", Schemas.V_TAG)
             .builderSupplier(GetDefaultObjectOperationInput::builder)
             .shapeClass(GetDefaultObjectOperationInput.class)
             .build();

    static final Schema GET_DEFAULT_OBJECT_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#ObjectOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("contentEncoding", PreludeSchemas.STRING)
             .putMember("etag", PreludeSchemas.STRING)
             .putMember("lastModified", Schemas.HTTP_DATE)
             .putMember("link", PreludeSchemas.STRING)
             .putMember("riakHeaders", Schemas.RIAK_HEADERS)
             .putMember("body", Schemas.BYTE_STREAM,
                     new RequiredTrait())
             .builderSupplier(GetDefaultObjectOutput::builder)
             .shapeClass(GetDefaultObjectOutput.class)
             .build();

    static final Schema MULTIPLE_CHOICES_ERROR = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#MultipleChoicesError"),
            new ErrorTrait("client"))
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("vclock", Schemas.V_CLOCK)
             .putMember("body", PreludeSchemas.STRING)
             .builderSupplier(MultipleChoicesError::builder)
             .shapeClass(MultipleChoicesError.class)
             .build();

    static final Schema GET_DEFAULT_OBJECT_STATS_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#GetDefaultObjectStatsInput"))
             .putMember("bucket", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("filter", PreludeSchemas.STRING)
             .putMember("timeout", PreludeSchemas.INTEGER)
             .builderSupplier(GetDefaultObjectStatsInput::builder)
             .shapeClass(GetDefaultObjectStatsInput.class)
             .build();

    static final Schema GET_DEFAULT_OBJECT_STATS_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#StreamOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("link", PreludeSchemas.STRING)
             .putMember("riakHeaders", Schemas.RIAK_HEADERS)
             .putMember("body", Schemas.BYTE_STREAM,
                     new RequiredTrait())
             .builderSupplier(GetDefaultObjectStatsOutput::builder)
             .shapeClass(GetDefaultObjectStatsOutput.class)
             .build();

    static final Schema GET_DEFAULT_REAP_TOMBS_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#GetDefaultReapTombsInput"))
             .putMember("bucket", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("filter", PreludeSchemas.STRING)
             .putMember("timeout", PreludeSchemas.INTEGER)
             .builderSupplier(GetDefaultReapTombsInput::builder)
             .shapeClass(GetDefaultReapTombsInput.class)
             .build();

    static final Schema GET_DEFAULT_REAP_TOMBS_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#StreamOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("link", PreludeSchemas.STRING)
             .putMember("riakHeaders", Schemas.RIAK_HEADERS)
             .putMember("body", Schemas.BYTE_STREAM,
                     new RequiredTrait())
             .builderSupplier(GetDefaultReapTombsOutput::builder)
             .shapeClass(GetDefaultReapTombsOutput.class)
             .build();

    static final Schema GET_DEFAULT_REPAIR_KEYS_RANGE_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#GetDefaultRepairKeysRangeInput"))
             .putMember("bucket", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("filter", PreludeSchemas.STRING)
             .putMember("timeout", PreludeSchemas.INTEGER)
             .builderSupplier(GetDefaultRepairKeysRangeInput::builder)
             .shapeClass(GetDefaultRepairKeysRangeInput.class)
             .build();

    static final Schema GET_DEFAULT_REPAIR_KEYS_RANGE_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#StreamOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("link", PreludeSchemas.STRING)
             .putMember("riakHeaders", Schemas.RIAK_HEADERS)
             .putMember("body", Schemas.BYTE_STREAM,
                     new RequiredTrait())
             .builderSupplier(GetDefaultRepairKeysRangeOutput::builder)
             .shapeClass(GetDefaultRepairKeysRangeOutput.class)
             .build();

    static final Schema GET_DEFAULT_REPL_KEYS_RANGE_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#GetDefaultReplKeysRangeInput"))
             .putMember("bucket", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("queueName", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("filter", PreludeSchemas.STRING)
             .putMember("timeout", PreludeSchemas.INTEGER)
             .builderSupplier(GetDefaultReplKeysRangeInput::builder)
             .shapeClass(GetDefaultReplKeysRangeInput.class)
             .build();

    static final Schema GET_DEFAULT_REPL_KEYS_RANGE_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#StreamOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("link", PreludeSchemas.STRING)
             .putMember("riakHeaders", Schemas.RIAK_HEADERS)
             .putMember("body", Schemas.BYTE_STREAM,
                     new RequiredTrait())
             .builderSupplier(GetDefaultReplKeysRangeOutput::builder)
             .shapeClass(GetDefaultReplKeysRangeOutput.class)
             .build();

    static final Schema GET_ERASE_KEYS_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#GetEraseKeysInput"))
             .putMember("bucketType", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("bucket", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("filter", PreludeSchemas.STRING)
             .putMember("timeout", PreludeSchemas.INTEGER)
             .builderSupplier(GetEraseKeysInput::builder)
             .shapeClass(GetEraseKeysInput.class)
             .build();

    static final Schema GET_ERASE_KEYS_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#StreamOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("link", PreludeSchemas.STRING)
             .putMember("riakHeaders", Schemas.RIAK_HEADERS)
             .putMember("body", Schemas.BYTE_STREAM,
                     new RequiredTrait())
             .builderSupplier(GetEraseKeysOutput::builder)
             .shapeClass(GetEraseKeysOutput.class)
             .build();

    static final Schema GET_FETCH_CLOCKS_NVAL_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#GetFetchClocksNvalInput"))
             .putMember("nVal", PreludeSchemas.INTEGER,
                     new RequiredTrait())
             .putMember("filter", PreludeSchemas.STRING)
             .putMember("timeout", PreludeSchemas.INTEGER)
             .builderSupplier(GetFetchClocksNvalInput::builder)
             .shapeClass(GetFetchClocksNvalInput.class)
             .build();

    static final Schema GET_FETCH_CLOCKS_NVAL_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#StreamOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("link", PreludeSchemas.STRING)
             .putMember("riakHeaders", Schemas.RIAK_HEADERS)
             .putMember("body", Schemas.BYTE_STREAM,
                     new RequiredTrait())
             .builderSupplier(GetFetchClocksNvalOutput::builder)
             .shapeClass(GetFetchClocksNvalOutput.class)
             .build();

    static final Schema GET_FETCH_CLOCKS_RANGE_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#GetFetchClocksRangeInput"))
             .putMember("bucketType", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("bucket", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("filter", PreludeSchemas.STRING)
             .putMember("timeout", PreludeSchemas.INTEGER)
             .builderSupplier(GetFetchClocksRangeInput::builder)
             .shapeClass(GetFetchClocksRangeInput.class)
             .build();

    static final Schema GET_FETCH_CLOCKS_RANGE_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#StreamOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("link", PreludeSchemas.STRING)
             .putMember("riakHeaders", Schemas.RIAK_HEADERS)
             .putMember("body", Schemas.BYTE_STREAM,
                     new RequiredTrait())
             .builderSupplier(GetFetchClocksRangeOutput::builder)
             .shapeClass(GetFetchClocksRangeOutput.class)
             .build();

    static final Schema GET_FIND_KEYS_BY_OBJECT_SIZE_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#GetFindKeysByObjectSizeInput"))
             .putMember("bucketType", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("bucket", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("size", PreludeSchemas.INTEGER,
                     new RequiredTrait())
             .putMember("filter", PreludeSchemas.STRING)
             .putMember("timeout", PreludeSchemas.INTEGER)
             .builderSupplier(GetFindKeysByObjectSizeInput::builder)
             .shapeClass(GetFindKeysByObjectSizeInput.class)
             .build();

    static final Schema GET_FIND_KEYS_BY_OBJECT_SIZE_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#StreamOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("link", PreludeSchemas.STRING)
             .putMember("riakHeaders", Schemas.RIAK_HEADERS)
             .putMember("body", Schemas.BYTE_STREAM,
                     new RequiredTrait())
             .builderSupplier(GetFindKeysByObjectSizeOutput::builder)
             .shapeClass(GetFindKeysByObjectSizeOutput.class)
             .build();

    static final Schema GET_FIND_KEYS_BY_SIBLING_COUNT_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#GetFindKeysBySiblingCountInput"))
             .putMember("bucketType", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("bucket", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("count", PreludeSchemas.INTEGER,
                     new RequiredTrait())
             .putMember("filter", PreludeSchemas.STRING)
             .putMember("timeout", PreludeSchemas.INTEGER)
             .builderSupplier(GetFindKeysBySiblingCountInput::builder)
             .shapeClass(GetFindKeysBySiblingCountInput.class)
             .build();

    static final Schema GET_FIND_KEYS_BY_SIBLING_COUNT_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#StreamOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("link", PreludeSchemas.STRING)
             .putMember("riakHeaders", Schemas.RIAK_HEADERS)
             .putMember("body", Schemas.BYTE_STREAM,
                     new RequiredTrait())
             .builderSupplier(GetFindKeysBySiblingCountOutput::builder)
             .shapeClass(GetFindKeysBySiblingCountOutput.class)
             .build();

    static final Schema GET_FIND_TOMBS_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#GetFindTombsInput"))
             .putMember("bucketType", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("bucket", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("filter", PreludeSchemas.STRING)
             .putMember("timeout", PreludeSchemas.INTEGER)
             .builderSupplier(GetFindTombsInput::builder)
             .shapeClass(GetFindTombsInput.class)
             .build();

    static final Schema GET_FIND_TOMBS_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#StreamOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("link", PreludeSchemas.STRING)
             .putMember("riakHeaders", Schemas.RIAK_HEADERS)
             .putMember("body", Schemas.BYTE_STREAM,
                     new RequiredTrait())
             .builderSupplier(GetFindTombsOutput::builder)
             .shapeClass(GetFindTombsOutput.class)
             .build();

    static final Schema GET_LEGACY_COUNTER_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#CounterReadInput"))
             .putMember("bucket", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("key", PreludeSchemas.STRING,
                     new RequiredTrait())
             .putMember("timeout", PreludeSchemas.INTEGER)
             .putMember("r", Schemas.QUORUM)
             .putMember("pr", Schemas.QUORUM)
             .putMember("basicQuorum", PreludeSchemas.BOOLEAN)
             .putMember("notfoundOk", PreludeSchemas.BOOLEAN)
             .putMember("nodeConfirms", PreludeSchemas.INTEGER)
             .putMember("deletedVClock", PreludeSchemas.BOOLEAN)
             .builderSupplier(GetLegacyCounterInput::builder)
             .shapeClass(GetLegacyCounterInput.class)
             .build();

    static final Schema GET_LEGACY_COUNTER_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#TextOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("body", PreludeSchemas.STRING)
             .builderSupplier(GetLegacyCounterOutput::builder)
             .shapeClass(GetLegacyCounterOutput.class)
             .build();

    static final Schema GET_LEGACY_OBJECT_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#GetDefaultObjectInput"))
             .putMember("bucket", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("key", PreludeSchemas.STRING,
                     new RequiredTrait())
             .putMember("timeout", PreludeSchemas.INTEGER)
             .putMember("r", Schemas.QUORUM)
             .putMember("pr", Schemas.QUORUM)
             .putMember("basicQuorum", PreludeSchemas.BOOLEAN)
             .putMember("notfoundOk", PreludeSchemas.BOOLEAN)
             .putMember("nodeConfirms", PreludeSchemas.INTEGER)
             .putMember("deletedVClock", PreludeSchemas.BOOLEAN)
             .putMember("accept", Schemas.MEDIA_TYPE)
             .putMember("ifNoneMatch", PreludeSchemas.STRING)
             .putMember("ifModifiedSince", Schemas.HTTP_DATE)
             .putMember("vtag", Schemas.V_TAG)
             .builderSupplier(GetLegacyObjectInput::builder)
             .shapeClass(GetLegacyObjectInput.class)
             .build();

    static final Schema GET_LEGACY_OBJECT_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#ObjectOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("contentEncoding", PreludeSchemas.STRING)
             .putMember("etag", PreludeSchemas.STRING)
             .putMember("lastModified", Schemas.HTTP_DATE)
             .putMember("link", PreludeSchemas.STRING)
             .putMember("riakHeaders", Schemas.RIAK_HEADERS)
             .putMember("body", Schemas.BYTE_STREAM,
                     new RequiredTrait())
             .builderSupplier(GetLegacyObjectOutput::builder)
             .shapeClass(GetLegacyObjectOutput.class)
             .build();

    static final Schema GET_MAP_REDUCE_USAGE_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#GetMapReduceUsageInput"),
            new UnitTypeTrait()).builderSupplier(GetMapReduceUsageInput::builder)
             .shapeClass(GetMapReduceUsageInput.class)
             .build();

    static final Schema GET_MAP_REDUCE_USAGE_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#TextOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("body", PreludeSchemas.STRING)
             .builderSupplier(GetMapReduceUsageOutput::builder)
             .shapeClass(GetMapReduceUsageOutput.class)
             .build();

    static final Schema GET_MEMBERSHIP_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#TimeoutInput"))
             .putMember("timeout", PreludeSchemas.INTEGER)
             .builderSupplier(GetMembershipInput::builder)
             .shapeClass(GetMembershipInput.class)
             .build();

    static final Schema GET_MEMBERSHIP_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#JsonOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("body", Schemas.JSON_DOCUMENT)
             .builderSupplier(GetMembershipOutput::builder)
             .shapeClass(GetMembershipOutput.class)
             .build();

    static final Schema GET_MERGE_BRANCH_NVAL_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#GetMergeBranchNvalInput"))
             .putMember("nVal", PreludeSchemas.INTEGER,
                     new RequiredTrait())
             .putMember("filter", PreludeSchemas.STRING)
             .putMember("timeout", PreludeSchemas.INTEGER)
             .builderSupplier(GetMergeBranchNvalInput::builder)
             .shapeClass(GetMergeBranchNvalInput.class)
             .build();

    static final Schema GET_MERGE_BRANCH_NVAL_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#StreamOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("link", PreludeSchemas.STRING)
             .putMember("riakHeaders", Schemas.RIAK_HEADERS)
             .putMember("body", Schemas.BYTE_STREAM,
                     new RequiredTrait())
             .builderSupplier(GetMergeBranchNvalOutput::builder)
             .shapeClass(GetMergeBranchNvalOutput.class)
             .build();

    static final Schema GET_MERGE_ROOT_NVAL_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#GetMergeRootNvalInput"))
             .putMember("nVal", PreludeSchemas.INTEGER,
                     new RequiredTrait())
             .putMember("timeout", PreludeSchemas.INTEGER)
             .builderSupplier(GetMergeRootNvalInput::builder)
             .shapeClass(GetMergeRootNvalInput.class)
             .build();

    static final Schema GET_MERGE_ROOT_NVAL_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#StreamOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("link", PreludeSchemas.STRING)
             .putMember("riakHeaders", Schemas.RIAK_HEADERS)
             .putMember("body", Schemas.BYTE_STREAM,
                     new RequiredTrait())
             .builderSupplier(GetMergeRootNvalOutput::builder)
             .shapeClass(GetMergeRootNvalOutput.class)
             .build();

    static final Schema GET_MERGE_TREE_RANGE_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#GetMergeTreeRangeInput"))
             .putMember("bucketType", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("bucket", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("treeSize", Schemas.NON_EMPTY_STRING,
                     new RequiredTrait())
             .putMember("filter", PreludeSchemas.STRING)
             .putMember("timeout", PreludeSchemas.INTEGER)
             .builderSupplier(GetMergeTreeRangeInput::builder)
             .shapeClass(GetMergeTreeRangeInput.class)
             .build();

    static final Schema GET_MERGE_TREE_RANGE_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#StreamOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("link", PreludeSchemas.STRING)
             .putMember("riakHeaders", Schemas.RIAK_HEADERS)
             .putMember("body", Schemas.BYTE_STREAM,
                     new RequiredTrait())
             .builderSupplier(GetMergeTreeRangeOutput::builder)
             .shapeClass(GetMergeTreeRangeOutput.class)
             .build();

    static final Schema GET_OBJECT_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#GetObjectInput"))
             .putMember("bucketType", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("bucket", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("key", PreludeSchemas.STRING,
                     new RequiredTrait())
             .putMember("timeout", PreludeSchemas.INTEGER)
             .putMember("r", Schemas.QUORUM)
             .putMember("pr", Schemas.QUORUM)
             .putMember("basicQuorum", PreludeSchemas.BOOLEAN)
             .putMember("notfoundOk", PreludeSchemas.BOOLEAN)
             .putMember("nodeConfirms", PreludeSchemas.INTEGER)
             .putMember("deletedVClock", PreludeSchemas.BOOLEAN)
             .putMember("accept", Schemas.MEDIA_TYPE)
             .putMember("ifNoneMatch", PreludeSchemas.STRING)
             .putMember("ifModifiedSince", Schemas.HTTP_DATE)
             .putMember("vtag", Schemas.V_TAG)
             .builderSupplier(GetObjectInput::builder)
             .shapeClass(GetObjectInput.class)
             .build();

    static final Schema GET_OBJECT_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#ObjectOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("contentEncoding", PreludeSchemas.STRING)
             .putMember("etag", PreludeSchemas.STRING)
             .putMember("lastModified", Schemas.HTTP_DATE)
             .putMember("link", PreludeSchemas.STRING)
             .putMember("riakHeaders", Schemas.RIAK_HEADERS)
             .putMember("body", Schemas.BYTE_STREAM,
                     new RequiredTrait())
             .builderSupplier(GetObjectOutput::builder)
             .shapeClass(GetObjectOutput.class)
             .build();

    static final Schema GET_OBJECT_STATS_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#GetObjectStatsInput"))
             .putMember("bucketType", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("bucket", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("filter", PreludeSchemas.STRING)
             .putMember("timeout", PreludeSchemas.INTEGER)
             .builderSupplier(GetObjectStatsInput::builder)
             .shapeClass(GetObjectStatsInput.class)
             .build();

    static final Schema GET_OBJECT_STATS_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#StreamOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("link", PreludeSchemas.STRING)
             .putMember("riakHeaders", Schemas.RIAK_HEADERS)
             .putMember("body", Schemas.BYTE_STREAM,
                     new RequiredTrait())
             .builderSupplier(GetObjectStatsOutput::builder)
             .shapeClass(GetObjectStatsOutput.class)
             .build();

    static final Schema GET_QUEUE_ITEM_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#GetQueueItemInput"))
             .putMember("queueName", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("objectFormat", QueueObjectFormat.$SCHEMA)
             .builderSupplier(GetQueueItemInput::builder)
             .shapeClass(GetQueueItemInput.class)
             .build();

    static final Schema GET_QUEUE_ITEM_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#NegotiatedBodyOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("body", Schemas.BYTE_STREAM,
                     new RequiredTrait())
             .builderSupplier(GetQueueItemOutput::builder)
             .shapeClass(GetQueueItemOutput.class)
             .build();

    static final Schema GET_REAP_TOMBS_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#GetReapTombsInput"))
             .putMember("bucketType", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("bucket", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("filter", PreludeSchemas.STRING)
             .putMember("timeout", PreludeSchemas.INTEGER)
             .builderSupplier(GetReapTombsInput::builder)
             .shapeClass(GetReapTombsInput.class)
             .build();

    static final Schema GET_REAP_TOMBS_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#StreamOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("link", PreludeSchemas.STRING)
             .putMember("riakHeaders", Schemas.RIAK_HEADERS)
             .putMember("body", Schemas.BYTE_STREAM,
                     new RequiredTrait())
             .builderSupplier(GetReapTombsOutput::builder)
             .shapeClass(GetReapTombsOutput.class)
             .build();

    static final Schema GET_REPAIR_KEYS_RANGE_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#GetRepairKeysRangeInput"))
             .putMember("bucketType", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("bucket", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("filter", PreludeSchemas.STRING)
             .putMember("timeout", PreludeSchemas.INTEGER)
             .builderSupplier(GetRepairKeysRangeInput::builder)
             .shapeClass(GetRepairKeysRangeInput.class)
             .build();

    static final Schema GET_REPAIR_KEYS_RANGE_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#StreamOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("link", PreludeSchemas.STRING)
             .putMember("riakHeaders", Schemas.RIAK_HEADERS)
             .putMember("body", Schemas.BYTE_STREAM,
                     new RequiredTrait())
             .builderSupplier(GetRepairKeysRangeOutput::builder)
             .shapeClass(GetRepairKeysRangeOutput.class)
             .build();

    static final Schema GET_REPL_KEYS_RANGE_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#GetReplKeysRangeInput"))
             .putMember("bucketType", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("bucket", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("queueName", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("filter", PreludeSchemas.STRING)
             .putMember("timeout", PreludeSchemas.INTEGER)
             .builderSupplier(GetReplKeysRangeInput::builder)
             .shapeClass(GetReplKeysRangeInput.class)
             .build();

    static final Schema GET_REPL_KEYS_RANGE_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#StreamOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("link", PreludeSchemas.STRING)
             .putMember("riakHeaders", Schemas.RIAK_HEADERS)
             .putMember("body", Schemas.BYTE_STREAM,
                     new RequiredTrait())
             .builderSupplier(GetReplKeysRangeOutput::builder)
             .shapeClass(GetReplKeysRangeOutput.class)
             .build();

    static final Schema GET_ROOT_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#AcceptInput"))
             .putMember("accept", Schemas.MEDIA_TYPE)
             .builderSupplier(GetRootInput::builder)
             .shapeClass(GetRootInput.class)
             .build();

    static final Schema GET_ROOT_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#RootOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("link", PreludeSchemas.STRING)
             .putMember("body", Schemas.BYTE_STREAM,
                     new RequiredTrait())
             .builderSupplier(GetRootOutput::builder)
             .shapeClass(GetRootOutput.class)
             .build();

    static final Schema GET_STATS_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#StatsInput"))
             .putMember("timeout", PreludeSchemas.INTEGER)
             .putMember("accept", Schemas.MEDIA_TYPE)
             .builderSupplier(GetStatsInput::builder)
             .shapeClass(GetStatsInput.class)
             .build();

    static final Schema GET_STATS_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#NegotiatedBodyOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("body", Schemas.BYTE_STREAM,
                     new RequiredTrait())
             .builderSupplier(GetStatsOutput::builder)
             .shapeClass(GetStatsOutput.class)
             .build();

    static final Schema HEAD_DEFAULT_OBJECT_OPERATION_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#HeadDefaultObjectInput"))
             .putMember("bucket", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("key", PreludeSchemas.STRING,
                     new RequiredTrait())
             .putMember("timeout", PreludeSchemas.INTEGER)
             .putMember("r", Schemas.QUORUM)
             .putMember("pr", Schemas.QUORUM)
             .putMember("basicQuorum", PreludeSchemas.BOOLEAN)
             .putMember("notfoundOk", PreludeSchemas.BOOLEAN)
             .putMember("nodeConfirms", PreludeSchemas.INTEGER)
             .putMember("deletedVClock", PreludeSchemas.BOOLEAN)
             .putMember("accept", Schemas.MEDIA_TYPE)
             .putMember("ifNoneMatch", PreludeSchemas.STRING)
             .putMember("ifModifiedSince", Schemas.HTTP_DATE)
             .putMember("vtag", Schemas.V_TAG)
             .builderSupplier(HeadDefaultObjectOperationInput::builder)
             .shapeClass(HeadDefaultObjectOperationInput.class)
             .build();

    static final Schema HEAD_DEFAULT_OBJECT_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#HeadObjectOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("contentEncoding", PreludeSchemas.STRING)
             .putMember("etag", PreludeSchemas.STRING)
             .putMember("lastModified", Schemas.HTTP_DATE)
             .putMember("link", PreludeSchemas.STRING)
             .putMember("riakHeaders", Schemas.RIAK_HEADERS)
             .builderSupplier(HeadDefaultObjectOutput::builder)
             .shapeClass(HeadDefaultObjectOutput.class)
             .build();

    static final Schema HEAD_LEGACY_OBJECT_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#HeadDefaultObjectInput"))
             .putMember("bucket", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("key", PreludeSchemas.STRING,
                     new RequiredTrait())
             .putMember("timeout", PreludeSchemas.INTEGER)
             .putMember("r", Schemas.QUORUM)
             .putMember("pr", Schemas.QUORUM)
             .putMember("basicQuorum", PreludeSchemas.BOOLEAN)
             .putMember("notfoundOk", PreludeSchemas.BOOLEAN)
             .putMember("nodeConfirms", PreludeSchemas.INTEGER)
             .putMember("deletedVClock", PreludeSchemas.BOOLEAN)
             .putMember("accept", Schemas.MEDIA_TYPE)
             .putMember("ifNoneMatch", PreludeSchemas.STRING)
             .putMember("ifModifiedSince", Schemas.HTTP_DATE)
             .putMember("vtag", Schemas.V_TAG)
             .builderSupplier(HeadLegacyObjectInput::builder)
             .shapeClass(HeadLegacyObjectInput.class)
             .build();

    static final Schema HEAD_LEGACY_OBJECT_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#HeadObjectOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("contentEncoding", PreludeSchemas.STRING)
             .putMember("etag", PreludeSchemas.STRING)
             .putMember("lastModified", Schemas.HTTP_DATE)
             .putMember("link", PreludeSchemas.STRING)
             .putMember("riakHeaders", Schemas.RIAK_HEADERS)
             .builderSupplier(HeadLegacyObjectOutput::builder)
             .shapeClass(HeadLegacyObjectOutput.class)
             .build();

    static final Schema HEAD_MAP_REDUCE_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#HeadMapReduceInput"),
            new UnitTypeTrait()).builderSupplier(HeadMapReduceInput::builder)
             .shapeClass(HeadMapReduceInput.class)
             .build();

    static final Schema HEAD_MAP_REDUCE_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#HeaderOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("link", PreludeSchemas.STRING)
             .putMember("riakHeaders", Schemas.RIAK_HEADERS)
             .builderSupplier(HeadMapReduceOutput::builder)
             .shapeClass(HeadMapReduceOutput.class)
             .build();

    static final Schema HEAD_OBJECT_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#HeadObjectInput"))
             .putMember("bucketType", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("bucket", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("key", PreludeSchemas.STRING,
                     new RequiredTrait())
             .putMember("timeout", PreludeSchemas.INTEGER)
             .putMember("r", Schemas.QUORUM)
             .putMember("pr", Schemas.QUORUM)
             .putMember("basicQuorum", PreludeSchemas.BOOLEAN)
             .putMember("notfoundOk", PreludeSchemas.BOOLEAN)
             .putMember("nodeConfirms", PreludeSchemas.INTEGER)
             .putMember("deletedVClock", PreludeSchemas.BOOLEAN)
             .putMember("accept", Schemas.MEDIA_TYPE)
             .putMember("ifNoneMatch", PreludeSchemas.STRING)
             .putMember("ifModifiedSince", Schemas.HTTP_DATE)
             .putMember("vtag", Schemas.V_TAG)
             .builderSupplier(HeadObjectInput::builder)
             .shapeClass(HeadObjectInput.class)
             .build();

    static final Schema HEAD_OBJECT_OPERATION_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#HeadObjectOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("contentEncoding", PreludeSchemas.STRING)
             .putMember("etag", PreludeSchemas.STRING)
             .putMember("lastModified", Schemas.HTTP_DATE)
             .putMember("link", PreludeSchemas.STRING)
             .putMember("riakHeaders", Schemas.RIAK_HEADERS)
             .builderSupplier(HeadObjectOperationOutput::builder)
             .shapeClass(HeadObjectOperationOutput.class)
             .build();

    static final Schema HEAD_STATS_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#StatsInput"))
             .putMember("timeout", PreludeSchemas.INTEGER)
             .putMember("accept", Schemas.MEDIA_TYPE)
             .builderSupplier(HeadStatsInput::builder)
             .shapeClass(HeadStatsInput.class)
             .build();

    static final Schema HEAD_STATS_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#HeaderOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("link", PreludeSchemas.STRING)
             .putMember("riakHeaders", Schemas.RIAK_HEADERS)
             .builderSupplier(HeadStatsOutput::builder)
             .shapeClass(HeadStatsOutput.class)
             .build();

    static final Schema LINK_WALK_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#LinkWalkInput"))
             .putMember("bucketType", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("bucket", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("key", PreludeSchemas.STRING,
                     new RequiredTrait())
             .putMember("walk", PreludeSchemas.STRING,
                     new RequiredTrait())
             .builderSupplier(LinkWalkInput::builder)
             .shapeClass(LinkWalkInput.class)
             .build();

    static final Schema LINK_WALK_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#StreamOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("link", PreludeSchemas.STRING)
             .putMember("riakHeaders", Schemas.RIAK_HEADERS)
             .putMember("body", Schemas.BYTE_STREAM,
                     new RequiredTrait())
             .builderSupplier(LinkWalkOutput::builder)
             .shapeClass(LinkWalkOutput.class)
             .build();

    static final Schema LINK_WALK_DEFAULT_OPERATION_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#LinkWalkDefaultInput"))
             .putMember("bucket", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("key", PreludeSchemas.STRING,
                     new RequiredTrait())
             .putMember("walk", PreludeSchemas.STRING,
                     new RequiredTrait())
             .builderSupplier(LinkWalkDefaultOperationInput::builder)
             .shapeClass(LinkWalkDefaultOperationInput.class)
             .build();

    static final Schema LINK_WALK_DEFAULT_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#StreamOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("link", PreludeSchemas.STRING)
             .putMember("riakHeaders", Schemas.RIAK_HEADERS)
             .putMember("body", Schemas.BYTE_STREAM,
                     new RequiredTrait())
             .builderSupplier(LinkWalkDefaultOutput::builder)
             .shapeClass(LinkWalkDefaultOutput.class)
             .build();

    static final Schema LINK_WALK_LEGACY_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#LinkWalkDefaultInput"))
             .putMember("bucket", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("key", PreludeSchemas.STRING,
                     new RequiredTrait())
             .putMember("walk", PreludeSchemas.STRING,
                     new RequiredTrait())
             .builderSupplier(LinkWalkLegacyInput::builder)
             .shapeClass(LinkWalkLegacyInput.class)
             .build();

    static final Schema LINK_WALK_LEGACY_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#StreamOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("link", PreludeSchemas.STRING)
             .putMember("riakHeaders", Schemas.RIAK_HEADERS)
             .putMember("body", Schemas.BYTE_STREAM,
                     new RequiredTrait())
             .builderSupplier(LinkWalkLegacyOutput::builder)
             .shapeClass(LinkWalkLegacyOutput.class)
             .build();

    static final Schema LIST_AAE_BUCKETS_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#ListAaeBucketsInput"))
             .putMember("nval", PreludeSchemas.INTEGER)
             .putMember("timeout", PreludeSchemas.INTEGER)
             .builderSupplier(ListAaeBucketsInput::builder)
             .shapeClass(ListAaeBucketsInput.class)
             .build();

    static final Schema LIST_AAE_BUCKETS_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#StreamOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("link", PreludeSchemas.STRING)
             .putMember("riakHeaders", Schemas.RIAK_HEADERS)
             .putMember("body", Schemas.BYTE_STREAM,
                     new RequiredTrait())
             .builderSupplier(ListAaeBucketsOutput::builder)
             .shapeClass(ListAaeBucketsOutput.class)
             .build();

    static final Schema LIST_BUCKETS_OPERATION_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#ListBucketsInput"))
             .putMember("bucketType", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("timeout", PreludeSchemas.INTEGER)
             .builderSupplier(ListBucketsOperationInput::builder)
             .shapeClass(ListBucketsOperationInput.class)
             .build();

    static final Schema LIST_BUCKETS_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#JsonOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("body", Schemas.JSON_DOCUMENT)
             .builderSupplier(ListBucketsOutput::builder)
             .shapeClass(ListBucketsOutput.class)
             .build();

    static final Schema LIST_DEFAULT_BUCKETS_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#TimeoutInput"))
             .putMember("timeout", PreludeSchemas.INTEGER)
             .builderSupplier(ListDefaultBucketsInput::builder)
             .shapeClass(ListDefaultBucketsInput.class)
             .build();

    static final Schema LIST_DEFAULT_BUCKETS_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#JsonOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("body", Schemas.JSON_DOCUMENT)
             .builderSupplier(ListDefaultBucketsOutput::builder)
             .shapeClass(ListDefaultBucketsOutput.class)
             .build();

    static final Schema LIST_DEFAULT_KEYS_OPERATION_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#ListDefaultKeysInput"))
             .putMember("bucket", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("timeout", PreludeSchemas.INTEGER)
             .putMember("props", PreludeSchemas.BOOLEAN)
             .builderSupplier(ListDefaultKeysOperationInput::builder)
             .shapeClass(ListDefaultKeysOperationInput.class)
             .build();

    static final Schema LIST_DEFAULT_KEYS_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#JsonOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("body", Schemas.JSON_DOCUMENT)
             .builderSupplier(ListDefaultKeysOutput::builder)
             .shapeClass(ListDefaultKeysOutput.class)
             .build();

    static final Schema LIST_KEYS_OPERATION_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#ListKeysInput"))
             .putMember("bucketType", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("bucket", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("timeout", PreludeSchemas.INTEGER)
             .putMember("props", PreludeSchemas.BOOLEAN)
             .builderSupplier(ListKeysOperationInput::builder)
             .shapeClass(ListKeysOperationInput.class)
             .build();

    static final Schema LIST_KEYS_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#JsonOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("body", Schemas.JSON_DOCUMENT)
             .builderSupplier(ListKeysOutput::builder)
             .shapeClass(ListKeysOutput.class)
             .build();

    static final Schema MAP_REDUCE_JOB = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#MapReduceJob"))
             .putMember("inputs", PreludeSchemas.DOCUMENT,
                     new RequiredTrait())
             .putMember("query", PreludeSchemas.DOCUMENT,
                     new RequiredTrait())
             .builderSupplier(MapReduceJob::builder)
             .shapeClass(MapReduceJob.class)
             .build();

    static final Schema MAP_REDUCE_OPERATION_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#MapReduceInput"))
             .putMember("contentType", Schemas.MEDIA_TYPE,
                     new RequiredTrait())
             .putMember("accept", Schemas.MEDIA_TYPE)
             .putMember("request", Schemas.MAP_REDUCE_JOB,
                     new RequiredTrait())
             .builderSupplier(MapReduceOperationInput::builder)
             .shapeClass(MapReduceOperationInput.class)
             .build();

    static final Schema MAP_REDUCE_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#JsonOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("body", Schemas.JSON_DOCUMENT)
             .builderSupplier(MapReduceOutput::builder)
             .shapeClass(MapReduceOutput.class)
             .build();

    static final Schema MAP_REDUCE_CHUNKED_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#MapReduceInput"))
             .putMember("contentType", Schemas.MEDIA_TYPE,
                     new RequiredTrait())
             .putMember("accept", Schemas.MEDIA_TYPE)
             .putMember("request", Schemas.MAP_REDUCE_JOB,
                     new RequiredTrait())
             .builderSupplier(MapReduceChunkedInput::builder)
             .shapeClass(MapReduceChunkedInput.class)
             .build();

    static final Schema MAP_REDUCE_CHUNKED_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#StreamOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("link", PreludeSchemas.STRING)
             .putMember("riakHeaders", Schemas.RIAK_HEADERS)
             .putMember("body", Schemas.BYTE_STREAM,
                     new RequiredTrait())
             .builderSupplier(MapReduceChunkedOutput::builder)
             .shapeClass(MapReduceChunkedOutput.class)
             .build();

    static final Schema PING_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#PingInput"),
            new UnitTypeTrait()).builderSupplier(PingInput::builder)
             .shapeClass(PingInput.class)
             .build();

    static final Schema PING_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#TextOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("body", PreludeSchemas.STRING)
             .builderSupplier(PingOutput::builder)
             .shapeClass(PingOutput.class)
             .build();

    static final Schema POST_DEFAULT_OBJECT_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#PutDefaultObjectInput"))
             .putMember("bucket", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("key", PreludeSchemas.STRING,
                     new RequiredTrait())
             .putMember("timeout", PreludeSchemas.INTEGER)
             .putMember("w", Schemas.QUORUM)
             .putMember("dw", Schemas.QUORUM)
             .putMember("pw", Schemas.QUORUM)
             .putMember("nodeConfirms", PreludeSchemas.INTEGER)
             .putMember("syncOnWrite", SyncOnWrite.$SCHEMA)
             .putMember("asis", PreludeSchemas.BOOLEAN)
             .putMember("ifNoneMatch", PreludeSchemas.STRING)
             .putMember("ifMatch", PreludeSchemas.STRING)
             .putMember("ifUnmodifiedSince", Schemas.HTTP_DATE)
             .putMember("contentType", Schemas.MEDIA_TYPE,
                     new RequiredTrait())
             .putMember("contentEncoding", PreludeSchemas.STRING)
             .putMember("link", PreludeSchemas.STRING)
             .putMember("riakHeaders", Schemas.RIAK_HEADERS)
             .putMember("body", Schemas.BYTE_STREAM,
                     new RequiredTrait())
             .builderSupplier(PostDefaultObjectInput::builder)
             .shapeClass(PostDefaultObjectInput.class)
             .build();

    static final Schema POST_DEFAULT_OBJECT_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#EmptyOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .builderSupplier(PostDefaultObjectOutput::builder)
             .shapeClass(PostDefaultObjectOutput.class)
             .build();

    static final Schema POST_DEFAULT_OBJECT_RETURN_BODY_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#PutDefaultObjectInput"))
             .putMember("bucket", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("key", PreludeSchemas.STRING,
                     new RequiredTrait())
             .putMember("timeout", PreludeSchemas.INTEGER)
             .putMember("w", Schemas.QUORUM)
             .putMember("dw", Schemas.QUORUM)
             .putMember("pw", Schemas.QUORUM)
             .putMember("nodeConfirms", PreludeSchemas.INTEGER)
             .putMember("syncOnWrite", SyncOnWrite.$SCHEMA)
             .putMember("asis", PreludeSchemas.BOOLEAN)
             .putMember("ifNoneMatch", PreludeSchemas.STRING)
             .putMember("ifMatch", PreludeSchemas.STRING)
             .putMember("ifUnmodifiedSince", Schemas.HTTP_DATE)
             .putMember("contentType", Schemas.MEDIA_TYPE,
                     new RequiredTrait())
             .putMember("contentEncoding", PreludeSchemas.STRING)
             .putMember("link", PreludeSchemas.STRING)
             .putMember("riakHeaders", Schemas.RIAK_HEADERS)
             .putMember("body", Schemas.BYTE_STREAM,
                     new RequiredTrait())
             .builderSupplier(PostDefaultObjectReturnBodyInput::builder)
             .shapeClass(PostDefaultObjectReturnBodyInput.class)
             .build();

    static final Schema POST_DEFAULT_OBJECT_RETURN_BODY_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#ObjectOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("contentEncoding", PreludeSchemas.STRING)
             .putMember("etag", PreludeSchemas.STRING)
             .putMember("lastModified", Schemas.HTTP_DATE)
             .putMember("link", PreludeSchemas.STRING)
             .putMember("riakHeaders", Schemas.RIAK_HEADERS)
             .putMember("body", Schemas.BYTE_STREAM,
                     new RequiredTrait())
             .builderSupplier(PostDefaultObjectReturnBodyOutput::builder)
             .shapeClass(PostDefaultObjectReturnBodyOutput.class)
             .build();

    static final Schema POST_LEGACY_OBJECT_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#PutDefaultObjectInput"))
             .putMember("bucket", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("key", PreludeSchemas.STRING,
                     new RequiredTrait())
             .putMember("timeout", PreludeSchemas.INTEGER)
             .putMember("w", Schemas.QUORUM)
             .putMember("dw", Schemas.QUORUM)
             .putMember("pw", Schemas.QUORUM)
             .putMember("nodeConfirms", PreludeSchemas.INTEGER)
             .putMember("syncOnWrite", SyncOnWrite.$SCHEMA)
             .putMember("asis", PreludeSchemas.BOOLEAN)
             .putMember("ifNoneMatch", PreludeSchemas.STRING)
             .putMember("ifMatch", PreludeSchemas.STRING)
             .putMember("ifUnmodifiedSince", Schemas.HTTP_DATE)
             .putMember("contentType", Schemas.MEDIA_TYPE,
                     new RequiredTrait())
             .putMember("contentEncoding", PreludeSchemas.STRING)
             .putMember("link", PreludeSchemas.STRING)
             .putMember("riakHeaders", Schemas.RIAK_HEADERS)
             .putMember("body", Schemas.BYTE_STREAM,
                     new RequiredTrait())
             .builderSupplier(PostLegacyObjectInput::builder)
             .shapeClass(PostLegacyObjectInput.class)
             .build();

    static final Schema POST_LEGACY_OBJECT_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#EmptyOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .builderSupplier(PostLegacyObjectOutput::builder)
             .shapeClass(PostLegacyObjectOutput.class)
             .build();

    static final Schema POST_LEGACY_OBJECT_RETURN_BODY_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#PutDefaultObjectInput"))
             .putMember("bucket", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("key", PreludeSchemas.STRING,
                     new RequiredTrait())
             .putMember("timeout", PreludeSchemas.INTEGER)
             .putMember("w", Schemas.QUORUM)
             .putMember("dw", Schemas.QUORUM)
             .putMember("pw", Schemas.QUORUM)
             .putMember("nodeConfirms", PreludeSchemas.INTEGER)
             .putMember("syncOnWrite", SyncOnWrite.$SCHEMA)
             .putMember("asis", PreludeSchemas.BOOLEAN)
             .putMember("ifNoneMatch", PreludeSchemas.STRING)
             .putMember("ifMatch", PreludeSchemas.STRING)
             .putMember("ifUnmodifiedSince", Schemas.HTTP_DATE)
             .putMember("contentType", Schemas.MEDIA_TYPE,
                     new RequiredTrait())
             .putMember("contentEncoding", PreludeSchemas.STRING)
             .putMember("link", PreludeSchemas.STRING)
             .putMember("riakHeaders", Schemas.RIAK_HEADERS)
             .putMember("body", Schemas.BYTE_STREAM,
                     new RequiredTrait())
             .builderSupplier(PostLegacyObjectReturnBodyInput::builder)
             .shapeClass(PostLegacyObjectReturnBodyInput.class)
             .build();

    static final Schema POST_LEGACY_OBJECT_RETURN_BODY_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#ObjectOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("contentEncoding", PreludeSchemas.STRING)
             .putMember("etag", PreludeSchemas.STRING)
             .putMember("lastModified", Schemas.HTTP_DATE)
             .putMember("link", PreludeSchemas.STRING)
             .putMember("riakHeaders", Schemas.RIAK_HEADERS)
             .putMember("body", Schemas.BYTE_STREAM,
                     new RequiredTrait())
             .builderSupplier(PostLegacyObjectReturnBodyOutput::builder)
             .shapeClass(PostLegacyObjectReturnBodyOutput.class)
             .build();

    static final Schema POST_OBJECT_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#PutObjectInput"))
             .putMember("bucketType", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("bucket", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("key", PreludeSchemas.STRING,
                     new RequiredTrait())
             .putMember("timeout", PreludeSchemas.INTEGER)
             .putMember("w", Schemas.QUORUM)
             .putMember("dw", Schemas.QUORUM)
             .putMember("pw", Schemas.QUORUM)
             .putMember("nodeConfirms", PreludeSchemas.INTEGER)
             .putMember("syncOnWrite", SyncOnWrite.$SCHEMA)
             .putMember("asis", PreludeSchemas.BOOLEAN)
             .putMember("ifNoneMatch", PreludeSchemas.STRING)
             .putMember("ifMatch", PreludeSchemas.STRING)
             .putMember("ifUnmodifiedSince", Schemas.HTTP_DATE)
             .putMember("contentType", Schemas.MEDIA_TYPE,
                     new RequiredTrait())
             .putMember("contentEncoding", PreludeSchemas.STRING)
             .putMember("link", PreludeSchemas.STRING)
             .putMember("riakHeaders", Schemas.RIAK_HEADERS)
             .putMember("body", Schemas.BYTE_STREAM,
                     new RequiredTrait())
             .builderSupplier(PostObjectInput::builder)
             .shapeClass(PostObjectInput.class)
             .build();

    static final Schema POST_OBJECT_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#EmptyOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .builderSupplier(PostObjectOutput::builder)
             .shapeClass(PostObjectOutput.class)
             .build();

    static final Schema POST_OBJECT_RETURN_BODY_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#PutObjectInput"))
             .putMember("bucketType", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("bucket", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("key", PreludeSchemas.STRING,
                     new RequiredTrait())
             .putMember("timeout", PreludeSchemas.INTEGER)
             .putMember("w", Schemas.QUORUM)
             .putMember("dw", Schemas.QUORUM)
             .putMember("pw", Schemas.QUORUM)
             .putMember("nodeConfirms", PreludeSchemas.INTEGER)
             .putMember("syncOnWrite", SyncOnWrite.$SCHEMA)
             .putMember("asis", PreludeSchemas.BOOLEAN)
             .putMember("ifNoneMatch", PreludeSchemas.STRING)
             .putMember("ifMatch", PreludeSchemas.STRING)
             .putMember("ifUnmodifiedSince", Schemas.HTTP_DATE)
             .putMember("contentType", Schemas.MEDIA_TYPE,
                     new RequiredTrait())
             .putMember("contentEncoding", PreludeSchemas.STRING)
             .putMember("link", PreludeSchemas.STRING)
             .putMember("riakHeaders", Schemas.RIAK_HEADERS)
             .putMember("body", Schemas.BYTE_STREAM,
                     new RequiredTrait())
             .builderSupplier(PostObjectReturnBodyInput::builder)
             .shapeClass(PostObjectReturnBodyInput.class)
             .build();

    static final Schema POST_OBJECT_RETURN_BODY_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#ObjectOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("contentEncoding", PreludeSchemas.STRING)
             .putMember("etag", PreludeSchemas.STRING)
             .putMember("lastModified", Schemas.HTTP_DATE)
             .putMember("link", PreludeSchemas.STRING)
             .putMember("riakHeaders", Schemas.RIAK_HEADERS)
             .putMember("body", Schemas.BYTE_STREAM,
                     new RequiredTrait())
             .builderSupplier(PostObjectReturnBodyOutput::builder)
             .shapeClass(PostObjectReturnBodyOutput.class)
             .build();

    static final Schema PUSH_QUEUE_ITEMS_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#PushQueueItemsInput"))
             .putMember("queueName", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("contentType", Schemas.MEDIA_TYPE,
                     new RequiredTrait())
             .putMember("keysClocks", Schemas.JSON_DOCUMENT,
                     new RequiredTrait())
             .builderSupplier(PushQueueItemsInput::builder)
             .shapeClass(PushQueueItemsInput.class)
             .build();

    static final Schema PUSH_QUEUE_ITEMS_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#TextOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("body", PreludeSchemas.STRING)
             .builderSupplier(PushQueueItemsOutput::builder)
             .shapeClass(PushQueueItemsOutput.class)
             .build();

    static final Schema PUT_DEFAULT_OBJECT_OPERATION_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#PutDefaultObjectInput"))
             .putMember("bucket", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("key", PreludeSchemas.STRING,
                     new RequiredTrait())
             .putMember("timeout", PreludeSchemas.INTEGER)
             .putMember("w", Schemas.QUORUM)
             .putMember("dw", Schemas.QUORUM)
             .putMember("pw", Schemas.QUORUM)
             .putMember("nodeConfirms", PreludeSchemas.INTEGER)
             .putMember("syncOnWrite", SyncOnWrite.$SCHEMA)
             .putMember("asis", PreludeSchemas.BOOLEAN)
             .putMember("ifNoneMatch", PreludeSchemas.STRING)
             .putMember("ifMatch", PreludeSchemas.STRING)
             .putMember("ifUnmodifiedSince", Schemas.HTTP_DATE)
             .putMember("contentType", Schemas.MEDIA_TYPE,
                     new RequiredTrait())
             .putMember("contentEncoding", PreludeSchemas.STRING)
             .putMember("link", PreludeSchemas.STRING)
             .putMember("riakHeaders", Schemas.RIAK_HEADERS)
             .putMember("body", Schemas.BYTE_STREAM,
                     new RequiredTrait())
             .builderSupplier(PutDefaultObjectOperationInput::builder)
             .shapeClass(PutDefaultObjectOperationInput.class)
             .build();

    static final Schema PUT_DEFAULT_OBJECT_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#EmptyOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .builderSupplier(PutDefaultObjectOutput::builder)
             .shapeClass(PutDefaultObjectOutput.class)
             .build();

    static final Schema PUT_DEFAULT_OBJECT_RETURN_BODY_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#PutDefaultObjectInput"))
             .putMember("bucket", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("key", PreludeSchemas.STRING,
                     new RequiredTrait())
             .putMember("timeout", PreludeSchemas.INTEGER)
             .putMember("w", Schemas.QUORUM)
             .putMember("dw", Schemas.QUORUM)
             .putMember("pw", Schemas.QUORUM)
             .putMember("nodeConfirms", PreludeSchemas.INTEGER)
             .putMember("syncOnWrite", SyncOnWrite.$SCHEMA)
             .putMember("asis", PreludeSchemas.BOOLEAN)
             .putMember("ifNoneMatch", PreludeSchemas.STRING)
             .putMember("ifMatch", PreludeSchemas.STRING)
             .putMember("ifUnmodifiedSince", Schemas.HTTP_DATE)
             .putMember("contentType", Schemas.MEDIA_TYPE,
                     new RequiredTrait())
             .putMember("contentEncoding", PreludeSchemas.STRING)
             .putMember("link", PreludeSchemas.STRING)
             .putMember("riakHeaders", Schemas.RIAK_HEADERS)
             .putMember("body", Schemas.BYTE_STREAM,
                     new RequiredTrait())
             .builderSupplier(PutDefaultObjectReturnBodyInput::builder)
             .shapeClass(PutDefaultObjectReturnBodyInput.class)
             .build();

    static final Schema PUT_DEFAULT_OBJECT_RETURN_BODY_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#ObjectOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("contentEncoding", PreludeSchemas.STRING)
             .putMember("etag", PreludeSchemas.STRING)
             .putMember("lastModified", Schemas.HTTP_DATE)
             .putMember("link", PreludeSchemas.STRING)
             .putMember("riakHeaders", Schemas.RIAK_HEADERS)
             .putMember("body", Schemas.BYTE_STREAM,
                     new RequiredTrait())
             .builderSupplier(PutDefaultObjectReturnBodyOutput::builder)
             .shapeClass(PutDefaultObjectReturnBodyOutput.class)
             .build();

    static final Schema PUT_LEGACY_OBJECT_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#PutDefaultObjectInput"))
             .putMember("bucket", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("key", PreludeSchemas.STRING,
                     new RequiredTrait())
             .putMember("timeout", PreludeSchemas.INTEGER)
             .putMember("w", Schemas.QUORUM)
             .putMember("dw", Schemas.QUORUM)
             .putMember("pw", Schemas.QUORUM)
             .putMember("nodeConfirms", PreludeSchemas.INTEGER)
             .putMember("syncOnWrite", SyncOnWrite.$SCHEMA)
             .putMember("asis", PreludeSchemas.BOOLEAN)
             .putMember("ifNoneMatch", PreludeSchemas.STRING)
             .putMember("ifMatch", PreludeSchemas.STRING)
             .putMember("ifUnmodifiedSince", Schemas.HTTP_DATE)
             .putMember("contentType", Schemas.MEDIA_TYPE,
                     new RequiredTrait())
             .putMember("contentEncoding", PreludeSchemas.STRING)
             .putMember("link", PreludeSchemas.STRING)
             .putMember("riakHeaders", Schemas.RIAK_HEADERS)
             .putMember("body", Schemas.BYTE_STREAM,
                     new RequiredTrait())
             .builderSupplier(PutLegacyObjectInput::builder)
             .shapeClass(PutLegacyObjectInput.class)
             .build();

    static final Schema PUT_LEGACY_OBJECT_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#EmptyOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .builderSupplier(PutLegacyObjectOutput::builder)
             .shapeClass(PutLegacyObjectOutput.class)
             .build();

    static final Schema PUT_LEGACY_OBJECT_RETURN_BODY_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#PutDefaultObjectInput"))
             .putMember("bucket", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("key", PreludeSchemas.STRING,
                     new RequiredTrait())
             .putMember("timeout", PreludeSchemas.INTEGER)
             .putMember("w", Schemas.QUORUM)
             .putMember("dw", Schemas.QUORUM)
             .putMember("pw", Schemas.QUORUM)
             .putMember("nodeConfirms", PreludeSchemas.INTEGER)
             .putMember("syncOnWrite", SyncOnWrite.$SCHEMA)
             .putMember("asis", PreludeSchemas.BOOLEAN)
             .putMember("ifNoneMatch", PreludeSchemas.STRING)
             .putMember("ifMatch", PreludeSchemas.STRING)
             .putMember("ifUnmodifiedSince", Schemas.HTTP_DATE)
             .putMember("contentType", Schemas.MEDIA_TYPE,
                     new RequiredTrait())
             .putMember("contentEncoding", PreludeSchemas.STRING)
             .putMember("link", PreludeSchemas.STRING)
             .putMember("riakHeaders", Schemas.RIAK_HEADERS)
             .putMember("body", Schemas.BYTE_STREAM,
                     new RequiredTrait())
             .builderSupplier(PutLegacyObjectReturnBodyInput::builder)
             .shapeClass(PutLegacyObjectReturnBodyInput.class)
             .build();

    static final Schema PUT_LEGACY_OBJECT_RETURN_BODY_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#ObjectOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("contentEncoding", PreludeSchemas.STRING)
             .putMember("etag", PreludeSchemas.STRING)
             .putMember("lastModified", Schemas.HTTP_DATE)
             .putMember("link", PreludeSchemas.STRING)
             .putMember("riakHeaders", Schemas.RIAK_HEADERS)
             .putMember("body", Schemas.BYTE_STREAM,
                     new RequiredTrait())
             .builderSupplier(PutLegacyObjectReturnBodyOutput::builder)
             .shapeClass(PutLegacyObjectReturnBodyOutput.class)
             .build();

    static final Schema PUT_OBJECT_OPERATION_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#PutObjectInput"))
             .putMember("bucketType", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("bucket", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("key", PreludeSchemas.STRING,
                     new RequiredTrait())
             .putMember("timeout", PreludeSchemas.INTEGER)
             .putMember("w", Schemas.QUORUM)
             .putMember("dw", Schemas.QUORUM)
             .putMember("pw", Schemas.QUORUM)
             .putMember("nodeConfirms", PreludeSchemas.INTEGER)
             .putMember("syncOnWrite", SyncOnWrite.$SCHEMA)
             .putMember("asis", PreludeSchemas.BOOLEAN)
             .putMember("ifNoneMatch", PreludeSchemas.STRING)
             .putMember("ifMatch", PreludeSchemas.STRING)
             .putMember("ifUnmodifiedSince", Schemas.HTTP_DATE)
             .putMember("contentType", Schemas.MEDIA_TYPE,
                     new RequiredTrait())
             .putMember("contentEncoding", PreludeSchemas.STRING)
             .putMember("link", PreludeSchemas.STRING)
             .putMember("riakHeaders", Schemas.RIAK_HEADERS)
             .putMember("body", Schemas.BYTE_STREAM,
                     new RequiredTrait())
             .builderSupplier(PutObjectOperationInput::builder)
             .shapeClass(PutObjectOperationInput.class)
             .build();

    static final Schema PUT_OBJECT_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#EmptyOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .builderSupplier(PutObjectOutput::builder)
             .shapeClass(PutObjectOutput.class)
             .build();

    static final Schema PUT_OBJECT_RETURN_BODY_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#PutObjectInput"))
             .putMember("bucketType", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("bucket", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("key", PreludeSchemas.STRING,
                     new RequiredTrait())
             .putMember("timeout", PreludeSchemas.INTEGER)
             .putMember("w", Schemas.QUORUM)
             .putMember("dw", Schemas.QUORUM)
             .putMember("pw", Schemas.QUORUM)
             .putMember("nodeConfirms", PreludeSchemas.INTEGER)
             .putMember("syncOnWrite", SyncOnWrite.$SCHEMA)
             .putMember("asis", PreludeSchemas.BOOLEAN)
             .putMember("ifNoneMatch", PreludeSchemas.STRING)
             .putMember("ifMatch", PreludeSchemas.STRING)
             .putMember("ifUnmodifiedSince", Schemas.HTTP_DATE)
             .putMember("contentType", Schemas.MEDIA_TYPE,
                     new RequiredTrait())
             .putMember("contentEncoding", PreludeSchemas.STRING)
             .putMember("link", PreludeSchemas.STRING)
             .putMember("riakHeaders", Schemas.RIAK_HEADERS)
             .putMember("body", Schemas.BYTE_STREAM,
                     new RequiredTrait())
             .builderSupplier(PutObjectReturnBodyInput::builder)
             .shapeClass(PutObjectReturnBodyInput.class)
             .build();

    static final Schema PUT_OBJECT_RETURN_BODY_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#ObjectOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("contentEncoding", PreludeSchemas.STRING)
             .putMember("etag", PreludeSchemas.STRING)
             .putMember("lastModified", Schemas.HTTP_DATE)
             .putMember("link", PreludeSchemas.STRING)
             .putMember("riakHeaders", Schemas.RIAK_HEADERS)
             .putMember("body", Schemas.BYTE_STREAM,
                     new RequiredTrait())
             .builderSupplier(PutObjectReturnBodyOutput::builder)
             .shapeClass(PutObjectReturnBodyOutput.class)
             .build();

    static final Schema QUERY_DEFAULT_SECONDARY_INDEX_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#DefaultSecondaryIndexInput"))
             .putMember("bucket", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("timeout", PreludeSchemas.INTEGER)
             .putMember("maxResults", PreludeSchemas.INTEGER)
             .putMember("continuation", PreludeSchemas.STRING)
             .putMember("returnTerms", PreludeSchemas.BOOLEAN)
             .putMember("paginationSort", PreludeSchemas.BOOLEAN)
             .putMember("termRegex", PreludeSchemas.STRING)
             .putMember("field", Schemas.NON_EMPTY_STRING,
                     new RequiredTrait())
             .putMember("value", PreludeSchemas.STRING,
                     new RequiredTrait())
             .builderSupplier(QueryDefaultSecondaryIndexInput::builder)
             .shapeClass(QueryDefaultSecondaryIndexInput.class)
             .build();

    static final Schema QUERY_DEFAULT_SECONDARY_INDEX_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#JsonOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("body", Schemas.JSON_DOCUMENT)
             .builderSupplier(QueryDefaultSecondaryIndexOutput::builder)
             .shapeClass(QueryDefaultSecondaryIndexOutput.class)
             .build();

    static final Schema QUERY_DEFAULT_SECONDARY_INDEX_RANGE_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#DefaultSecondaryIndexRangeInput"))
             .putMember("bucket", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("timeout", PreludeSchemas.INTEGER)
             .putMember("maxResults", PreludeSchemas.INTEGER)
             .putMember("continuation", PreludeSchemas.STRING)
             .putMember("returnTerms", PreludeSchemas.BOOLEAN)
             .putMember("paginationSort", PreludeSchemas.BOOLEAN)
             .putMember("termRegex", PreludeSchemas.STRING)
             .putMember("field", Schemas.NON_EMPTY_STRING,
                     new RequiredTrait())
             .putMember("start", PreludeSchemas.STRING,
                     new RequiredTrait())
             .putMember("end", PreludeSchemas.STRING,
                     new RequiredTrait())
             .builderSupplier(QueryDefaultSecondaryIndexRangeInput::builder)
             .shapeClass(QueryDefaultSecondaryIndexRangeInput.class)
             .build();

    static final Schema QUERY_DEFAULT_SECONDARY_INDEX_RANGE_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#JsonOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("body", Schemas.JSON_DOCUMENT)
             .builderSupplier(QueryDefaultSecondaryIndexRangeOutput::builder)
             .shapeClass(QueryDefaultSecondaryIndexRangeOutput.class)
             .build();

    static final Schema QUERY_SECONDARY_INDEX_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#SecondaryIndexInput"))
             .putMember("bucketType", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("bucket", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("timeout", PreludeSchemas.INTEGER)
             .putMember("maxResults", PreludeSchemas.INTEGER)
             .putMember("continuation", PreludeSchemas.STRING)
             .putMember("returnTerms", PreludeSchemas.BOOLEAN)
             .putMember("paginationSort", PreludeSchemas.BOOLEAN)
             .putMember("termRegex", PreludeSchemas.STRING)
             .putMember("field", Schemas.NON_EMPTY_STRING,
                     new RequiredTrait())
             .putMember("value", PreludeSchemas.STRING,
                     new RequiredTrait())
             .builderSupplier(QuerySecondaryIndexInput::builder)
             .shapeClass(QuerySecondaryIndexInput.class)
             .build();

    static final Schema QUERY_SECONDARY_INDEX_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#JsonOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("body", Schemas.JSON_DOCUMENT)
             .builderSupplier(QuerySecondaryIndexOutput::builder)
             .shapeClass(QuerySecondaryIndexOutput.class)
             .build();

    static final Schema QUERY_SECONDARY_INDEX_RANGE_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#SecondaryIndexRangeInput"))
             .putMember("bucketType", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("bucket", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("timeout", PreludeSchemas.INTEGER)
             .putMember("maxResults", PreludeSchemas.INTEGER)
             .putMember("continuation", PreludeSchemas.STRING)
             .putMember("returnTerms", PreludeSchemas.BOOLEAN)
             .putMember("paginationSort", PreludeSchemas.BOOLEAN)
             .putMember("termRegex", PreludeSchemas.STRING)
             .putMember("field", Schemas.NON_EMPTY_STRING,
                     new RequiredTrait())
             .putMember("start", PreludeSchemas.STRING,
                     new RequiredTrait())
             .putMember("end", PreludeSchemas.STRING,
                     new RequiredTrait())
             .builderSupplier(QuerySecondaryIndexRangeInput::builder)
             .shapeClass(QuerySecondaryIndexRangeInput.class)
             .build();

    static final Schema QUERY_SECONDARY_INDEX_RANGE_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#JsonOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("body", Schemas.JSON_DOCUMENT)
             .builderSupplier(QuerySecondaryIndexRangeOutput::builder)
             .shapeClass(QuerySecondaryIndexRangeOutput.class)
             .build();

    static final Schema RESET_BUCKET_PROPERTIES_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#BucketInput"))
             .putMember("bucketType", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("bucket", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("timeout", PreludeSchemas.INTEGER)
             .builderSupplier(ResetBucketPropertiesInput::builder)
             .shapeClass(ResetBucketPropertiesInput.class)
             .build();

    static final Schema RESET_BUCKET_PROPERTIES_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#EmptyOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .builderSupplier(ResetBucketPropertiesOutput::builder)
             .shapeClass(ResetBucketPropertiesOutput.class)
             .build();

    static final Schema RESET_DEFAULT_BUCKET_PROPERTIES_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#DefaultBucketInput"))
             .putMember("bucket", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("timeout", PreludeSchemas.INTEGER)
             .builderSupplier(ResetDefaultBucketPropertiesInput::builder)
             .shapeClass(ResetDefaultBucketPropertiesInput.class)
             .build();

    static final Schema RESET_DEFAULT_BUCKET_PROPERTIES_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#EmptyOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .builderSupplier(ResetDefaultBucketPropertiesOutput::builder)
             .shapeClass(ResetDefaultBucketPropertiesOutput.class)
             .build();

    static final Schema RUN_BUCKET_QUERY_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#BucketQueryInput"))
             .putMember("bucketType", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("bucket", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("contentType", Schemas.MEDIA_TYPE,
                     new RequiredTrait())
             .putMember("query", Schemas.BUCKET_QUERY_REQUEST,
                     new RequiredTrait())
             .builderSupplier(RunBucketQueryInput::builder)
             .shapeClass(RunBucketQueryInput.class)
             .build();

    static final Schema RUN_BUCKET_QUERY_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#JsonOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("body", Schemas.JSON_DOCUMENT)
             .builderSupplier(RunBucketQueryOutput::builder)
             .shapeClass(RunBucketQueryOutput.class)
             .build();

    static final Schema RUN_DEFAULT_BUCKET_QUERY_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#DefaultBucketQueryInput"))
             .putMember("bucket", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("contentType", Schemas.MEDIA_TYPE,
                     new RequiredTrait())
             .putMember("query", Schemas.BUCKET_QUERY_REQUEST,
                     new RequiredTrait())
             .builderSupplier(RunDefaultBucketQueryInput::builder)
             .shapeClass(RunDefaultBucketQueryInput.class)
             .build();

    static final Schema RUN_DEFAULT_BUCKET_QUERY_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#JsonOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("body", Schemas.JSON_DOCUMENT)
             .builderSupplier(RunDefaultBucketQueryOutput::builder)
             .shapeClass(RunDefaultBucketQueryOutput.class)
             .build();

    static final Schema SET_BUCKET_PROPERTIES_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#BucketPropertiesInput"))
             .putMember("bucketType", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("bucket", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("contentType", Schemas.MEDIA_TYPE,
                     new RequiredTrait())
             .putMember("props", Schemas.JSON_DOCUMENT,
                     new RequiredTrait())
             .builderSupplier(SetBucketPropertiesInput::builder)
             .shapeClass(SetBucketPropertiesInput.class)
             .build();

    static final Schema SET_BUCKET_PROPERTIES_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#EmptyOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .builderSupplier(SetBucketPropertiesOutput::builder)
             .shapeClass(SetBucketPropertiesOutput.class)
             .build();

    static final Schema SET_BUCKET_TYPE_PROPERTIES_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#BucketTypePropertiesInput"))
             .putMember("bucketType", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("contentType", Schemas.MEDIA_TYPE,
                     new RequiredTrait())
             .putMember("props", Schemas.JSON_DOCUMENT,
                     new RequiredTrait())
             .builderSupplier(SetBucketTypePropertiesInput::builder)
             .shapeClass(SetBucketTypePropertiesInput.class)
             .build();

    static final Schema SET_BUCKET_TYPE_PROPERTIES_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#EmptyOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .builderSupplier(SetBucketTypePropertiesOutput::builder)
             .shapeClass(SetBucketTypePropertiesOutput.class)
             .build();

    static final Schema SET_DEFAULT_BUCKET_PROPERTIES_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#DefaultBucketPropertiesInput"))
             .putMember("bucket", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("contentType", Schemas.MEDIA_TYPE,
                     new RequiredTrait())
             .putMember("props", Schemas.JSON_DOCUMENT,
                     new RequiredTrait())
             .builderSupplier(SetDefaultBucketPropertiesInput::builder)
             .shapeClass(SetDefaultBucketPropertiesInput.class)
             .build();

    static final Schema SET_DEFAULT_BUCKET_PROPERTIES_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#EmptyOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .builderSupplier(SetDefaultBucketPropertiesOutput::builder)
             .shapeClass(SetDefaultBucketPropertiesOutput.class)
             .build();

    static final Schema STREAM_BUCKETS_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#ListBucketsInput"))
             .putMember("bucketType", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("timeout", PreludeSchemas.INTEGER)
             .builderSupplier(StreamBucketsInput::builder)
             .shapeClass(StreamBucketsInput.class)
             .build();

    static final Schema STREAM_BUCKETS_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#StreamOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("link", PreludeSchemas.STRING)
             .putMember("riakHeaders", Schemas.RIAK_HEADERS)
             .putMember("body", Schemas.BYTE_STREAM,
                     new RequiredTrait())
             .builderSupplier(StreamBucketsOutput::builder)
             .shapeClass(StreamBucketsOutput.class)
             .build();

    static final Schema STREAM_DEFAULT_BUCKETS_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#TimeoutInput"))
             .putMember("timeout", PreludeSchemas.INTEGER)
             .builderSupplier(StreamDefaultBucketsInput::builder)
             .shapeClass(StreamDefaultBucketsInput.class)
             .build();

    static final Schema STREAM_DEFAULT_BUCKETS_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#StreamOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("link", PreludeSchemas.STRING)
             .putMember("riakHeaders", Schemas.RIAK_HEADERS)
             .putMember("body", Schemas.BYTE_STREAM,
                     new RequiredTrait())
             .builderSupplier(StreamDefaultBucketsOutput::builder)
             .shapeClass(StreamDefaultBucketsOutput.class)
             .build();

    static final Schema STREAM_DEFAULT_KEYS_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#ListDefaultKeysInput"))
             .putMember("bucket", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("timeout", PreludeSchemas.INTEGER)
             .putMember("props", PreludeSchemas.BOOLEAN)
             .builderSupplier(StreamDefaultKeysInput::builder)
             .shapeClass(StreamDefaultKeysInput.class)
             .build();

    static final Schema STREAM_DEFAULT_KEYS_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#StreamOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("link", PreludeSchemas.STRING)
             .putMember("riakHeaders", Schemas.RIAK_HEADERS)
             .putMember("body", Schemas.BYTE_STREAM,
                     new RequiredTrait())
             .builderSupplier(StreamDefaultKeysOutput::builder)
             .shapeClass(StreamDefaultKeysOutput.class)
             .build();

    static final Schema STREAM_DEFAULT_SECONDARY_INDEX_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#DefaultSecondaryIndexStreamInput"))
             .putMember("bucket", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("timeout", PreludeSchemas.INTEGER)
             .putMember("maxResults", PreludeSchemas.INTEGER)
             .putMember("continuation", PreludeSchemas.STRING)
             .putMember("returnTerms", PreludeSchemas.BOOLEAN)
             .putMember("paginationSort", PreludeSchemas.BOOLEAN)
             .putMember("termRegex", PreludeSchemas.STRING)
             .putMember("field", Schemas.NON_EMPTY_STRING,
                     new RequiredTrait())
             .putMember("value", PreludeSchemas.STRING,
                     new RequiredTrait())
             .builderSupplier(StreamDefaultSecondaryIndexInput::builder)
             .shapeClass(StreamDefaultSecondaryIndexInput.class)
             .build();

    static final Schema STREAM_DEFAULT_SECONDARY_INDEX_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#StreamOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("link", PreludeSchemas.STRING)
             .putMember("riakHeaders", Schemas.RIAK_HEADERS)
             .putMember("body", Schemas.BYTE_STREAM,
                     new RequiredTrait())
             .builderSupplier(StreamDefaultSecondaryIndexOutput::builder)
             .shapeClass(StreamDefaultSecondaryIndexOutput.class)
             .build();

    static final Schema STREAM_DEFAULT_SECONDARY_INDEX_RANGE_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#DefaultSecondaryIndexRangeStreamInput"))
             .putMember("bucket", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("timeout", PreludeSchemas.INTEGER)
             .putMember("maxResults", PreludeSchemas.INTEGER)
             .putMember("continuation", PreludeSchemas.STRING)
             .putMember("returnTerms", PreludeSchemas.BOOLEAN)
             .putMember("paginationSort", PreludeSchemas.BOOLEAN)
             .putMember("termRegex", PreludeSchemas.STRING)
             .putMember("field", Schemas.NON_EMPTY_STRING,
                     new RequiredTrait())
             .putMember("start", PreludeSchemas.STRING,
                     new RequiredTrait())
             .putMember("end", PreludeSchemas.STRING,
                     new RequiredTrait())
             .builderSupplier(StreamDefaultSecondaryIndexRangeInput::builder)
             .shapeClass(StreamDefaultSecondaryIndexRangeInput.class)
             .build();

    static final Schema STREAM_DEFAULT_SECONDARY_INDEX_RANGE_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#StreamOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("link", PreludeSchemas.STRING)
             .putMember("riakHeaders", Schemas.RIAK_HEADERS)
             .putMember("body", Schemas.BYTE_STREAM,
                     new RequiredTrait())
             .builderSupplier(StreamDefaultSecondaryIndexRangeOutput::builder)
             .shapeClass(StreamDefaultSecondaryIndexRangeOutput.class)
             .build();

    static final Schema STREAM_KEYS_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#ListKeysInput"))
             .putMember("bucketType", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("bucket", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("timeout", PreludeSchemas.INTEGER)
             .putMember("props", PreludeSchemas.BOOLEAN)
             .builderSupplier(StreamKeysInput::builder)
             .shapeClass(StreamKeysInput.class)
             .build();

    static final Schema STREAM_KEYS_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#StreamOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("link", PreludeSchemas.STRING)
             .putMember("riakHeaders", Schemas.RIAK_HEADERS)
             .putMember("body", Schemas.BYTE_STREAM,
                     new RequiredTrait())
             .builderSupplier(StreamKeysOutput::builder)
             .shapeClass(StreamKeysOutput.class)
             .build();

    static final Schema STREAM_SECONDARY_INDEX_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#SecondaryIndexStreamInput"))
             .putMember("bucketType", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("bucket", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("timeout", PreludeSchemas.INTEGER)
             .putMember("maxResults", PreludeSchemas.INTEGER)
             .putMember("continuation", PreludeSchemas.STRING)
             .putMember("returnTerms", PreludeSchemas.BOOLEAN)
             .putMember("paginationSort", PreludeSchemas.BOOLEAN)
             .putMember("termRegex", PreludeSchemas.STRING)
             .putMember("field", Schemas.NON_EMPTY_STRING,
                     new RequiredTrait())
             .putMember("value", PreludeSchemas.STRING,
                     new RequiredTrait())
             .builderSupplier(StreamSecondaryIndexInput::builder)
             .shapeClass(StreamSecondaryIndexInput.class)
             .build();

    static final Schema STREAM_SECONDARY_INDEX_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#StreamOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("link", PreludeSchemas.STRING)
             .putMember("riakHeaders", Schemas.RIAK_HEADERS)
             .putMember("body", Schemas.BYTE_STREAM,
                     new RequiredTrait())
             .builderSupplier(StreamSecondaryIndexOutput::builder)
             .shapeClass(StreamSecondaryIndexOutput.class)
             .build();

    static final Schema STREAM_SECONDARY_INDEX_RANGE_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#SecondaryIndexRangeStreamInput"))
             .putMember("bucketType", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("bucket", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("timeout", PreludeSchemas.INTEGER)
             .putMember("maxResults", PreludeSchemas.INTEGER)
             .putMember("continuation", PreludeSchemas.STRING)
             .putMember("returnTerms", PreludeSchemas.BOOLEAN)
             .putMember("paginationSort", PreludeSchemas.BOOLEAN)
             .putMember("termRegex", PreludeSchemas.STRING)
             .putMember("field", Schemas.NON_EMPTY_STRING,
                     new RequiredTrait())
             .putMember("start", PreludeSchemas.STRING,
                     new RequiredTrait())
             .putMember("end", PreludeSchemas.STRING,
                     new RequiredTrait())
             .builderSupplier(StreamSecondaryIndexRangeInput::builder)
             .shapeClass(StreamSecondaryIndexRangeInput.class)
             .build();

    static final Schema STREAM_SECONDARY_INDEX_RANGE_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#StreamOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("link", PreludeSchemas.STRING)
             .putMember("riakHeaders", Schemas.RIAK_HEADERS)
             .putMember("body", Schemas.BYTE_STREAM,
                     new RequiredTrait())
             .builderSupplier(StreamSecondaryIndexRangeOutput::builder)
             .shapeClass(StreamSecondaryIndexRangeOutput.class)
             .build();

    static final Schema UPDATE_DATATYPE_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#DatatypeUpdateInput"))
             .putMember("bucketType", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("bucket", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("key", PreludeSchemas.STRING,
                     new RequiredTrait())
             .putMember("timeout", PreludeSchemas.INTEGER)
             .putMember("r", Schemas.QUORUM)
             .putMember("pr", Schemas.QUORUM)
             .putMember("w", Schemas.QUORUM)
             .putMember("pw", Schemas.QUORUM)
             .putMember("dw", Schemas.QUORUM)
             .putMember("returnBody", PreludeSchemas.BOOLEAN)
             .putMember("includeContext", PreludeSchemas.BOOLEAN)
             .putMember("contentType", Schemas.MEDIA_TYPE,
                     new RequiredTrait())
             .putMember("update", Schemas.DATATYPE_UPDATE_PAYLOAD,
                     new RequiredTrait())
             .builderSupplier(UpdateDatatypeInput::builder)
             .shapeClass(UpdateDatatypeInput.class)
             .build();

    static final Schema UPDATE_DATATYPE_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#DatatypeOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("crdtContext", PreludeSchemas.STRING)
             .putMember("body", Schemas.JSON_DOCUMENT)
             .builderSupplier(UpdateDatatypeOutput::builder)
             .shapeClass(UpdateDatatypeOutput.class)
             .build();

    static final Schema UPDATE_LEGACY_COUNTER_INPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#CounterUpdateInput"))
             .putMember("bucket", Schemas.URI_SAFE_IDENTIFIER,
                     new RequiredTrait())
             .putMember("key", PreludeSchemas.STRING,
                     new RequiredTrait())
             .putMember("timeout", PreludeSchemas.INTEGER)
             .putMember("w", Schemas.QUORUM)
             .putMember("pw", Schemas.QUORUM)
             .putMember("dw", Schemas.QUORUM)
             .putMember("returnValue", PreludeSchemas.BOOLEAN)
             .putMember("amount", PreludeSchemas.STRING,
                     new RequiredTrait())
             .builderSupplier(UpdateLegacyCounterInput::builder)
             .shapeClass(UpdateLegacyCounterInput.class)
             .build();

    static final Schema UPDATE_LEGACY_COUNTER_OUTPUT = Schema.structureBuilder(ShapeId.from("openriak.v3_4.api#TextOutput"))
             .putMember("statusCode", PreludeSchemas.INTEGER)
             .putMember("contentType", Schemas.MEDIA_TYPE)
             .putMember("body", PreludeSchemas.STRING)
             .builderSupplier(UpdateLegacyCounterOutput::builder)
             .shapeClass(UpdateLegacyCounterOutput.class)
             .build();

    private Schemas() {}
}
