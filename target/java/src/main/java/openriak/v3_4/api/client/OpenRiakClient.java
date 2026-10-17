package openriak.v3_4.api.client;

import openriak.v3_4.api.model.BadRequestError;
import openriak.v3_4.api.model.ConflictError;
import openriak.v3_4.api.model.CreateDatatypeInput;
import openriak.v3_4.api.model.CreateDatatypeOutput;
import openriak.v3_4.api.model.CreateDefaultObjectOperationInput;
import openriak.v3_4.api.model.CreateDefaultObjectOutput;
import openriak.v3_4.api.model.CreateDefaultObjectReturnBodyInput;
import openriak.v3_4.api.model.CreateDefaultObjectReturnBodyOutput;
import openriak.v3_4.api.model.CreateObjectOperationInput;
import openriak.v3_4.api.model.CreateObjectOperationOutput;
import openriak.v3_4.api.model.CreateObjectReturnBodyInput;
import openriak.v3_4.api.model.CreateObjectReturnBodyOperationOutput;
import openriak.v3_4.api.model.DeleteDefaultObjectOperationInput;
import openriak.v3_4.api.model.DeleteDefaultObjectOutput;
import openriak.v3_4.api.model.DeleteLegacyObjectInput;
import openriak.v3_4.api.model.DeleteLegacyObjectOutput;
import openriak.v3_4.api.model.DeleteObjectInput;
import openriak.v3_4.api.model.DeleteObjectOutput;
import openriak.v3_4.api.model.ForbiddenError;
import openriak.v3_4.api.model.GetBucketPropertiesInput;
import openriak.v3_4.api.model.GetBucketPropertiesOutput;
import openriak.v3_4.api.model.GetBucketQueryResultsInput;
import openriak.v3_4.api.model.GetBucketQueryResultsOutput;
import openriak.v3_4.api.model.GetBucketTypePropertiesInput;
import openriak.v3_4.api.model.GetBucketTypePropertiesOutput;
import openriak.v3_4.api.model.GetDatatypeInput;
import openriak.v3_4.api.model.GetDatatypeOutput;
import openriak.v3_4.api.model.GetDefaultBucketPropertiesInput;
import openriak.v3_4.api.model.GetDefaultBucketPropertiesOutput;
import openriak.v3_4.api.model.GetDefaultBucketQueryResultsInput;
import openriak.v3_4.api.model.GetDefaultBucketQueryResultsOutput;
import openriak.v3_4.api.model.GetDefaultEraseKeysInput;
import openriak.v3_4.api.model.GetDefaultEraseKeysOutput;
import openriak.v3_4.api.model.GetDefaultFetchClocksRangeInput;
import openriak.v3_4.api.model.GetDefaultFetchClocksRangeOutput;
import openriak.v3_4.api.model.GetDefaultFindKeysByObjectSizeInput;
import openriak.v3_4.api.model.GetDefaultFindKeysByObjectSizeOutput;
import openriak.v3_4.api.model.GetDefaultFindKeysBySiblingCountInput;
import openriak.v3_4.api.model.GetDefaultFindKeysBySiblingCountOutput;
import openriak.v3_4.api.model.GetDefaultFindTombsInput;
import openriak.v3_4.api.model.GetDefaultFindTombsOutput;
import openriak.v3_4.api.model.GetDefaultMergeTreeRangeInput;
import openriak.v3_4.api.model.GetDefaultMergeTreeRangeOutput;
import openriak.v3_4.api.model.GetDefaultObjectOperationInput;
import openriak.v3_4.api.model.GetDefaultObjectOutput;
import openriak.v3_4.api.model.GetDefaultObjectStatsInput;
import openriak.v3_4.api.model.GetDefaultObjectStatsOutput;
import openriak.v3_4.api.model.GetDefaultReapTombsInput;
import openriak.v3_4.api.model.GetDefaultReapTombsOutput;
import openriak.v3_4.api.model.GetDefaultRepairKeysRangeInput;
import openriak.v3_4.api.model.GetDefaultRepairKeysRangeOutput;
import openriak.v3_4.api.model.GetDefaultReplKeysRangeInput;
import openriak.v3_4.api.model.GetDefaultReplKeysRangeOutput;
import openriak.v3_4.api.model.GetEraseKeysInput;
import openriak.v3_4.api.model.GetEraseKeysOutput;
import openriak.v3_4.api.model.GetFetchClocksNvalInput;
import openriak.v3_4.api.model.GetFetchClocksNvalOutput;
import openriak.v3_4.api.model.GetFetchClocksRangeInput;
import openriak.v3_4.api.model.GetFetchClocksRangeOutput;
import openriak.v3_4.api.model.GetFindKeysByObjectSizeInput;
import openriak.v3_4.api.model.GetFindKeysByObjectSizeOutput;
import openriak.v3_4.api.model.GetFindKeysBySiblingCountInput;
import openriak.v3_4.api.model.GetFindKeysBySiblingCountOutput;
import openriak.v3_4.api.model.GetFindTombsInput;
import openriak.v3_4.api.model.GetFindTombsOutput;
import openriak.v3_4.api.model.GetLegacyCounterInput;
import openriak.v3_4.api.model.GetLegacyCounterOutput;
import openriak.v3_4.api.model.GetLegacyObjectInput;
import openriak.v3_4.api.model.GetLegacyObjectOutput;
import openriak.v3_4.api.model.GetMapReduceUsageInput;
import openriak.v3_4.api.model.GetMapReduceUsageOutput;
import openriak.v3_4.api.model.GetMembershipInput;
import openriak.v3_4.api.model.GetMembershipOutput;
import openriak.v3_4.api.model.GetMergeBranchNvalInput;
import openriak.v3_4.api.model.GetMergeBranchNvalOutput;
import openriak.v3_4.api.model.GetMergeRootNvalInput;
import openriak.v3_4.api.model.GetMergeRootNvalOutput;
import openriak.v3_4.api.model.GetMergeTreeRangeInput;
import openriak.v3_4.api.model.GetMergeTreeRangeOutput;
import openriak.v3_4.api.model.GetObjectInput;
import openriak.v3_4.api.model.GetObjectOutput;
import openriak.v3_4.api.model.GetObjectStatsInput;
import openriak.v3_4.api.model.GetObjectStatsOutput;
import openriak.v3_4.api.model.GetQueueItemInput;
import openriak.v3_4.api.model.GetQueueItemOutput;
import openriak.v3_4.api.model.GetReapTombsInput;
import openriak.v3_4.api.model.GetReapTombsOutput;
import openriak.v3_4.api.model.GetRepairKeysRangeInput;
import openriak.v3_4.api.model.GetRepairKeysRangeOutput;
import openriak.v3_4.api.model.GetReplKeysRangeInput;
import openriak.v3_4.api.model.GetReplKeysRangeOutput;
import openriak.v3_4.api.model.GetRootInput;
import openriak.v3_4.api.model.GetRootOutput;
import openriak.v3_4.api.model.GetStatsInput;
import openriak.v3_4.api.model.GetStatsOutput;
import openriak.v3_4.api.model.GoneError;
import openriak.v3_4.api.model.HeadDefaultObjectOperationInput;
import openriak.v3_4.api.model.HeadDefaultObjectOutput;
import openriak.v3_4.api.model.HeadLegacyObjectInput;
import openriak.v3_4.api.model.HeadLegacyObjectOutput;
import openriak.v3_4.api.model.HeadMapReduceInput;
import openriak.v3_4.api.model.HeadMapReduceOutput;
import openriak.v3_4.api.model.HeadObjectInput;
import openriak.v3_4.api.model.HeadObjectOperationOutput;
import openriak.v3_4.api.model.HeadStatsInput;
import openriak.v3_4.api.model.HeadStatsOutput;
import openriak.v3_4.api.model.InternalServerError;
import openriak.v3_4.api.model.LinkWalkDefaultOperationInput;
import openriak.v3_4.api.model.LinkWalkDefaultOutput;
import openriak.v3_4.api.model.LinkWalkInput;
import openriak.v3_4.api.model.LinkWalkLegacyInput;
import openriak.v3_4.api.model.LinkWalkLegacyOutput;
import openriak.v3_4.api.model.LinkWalkOutput;
import openriak.v3_4.api.model.ListAaeBucketsInput;
import openriak.v3_4.api.model.ListAaeBucketsOutput;
import openriak.v3_4.api.model.ListBucketsOperationInput;
import openriak.v3_4.api.model.ListBucketsOutput;
import openriak.v3_4.api.model.ListDefaultBucketsInput;
import openriak.v3_4.api.model.ListDefaultBucketsOutput;
import openriak.v3_4.api.model.ListDefaultKeysOperationInput;
import openriak.v3_4.api.model.ListDefaultKeysOutput;
import openriak.v3_4.api.model.ListKeysOperationInput;
import openriak.v3_4.api.model.ListKeysOutput;
import openriak.v3_4.api.model.MapReduceChunkedInput;
import openriak.v3_4.api.model.MapReduceChunkedOutput;
import openriak.v3_4.api.model.MapReduceOperationInput;
import openriak.v3_4.api.model.MapReduceOutput;
import openriak.v3_4.api.model.MovedPermanentlyError;
import openriak.v3_4.api.model.MultipleChoicesError;
import openriak.v3_4.api.model.NotAcceptableError;
import openriak.v3_4.api.model.NotFoundError;
import openriak.v3_4.api.model.OpenRiakApiService;
import openriak.v3_4.api.model.PingInput;
import openriak.v3_4.api.model.PingOutput;
import openriak.v3_4.api.model.PostDefaultObjectInput;
import openriak.v3_4.api.model.PostDefaultObjectOutput;
import openriak.v3_4.api.model.PostDefaultObjectReturnBodyInput;
import openriak.v3_4.api.model.PostDefaultObjectReturnBodyOutput;
import openriak.v3_4.api.model.PostLegacyObjectInput;
import openriak.v3_4.api.model.PostLegacyObjectOutput;
import openriak.v3_4.api.model.PostLegacyObjectReturnBodyInput;
import openriak.v3_4.api.model.PostLegacyObjectReturnBodyOutput;
import openriak.v3_4.api.model.PostObjectInput;
import openriak.v3_4.api.model.PostObjectOutput;
import openriak.v3_4.api.model.PostObjectReturnBodyInput;
import openriak.v3_4.api.model.PostObjectReturnBodyOutput;
import openriak.v3_4.api.model.PreconditionFailedError;
import openriak.v3_4.api.model.PushQueueItemsInput;
import openriak.v3_4.api.model.PushQueueItemsOutput;
import openriak.v3_4.api.model.PutDefaultObjectOperationInput;
import openriak.v3_4.api.model.PutDefaultObjectOutput;
import openriak.v3_4.api.model.PutDefaultObjectReturnBodyInput;
import openriak.v3_4.api.model.PutDefaultObjectReturnBodyOutput;
import openriak.v3_4.api.model.PutLegacyObjectInput;
import openriak.v3_4.api.model.PutLegacyObjectOutput;
import openriak.v3_4.api.model.PutLegacyObjectReturnBodyInput;
import openriak.v3_4.api.model.PutLegacyObjectReturnBodyOutput;
import openriak.v3_4.api.model.PutObjectOperationInput;
import openriak.v3_4.api.model.PutObjectOutput;
import openriak.v3_4.api.model.PutObjectReturnBodyInput;
import openriak.v3_4.api.model.PutObjectReturnBodyOutput;
import openriak.v3_4.api.model.QueryDefaultSecondaryIndexInput;
import openriak.v3_4.api.model.QueryDefaultSecondaryIndexOutput;
import openriak.v3_4.api.model.QueryDefaultSecondaryIndexRangeInput;
import openriak.v3_4.api.model.QueryDefaultSecondaryIndexRangeOutput;
import openriak.v3_4.api.model.QuerySecondaryIndexInput;
import openriak.v3_4.api.model.QuerySecondaryIndexOutput;
import openriak.v3_4.api.model.QuerySecondaryIndexRangeInput;
import openriak.v3_4.api.model.QuerySecondaryIndexRangeOutput;
import openriak.v3_4.api.model.ResetBucketPropertiesInput;
import openriak.v3_4.api.model.ResetBucketPropertiesOutput;
import openriak.v3_4.api.model.ResetDefaultBucketPropertiesInput;
import openriak.v3_4.api.model.ResetDefaultBucketPropertiesOutput;
import openriak.v3_4.api.model.RunBucketQueryInput;
import openriak.v3_4.api.model.RunBucketQueryOutput;
import openriak.v3_4.api.model.RunDefaultBucketQueryInput;
import openriak.v3_4.api.model.RunDefaultBucketQueryOutput;
import openriak.v3_4.api.model.SetBucketPropertiesInput;
import openriak.v3_4.api.model.SetBucketPropertiesOutput;
import openriak.v3_4.api.model.SetBucketTypePropertiesInput;
import openriak.v3_4.api.model.SetBucketTypePropertiesOutput;
import openriak.v3_4.api.model.SetDefaultBucketPropertiesInput;
import openriak.v3_4.api.model.SetDefaultBucketPropertiesOutput;
import openriak.v3_4.api.model.StreamBucketsInput;
import openriak.v3_4.api.model.StreamBucketsOutput;
import openriak.v3_4.api.model.StreamDefaultBucketsInput;
import openriak.v3_4.api.model.StreamDefaultBucketsOutput;
import openriak.v3_4.api.model.StreamDefaultKeysInput;
import openriak.v3_4.api.model.StreamDefaultKeysOutput;
import openriak.v3_4.api.model.StreamDefaultSecondaryIndexInput;
import openriak.v3_4.api.model.StreamDefaultSecondaryIndexOutput;
import openriak.v3_4.api.model.StreamDefaultSecondaryIndexRangeInput;
import openriak.v3_4.api.model.StreamDefaultSecondaryIndexRangeOutput;
import openriak.v3_4.api.model.StreamKeysInput;
import openriak.v3_4.api.model.StreamKeysOutput;
import openriak.v3_4.api.model.StreamSecondaryIndexInput;
import openriak.v3_4.api.model.StreamSecondaryIndexOutput;
import openriak.v3_4.api.model.StreamSecondaryIndexRangeInput;
import openriak.v3_4.api.model.StreamSecondaryIndexRangeOutput;
import openriak.v3_4.api.model.TimeoutError;
import openriak.v3_4.api.model.UnauthorizedError;
import openriak.v3_4.api.model.UpdateDatatypeInput;
import openriak.v3_4.api.model.UpdateDatatypeOutput;
import openriak.v3_4.api.model.UpdateLegacyCounterInput;
import openriak.v3_4.api.model.UpdateLegacyCounterOutput;
import openriak.v3_4.api.model.UpgradeRequiredError;
import software.amazon.smithy.java.client.core.Client;
import software.amazon.smithy.java.client.core.ClientConfig;
import software.amazon.smithy.java.client.core.RequestOverrideConfig;
import software.amazon.smithy.java.client.core.auth.scheme.AuthSchemeFactory;
import software.amazon.smithy.java.client.http.JavaHttpClientTransport;
import software.amazon.smithy.java.client.http.auth.HttpBasicAuthAuthScheme;
import software.amazon.smithy.java.core.serde.document.Document;
import software.amazon.smithy.model.traits.HttpBasicAuthTrait;
import software.amazon.smithy.utils.SmithyGenerated;

/**
 * OpenRiak HTTP API for openriak-3.4. Routes and payloads are modeled with standard Smithy HTTP
 * binding traits only (@http, @httpLabel, @httpQuery, @httpHeader, @httpPrefixHeaders, @httpPayload,
 * @httpResponseCode, @httpError). There is no custom protocol trait and no stock restJson1-style
 * envelope; clients must implement Riak wire details (x-riak- prefix headers, opaque object bodies,
 * multipart siblings, quorum query strings) in application or custom runtime code.
 *
 * When Riak security is enabled, call the API over HTTPS with HTTP Basic credentials (@httpBasicAuth).
 * Missing or invalid credentials yield 401 with a WWW-Authenticate challenge (Basic realm="Riak").
 * Credentials sent over plain HTTP may yield 426 Upgrade Required.
 *
 */
@SmithyGenerated
public interface OpenRiakClient {

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws ConflictError
     * @throws MovedPermanentlyError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default CreateDatatypeOutput createDatatype(CreateDatatypeInput input) {
        return createDatatype(input, null);
    }

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws ConflictError
     * @throws MovedPermanentlyError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    CreateDatatypeOutput createDatatype(CreateDatatypeInput input, RequestOverrideConfig overrideConfig);

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotAcceptableError
     * @throws ConflictError
     * @throws PreconditionFailedError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default CreateDefaultObjectOutput createDefaultObject(CreateDefaultObjectOperationInput input) {
        return createDefaultObject(input, null);
    }

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotAcceptableError
     * @throws ConflictError
     * @throws PreconditionFailedError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    CreateDefaultObjectOutput createDefaultObject(CreateDefaultObjectOperationInput input, RequestOverrideConfig overrideConfig);

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotAcceptableError
     * @throws ConflictError
     * @throws PreconditionFailedError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default CreateDefaultObjectReturnBodyOutput createDefaultObjectReturnBody(CreateDefaultObjectReturnBodyInput input) {
        return createDefaultObjectReturnBody(input, null);
    }

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotAcceptableError
     * @throws ConflictError
     * @throws PreconditionFailedError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    CreateDefaultObjectReturnBodyOutput createDefaultObjectReturnBody(CreateDefaultObjectReturnBodyInput input, RequestOverrideConfig overrideConfig);

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotAcceptableError
     * @throws ConflictError
     * @throws PreconditionFailedError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default CreateObjectOperationOutput createObject(CreateObjectOperationInput input) {
        return createObject(input, null);
    }

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotAcceptableError
     * @throws ConflictError
     * @throws PreconditionFailedError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    CreateObjectOperationOutput createObject(CreateObjectOperationInput input, RequestOverrideConfig overrideConfig);

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotAcceptableError
     * @throws ConflictError
     * @throws PreconditionFailedError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default CreateObjectReturnBodyOperationOutput createObjectReturnBody(CreateObjectReturnBodyInput input) {
        return createObjectReturnBody(input, null);
    }

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotAcceptableError
     * @throws ConflictError
     * @throws PreconditionFailedError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    CreateObjectReturnBodyOperationOutput createObjectReturnBody(CreateObjectReturnBodyInput input, RequestOverrideConfig overrideConfig);

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotFoundError
     * @throws PreconditionFailedError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default DeleteDefaultObjectOutput deleteDefaultObject(DeleteDefaultObjectOperationInput input) {
        return deleteDefaultObject(input, null);
    }

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotFoundError
     * @throws PreconditionFailedError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    DeleteDefaultObjectOutput deleteDefaultObject(DeleteDefaultObjectOperationInput input, RequestOverrideConfig overrideConfig);

    /**
     * Legacy /riak/ object API. Deprecated in docs but still served on openriak-3.4.
     *
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotFoundError
     * @throws PreconditionFailedError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default DeleteLegacyObjectOutput deleteLegacyObject(DeleteLegacyObjectInput input) {
        return deleteLegacyObject(input, null);
    }

    /**
     * Legacy /riak/ object API. Deprecated in docs but still served on openriak-3.4.
     *
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotFoundError
     * @throws PreconditionFailedError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    DeleteLegacyObjectOutput deleteLegacyObject(DeleteLegacyObjectInput input, RequestOverrideConfig overrideConfig);

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotFoundError
     * @throws PreconditionFailedError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default DeleteObjectOutput deleteObject(DeleteObjectInput input) {
        return deleteObject(input, null);
    }

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotFoundError
     * @throws PreconditionFailedError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    DeleteObjectOutput deleteObject(DeleteObjectInput input, RequestOverrideConfig overrideConfig);

    /**
     * Response body uses a props envelope: {'props': {...}}.
     *
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotFoundError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default GetBucketPropertiesOutput getBucketProperties(GetBucketPropertiesInput input) {
        return getBucketProperties(input, null);
    }

    /**
     * Response body uses a props envelope: {'props': {...}}.
     *
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotFoundError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    GetBucketPropertiesOutput getBucketProperties(GetBucketPropertiesInput input, RequestOverrideConfig overrideConfig);

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws GoneError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default GetBucketQueryResultsOutput getBucketQueryResults(GetBucketQueryResultsInput input) {
        return getBucketQueryResults(input, null);
    }

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws GoneError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    GetBucketQueryResultsOutput getBucketQueryResults(GetBucketQueryResultsInput input, RequestOverrideConfig overrideConfig);

    /**
     * Response body uses a props envelope: {'props': {...}}.
     *
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotFoundError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default GetBucketTypePropertiesOutput getBucketTypeProperties(GetBucketTypePropertiesInput input) {
        return getBucketTypeProperties(input, null);
    }

    /**
     * Response body uses a props envelope: {'props': {...}}.
     *
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotFoundError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    GetBucketTypePropertiesOutput getBucketTypeProperties(GetBucketTypePropertiesInput input, RequestOverrideConfig overrideConfig);

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotFoundError
     * @throws MovedPermanentlyError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default GetDatatypeOutput getDatatype(GetDatatypeInput input) {
        return getDatatype(input, null);
    }

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotFoundError
     * @throws MovedPermanentlyError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    GetDatatypeOutput getDatatype(GetDatatypeInput input, RequestOverrideConfig overrideConfig);

    /**
     * Response body uses a props envelope: {'props': {...}}.
     *
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotFoundError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default GetDefaultBucketPropertiesOutput getDefaultBucketProperties(GetDefaultBucketPropertiesInput input) {
        return getDefaultBucketProperties(input, null);
    }

    /**
     * Response body uses a props envelope: {'props': {...}}.
     *
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotFoundError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    GetDefaultBucketPropertiesOutput getDefaultBucketProperties(GetDefaultBucketPropertiesInput input, RequestOverrideConfig overrideConfig);

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws GoneError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default GetDefaultBucketQueryResultsOutput getDefaultBucketQueryResults(GetDefaultBucketQueryResultsInput input) {
        return getDefaultBucketQueryResults(input, null);
    }

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws GoneError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    GetDefaultBucketQueryResultsOutput getDefaultBucketQueryResults(GetDefaultBucketQueryResultsInput input, RequestOverrideConfig overrideConfig);

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default GetDefaultEraseKeysOutput getDefaultEraseKeys(GetDefaultEraseKeysInput input) {
        return getDefaultEraseKeys(input, null);
    }

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    GetDefaultEraseKeysOutput getDefaultEraseKeys(GetDefaultEraseKeysInput input, RequestOverrideConfig overrideConfig);

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default GetDefaultFetchClocksRangeOutput getDefaultFetchClocksRange(GetDefaultFetchClocksRangeInput input) {
        return getDefaultFetchClocksRange(input, null);
    }

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    GetDefaultFetchClocksRangeOutput getDefaultFetchClocksRange(GetDefaultFetchClocksRangeInput input, RequestOverrideConfig overrideConfig);

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default GetDefaultFindKeysByObjectSizeOutput getDefaultFindKeysByObjectSize(GetDefaultFindKeysByObjectSizeInput input) {
        return getDefaultFindKeysByObjectSize(input, null);
    }

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    GetDefaultFindKeysByObjectSizeOutput getDefaultFindKeysByObjectSize(GetDefaultFindKeysByObjectSizeInput input, RequestOverrideConfig overrideConfig);

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default GetDefaultFindKeysBySiblingCountOutput getDefaultFindKeysBySiblingCount(GetDefaultFindKeysBySiblingCountInput input) {
        return getDefaultFindKeysBySiblingCount(input, null);
    }

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    GetDefaultFindKeysBySiblingCountOutput getDefaultFindKeysBySiblingCount(GetDefaultFindKeysBySiblingCountInput input, RequestOverrideConfig overrideConfig);

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default GetDefaultFindTombsOutput getDefaultFindTombs(GetDefaultFindTombsInput input) {
        return getDefaultFindTombs(input, null);
    }

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    GetDefaultFindTombsOutput getDefaultFindTombs(GetDefaultFindTombsInput input, RequestOverrideConfig overrideConfig);

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default GetDefaultMergeTreeRangeOutput getDefaultMergeTreeRange(GetDefaultMergeTreeRangeInput input) {
        return getDefaultMergeTreeRange(input, null);
    }

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    GetDefaultMergeTreeRangeOutput getDefaultMergeTreeRange(GetDefaultMergeTreeRangeInput input, RequestOverrideConfig overrideConfig);

    /**
     * When siblings exist and no vtag is given, the server may respond with 300 Multiple Choices and a
     * text body listing vtags. Send Accept: multipart/mixed to receive all siblings in one body at 200.
     *
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotFoundError
     * @throws NotAcceptableError
     * @throws ConflictError
     * @throws MultipleChoicesError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default GetDefaultObjectOutput getDefaultObject(GetDefaultObjectOperationInput input) {
        return getDefaultObject(input, null);
    }

    /**
     * When siblings exist and no vtag is given, the server may respond with 300 Multiple Choices and a
     * text body listing vtags. Send Accept: multipart/mixed to receive all siblings in one body at 200.
     *
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotFoundError
     * @throws NotAcceptableError
     * @throws ConflictError
     * @throws MultipleChoicesError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    GetDefaultObjectOutput getDefaultObject(GetDefaultObjectOperationInput input, RequestOverrideConfig overrideConfig);

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default GetDefaultObjectStatsOutput getDefaultObjectStats(GetDefaultObjectStatsInput input) {
        return getDefaultObjectStats(input, null);
    }

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    GetDefaultObjectStatsOutput getDefaultObjectStats(GetDefaultObjectStatsInput input, RequestOverrideConfig overrideConfig);

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default GetDefaultReapTombsOutput getDefaultReapTombs(GetDefaultReapTombsInput input) {
        return getDefaultReapTombs(input, null);
    }

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    GetDefaultReapTombsOutput getDefaultReapTombs(GetDefaultReapTombsInput input, RequestOverrideConfig overrideConfig);

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default GetDefaultRepairKeysRangeOutput getDefaultRepairKeysRange(GetDefaultRepairKeysRangeInput input) {
        return getDefaultRepairKeysRange(input, null);
    }

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    GetDefaultRepairKeysRangeOutput getDefaultRepairKeysRange(GetDefaultRepairKeysRangeInput input, RequestOverrideConfig overrideConfig);

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default GetDefaultReplKeysRangeOutput getDefaultReplKeysRange(GetDefaultReplKeysRangeInput input) {
        return getDefaultReplKeysRange(input, null);
    }

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    GetDefaultReplKeysRangeOutput getDefaultReplKeysRange(GetDefaultReplKeysRangeInput input, RequestOverrideConfig overrideConfig);

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default GetEraseKeysOutput getEraseKeys(GetEraseKeysInput input) {
        return getEraseKeys(input, null);
    }

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    GetEraseKeysOutput getEraseKeys(GetEraseKeysInput input, RequestOverrideConfig overrideConfig);

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default GetFetchClocksNvalOutput getFetchClocksNval(GetFetchClocksNvalInput input) {
        return getFetchClocksNval(input, null);
    }

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    GetFetchClocksNvalOutput getFetchClocksNval(GetFetchClocksNvalInput input, RequestOverrideConfig overrideConfig);

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default GetFetchClocksRangeOutput getFetchClocksRange(GetFetchClocksRangeInput input) {
        return getFetchClocksRange(input, null);
    }

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    GetFetchClocksRangeOutput getFetchClocksRange(GetFetchClocksRangeInput input, RequestOverrideConfig overrideConfig);

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default GetFindKeysByObjectSizeOutput getFindKeysByObjectSize(GetFindKeysByObjectSizeInput input) {
        return getFindKeysByObjectSize(input, null);
    }

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    GetFindKeysByObjectSizeOutput getFindKeysByObjectSize(GetFindKeysByObjectSizeInput input, RequestOverrideConfig overrideConfig);

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default GetFindKeysBySiblingCountOutput getFindKeysBySiblingCount(GetFindKeysBySiblingCountInput input) {
        return getFindKeysBySiblingCount(input, null);
    }

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    GetFindKeysBySiblingCountOutput getFindKeysBySiblingCount(GetFindKeysBySiblingCountInput input, RequestOverrideConfig overrideConfig);

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default GetFindTombsOutput getFindTombs(GetFindTombsInput input) {
        return getFindTombs(input, null);
    }

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    GetFindTombsOutput getFindTombs(GetFindTombsInput input, RequestOverrideConfig overrideConfig);

    /**
     * Legacy counter API on default-bucket paths. Deprecated in docs but still served on openriak-3.4.
     *
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotFoundError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default GetLegacyCounterOutput getLegacyCounter(GetLegacyCounterInput input) {
        return getLegacyCounter(input, null);
    }

    /**
     * Legacy counter API on default-bucket paths. Deprecated in docs but still served on openriak-3.4.
     *
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotFoundError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    GetLegacyCounterOutput getLegacyCounter(GetLegacyCounterInput input, RequestOverrideConfig overrideConfig);

    /**
     * Legacy /riak/ object API. Deprecated in docs but still served on openriak-3.4. When siblings exist
     * and no vtag is given, the server may respond with 300 Multiple Choices and a text body listing
     * vtags. Send Accept: multipart/mixed to receive all siblings in one body at 200.
     *
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotFoundError
     * @throws NotAcceptableError
     * @throws ConflictError
     * @throws MultipleChoicesError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default GetLegacyObjectOutput getLegacyObject(GetLegacyObjectInput input) {
        return getLegacyObject(input, null);
    }

    /**
     * Legacy /riak/ object API. Deprecated in docs but still served on openriak-3.4. When siblings exist
     * and no vtag is given, the server may respond with 300 Multiple Choices and a text body listing
     * vtags. Send Accept: multipart/mixed to receive all siblings in one body at 200.
     *
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotFoundError
     * @throws NotAcceptableError
     * @throws ConflictError
     * @throws MultipleChoicesError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    GetLegacyObjectOutput getLegacyObject(GetLegacyObjectInput input, RequestOverrideConfig overrideConfig);

    /**
     * Deprecated in docs but still served on openriak-3.4. Prefer the Query API for data queries.
     *
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default GetMapReduceUsageOutput getMapReduceUsage(GetMapReduceUsageInput input) {
        return getMapReduceUsage(input, null);
    }

    /**
     * Deprecated in docs but still served on openriak-3.4. Prefer the Query API for data queries.
     *
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    GetMapReduceUsageOutput getMapReduceUsage(GetMapReduceUsageInput input, RequestOverrideConfig overrideConfig);

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default GetMembershipOutput getMembership(GetMembershipInput input) {
        return getMembership(input, null);
    }

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    GetMembershipOutput getMembership(GetMembershipInput input, RequestOverrideConfig overrideConfig);

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default GetMergeBranchNvalOutput getMergeBranchNval(GetMergeBranchNvalInput input) {
        return getMergeBranchNval(input, null);
    }

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    GetMergeBranchNvalOutput getMergeBranchNval(GetMergeBranchNvalInput input, RequestOverrideConfig overrideConfig);

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default GetMergeRootNvalOutput getMergeRootNval(GetMergeRootNvalInput input) {
        return getMergeRootNval(input, null);
    }

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    GetMergeRootNvalOutput getMergeRootNval(GetMergeRootNvalInput input, RequestOverrideConfig overrideConfig);

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default GetMergeTreeRangeOutput getMergeTreeRange(GetMergeTreeRangeInput input) {
        return getMergeTreeRange(input, null);
    }

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    GetMergeTreeRangeOutput getMergeTreeRange(GetMergeTreeRangeInput input, RequestOverrideConfig overrideConfig);

    /**
     * When siblings exist and no vtag is given, the server may respond with 300 Multiple Choices and a
     * text body listing vtags. Send Accept: multipart/mixed to receive all siblings in one body at 200.
     *
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotFoundError
     * @throws NotAcceptableError
     * @throws ConflictError
     * @throws MultipleChoicesError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default GetObjectOutput getObject(GetObjectInput input) {
        return getObject(input, null);
    }

    /**
     * When siblings exist and no vtag is given, the server may respond with 300 Multiple Choices and a
     * text body listing vtags. Send Accept: multipart/mixed to receive all siblings in one body at 200.
     *
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotFoundError
     * @throws NotAcceptableError
     * @throws ConflictError
     * @throws MultipleChoicesError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    GetObjectOutput getObject(GetObjectInput input, RequestOverrideConfig overrideConfig);

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default GetObjectStatsOutput getObjectStats(GetObjectStatsInput input) {
        return getObjectStats(input, null);
    }

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    GetObjectStatsOutput getObjectStats(GetObjectStatsInput input, RequestOverrideConfig overrideConfig);

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotFoundError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default GetQueueItemOutput getQueueItem(GetQueueItemInput input) {
        return getQueueItem(input, null);
    }

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotFoundError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    GetQueueItemOutput getQueueItem(GetQueueItemInput input, RequestOverrideConfig overrideConfig);

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default GetReapTombsOutput getReapTombs(GetReapTombsInput input) {
        return getReapTombs(input, null);
    }

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    GetReapTombsOutput getReapTombs(GetReapTombsInput input, RequestOverrideConfig overrideConfig);

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default GetRepairKeysRangeOutput getRepairKeysRange(GetRepairKeysRangeInput input) {
        return getRepairKeysRange(input, null);
    }

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    GetRepairKeysRangeOutput getRepairKeysRange(GetRepairKeysRangeInput input, RequestOverrideConfig overrideConfig);

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default GetReplKeysRangeOutput getReplKeysRange(GetReplKeysRangeInput input) {
        return getReplKeysRange(input, null);
    }

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    GetReplKeysRangeOutput getReplKeysRange(GetReplKeysRangeInput input, RequestOverrideConfig overrideConfig);

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default GetRootOutput getRoot(GetRootInput input) {
        return getRoot(input, null);
    }

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    GetRootOutput getRoot(GetRootInput input, RequestOverrideConfig overrideConfig);

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default GetStatsOutput getStats(GetStatsInput input) {
        return getStats(input, null);
    }

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    GetStatsOutput getStats(GetStatsInput input, RequestOverrideConfig overrideConfig);

    /**
     * When siblings exist and no vtag is given, the server may respond with 300 Multiple Choices and a
     * text body listing vtags. Send Accept: multipart/mixed to receive all siblings in one body at 200.
     *
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotFoundError
     * @throws NotAcceptableError
     * @throws ConflictError
     * @throws MultipleChoicesError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default HeadDefaultObjectOutput headDefaultObject(HeadDefaultObjectOperationInput input) {
        return headDefaultObject(input, null);
    }

    /**
     * When siblings exist and no vtag is given, the server may respond with 300 Multiple Choices and a
     * text body listing vtags. Send Accept: multipart/mixed to receive all siblings in one body at 200.
     *
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotFoundError
     * @throws NotAcceptableError
     * @throws ConflictError
     * @throws MultipleChoicesError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    HeadDefaultObjectOutput headDefaultObject(HeadDefaultObjectOperationInput input, RequestOverrideConfig overrideConfig);

    /**
     * Legacy /riak/ object API. Deprecated in docs but still served on openriak-3.4. When siblings exist
     * and no vtag is given, the server may respond with 300 Multiple Choices and a text body listing
     * vtags. Send Accept: multipart/mixed to receive all siblings in one body at 200.
     *
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotFoundError
     * @throws NotAcceptableError
     * @throws ConflictError
     * @throws MultipleChoicesError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default HeadLegacyObjectOutput headLegacyObject(HeadLegacyObjectInput input) {
        return headLegacyObject(input, null);
    }

    /**
     * Legacy /riak/ object API. Deprecated in docs but still served on openriak-3.4. When siblings exist
     * and no vtag is given, the server may respond with 300 Multiple Choices and a text body listing
     * vtags. Send Accept: multipart/mixed to receive all siblings in one body at 200.
     *
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotFoundError
     * @throws NotAcceptableError
     * @throws ConflictError
     * @throws MultipleChoicesError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    HeadLegacyObjectOutput headLegacyObject(HeadLegacyObjectInput input, RequestOverrideConfig overrideConfig);

    /**
     * Deprecated in docs but still served on openriak-3.4. Prefer the Query API for data queries.
     *
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default HeadMapReduceOutput headMapReduce(HeadMapReduceInput input) {
        return headMapReduce(input, null);
    }

    /**
     * Deprecated in docs but still served on openriak-3.4. Prefer the Query API for data queries.
     *
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    HeadMapReduceOutput headMapReduce(HeadMapReduceInput input, RequestOverrideConfig overrideConfig);

    /**
     * When siblings exist and no vtag is given, the server may respond with 300 Multiple Choices and a
     * text body listing vtags. Send Accept: multipart/mixed to receive all siblings in one body at 200.
     *
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotFoundError
     * @throws NotAcceptableError
     * @throws ConflictError
     * @throws MultipleChoicesError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default HeadObjectOperationOutput headObject(HeadObjectInput input) {
        return headObject(input, null);
    }

    /**
     * When siblings exist and no vtag is given, the server may respond with 300 Multiple Choices and a
     * text body listing vtags. Send Accept: multipart/mixed to receive all siblings in one body at 200.
     *
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotFoundError
     * @throws NotAcceptableError
     * @throws ConflictError
     * @throws MultipleChoicesError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    HeadObjectOperationOutput headObject(HeadObjectInput input, RequestOverrideConfig overrideConfig);

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default HeadStatsOutput headStats(HeadStatsInput input) {
        return headStats(input, null);
    }

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    HeadStatsOutput headStats(HeadStatsInput input, RequestOverrideConfig overrideConfig);

    /**
     * Deprecated in docs but still served on openriak-3.4.
     *
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotFoundError
     * @throws NotAcceptableError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default LinkWalkOutput linkWalk(LinkWalkInput input) {
        return linkWalk(input, null);
    }

    /**
     * Deprecated in docs but still served on openriak-3.4.
     *
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotFoundError
     * @throws NotAcceptableError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    LinkWalkOutput linkWalk(LinkWalkInput input, RequestOverrideConfig overrideConfig);

    /**
     * Deprecated in docs but still served on openriak-3.4.
     *
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotFoundError
     * @throws NotAcceptableError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default LinkWalkDefaultOutput linkWalkDefault(LinkWalkDefaultOperationInput input) {
        return linkWalkDefault(input, null);
    }

    /**
     * Deprecated in docs but still served on openriak-3.4.
     *
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotFoundError
     * @throws NotAcceptableError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    LinkWalkDefaultOutput linkWalkDefault(LinkWalkDefaultOperationInput input, RequestOverrideConfig overrideConfig);

    /**
     * Deprecated in docs but still served on openriak-3.4.
     *
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotFoundError
     * @throws NotAcceptableError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default LinkWalkLegacyOutput linkWalkLegacy(LinkWalkLegacyInput input) {
        return linkWalkLegacy(input, null);
    }

    /**
     * Deprecated in docs but still served on openriak-3.4.
     *
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotFoundError
     * @throws NotAcceptableError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    LinkWalkLegacyOutput linkWalkLegacy(LinkWalkLegacyInput input, RequestOverrideConfig overrideConfig);

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default ListAaeBucketsOutput listAaeBuckets(ListAaeBucketsInput input) {
        return listAaeBuckets(input, null);
    }

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    ListAaeBucketsOutput listAaeBuckets(ListAaeBucketsInput input, RequestOverrideConfig overrideConfig);

    /**
     * Deprecated in docs but still served on openriak-3.4. Prefer the Query API or AAE folds for bucket
     * enumeration.
     *
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default ListBucketsOutput listBuckets(ListBucketsOperationInput input) {
        return listBuckets(input, null);
    }

    /**
     * Deprecated in docs but still served on openriak-3.4. Prefer the Query API or AAE folds for bucket
     * enumeration.
     *
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    ListBucketsOutput listBuckets(ListBucketsOperationInput input, RequestOverrideConfig overrideConfig);

    /**
     * Deprecated in docs but still served on openriak-3.4. Prefer the Query API or AAE folds for bucket
     * enumeration.
     *
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default ListDefaultBucketsOutput listDefaultBuckets(ListDefaultBucketsInput input) {
        return listDefaultBuckets(input, null);
    }

    /**
     * Deprecated in docs but still served on openriak-3.4. Prefer the Query API or AAE folds for bucket
     * enumeration.
     *
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    ListDefaultBucketsOutput listDefaultBuckets(ListDefaultBucketsInput input, RequestOverrideConfig overrideConfig);

    /**
     * Deprecated in docs but still served on openriak-3.4. Prefer the Query API or AAE folds for key
     * enumeration.
     *
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default ListDefaultKeysOutput listDefaultKeys(ListDefaultKeysOperationInput input) {
        return listDefaultKeys(input, null);
    }

    /**
     * Deprecated in docs but still served on openriak-3.4. Prefer the Query API or AAE folds for key
     * enumeration.
     *
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    ListDefaultKeysOutput listDefaultKeys(ListDefaultKeysOperationInput input, RequestOverrideConfig overrideConfig);

    /**
     * Deprecated in docs but still served on openriak-3.4. Prefer the Query API or AAE folds for key
     * enumeration.
     *
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default ListKeysOutput listKeys(ListKeysOperationInput input) {
        return listKeys(input, null);
    }

    /**
     * Deprecated in docs but still served on openriak-3.4. Prefer the Query API or AAE folds for key
     * enumeration.
     *
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    ListKeysOutput listKeys(ListKeysOperationInput input, RequestOverrideConfig overrideConfig);

    /**
     * Deprecated in docs but still served on openriak-3.4. Prefer the Query API for data queries.
     *
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotAcceptableError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default MapReduceOutput mapReduce(MapReduceOperationInput input) {
        return mapReduce(input, null);
    }

    /**
     * Deprecated in docs but still served on openriak-3.4. Prefer the Query API for data queries.
     *
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotAcceptableError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    MapReduceOutput mapReduce(MapReduceOperationInput input, RequestOverrideConfig overrideConfig);

    /**
     * Deprecated in docs but still served on openriak-3.4. Prefer the Query API for data queries.
     *
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotAcceptableError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default MapReduceChunkedOutput mapReduceChunked(MapReduceChunkedInput input) {
        return mapReduceChunked(input, null);
    }

    /**
     * Deprecated in docs but still served on openriak-3.4. Prefer the Query API for data queries.
     *
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotAcceptableError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    MapReduceChunkedOutput mapReduceChunked(MapReduceChunkedInput input, RequestOverrideConfig overrideConfig);

    /**
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default PingOutput ping(PingInput input) {
        return ping(input, null);
    }

    /**
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    PingOutput ping(PingInput input, RequestOverrideConfig overrideConfig);

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotFoundError
     * @throws NotAcceptableError
     * @throws ConflictError
     * @throws PreconditionFailedError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default PostDefaultObjectOutput postDefaultObject(PostDefaultObjectInput input) {
        return postDefaultObject(input, null);
    }

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotFoundError
     * @throws NotAcceptableError
     * @throws ConflictError
     * @throws PreconditionFailedError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    PostDefaultObjectOutput postDefaultObject(PostDefaultObjectInput input, RequestOverrideConfig overrideConfig);

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotFoundError
     * @throws NotAcceptableError
     * @throws ConflictError
     * @throws PreconditionFailedError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default PostDefaultObjectReturnBodyOutput postDefaultObjectReturnBody(PostDefaultObjectReturnBodyInput input) {
        return postDefaultObjectReturnBody(input, null);
    }

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotFoundError
     * @throws NotAcceptableError
     * @throws ConflictError
     * @throws PreconditionFailedError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    PostDefaultObjectReturnBodyOutput postDefaultObjectReturnBody(PostDefaultObjectReturnBodyInput input, RequestOverrideConfig overrideConfig);

    /**
     * Legacy /riak/ object API. Deprecated in docs but still served on openriak-3.4.
     *
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotFoundError
     * @throws NotAcceptableError
     * @throws ConflictError
     * @throws PreconditionFailedError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default PostLegacyObjectOutput postLegacyObject(PostLegacyObjectInput input) {
        return postLegacyObject(input, null);
    }

    /**
     * Legacy /riak/ object API. Deprecated in docs but still served on openriak-3.4.
     *
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotFoundError
     * @throws NotAcceptableError
     * @throws ConflictError
     * @throws PreconditionFailedError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    PostLegacyObjectOutput postLegacyObject(PostLegacyObjectInput input, RequestOverrideConfig overrideConfig);

    /**
     * Legacy /riak/ object API. Deprecated in docs but still served on openriak-3.4.
     *
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotFoundError
     * @throws NotAcceptableError
     * @throws ConflictError
     * @throws PreconditionFailedError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default PostLegacyObjectReturnBodyOutput postLegacyObjectReturnBody(PostLegacyObjectReturnBodyInput input) {
        return postLegacyObjectReturnBody(input, null);
    }

    /**
     * Legacy /riak/ object API. Deprecated in docs but still served on openriak-3.4.
     *
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotFoundError
     * @throws NotAcceptableError
     * @throws ConflictError
     * @throws PreconditionFailedError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    PostLegacyObjectReturnBodyOutput postLegacyObjectReturnBody(PostLegacyObjectReturnBodyInput input, RequestOverrideConfig overrideConfig);

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotFoundError
     * @throws NotAcceptableError
     * @throws ConflictError
     * @throws PreconditionFailedError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default PostObjectOutput postObject(PostObjectInput input) {
        return postObject(input, null);
    }

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotFoundError
     * @throws NotAcceptableError
     * @throws ConflictError
     * @throws PreconditionFailedError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    PostObjectOutput postObject(PostObjectInput input, RequestOverrideConfig overrideConfig);

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotFoundError
     * @throws NotAcceptableError
     * @throws ConflictError
     * @throws PreconditionFailedError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default PostObjectReturnBodyOutput postObjectReturnBody(PostObjectReturnBodyInput input) {
        return postObjectReturnBody(input, null);
    }

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotFoundError
     * @throws NotAcceptableError
     * @throws ConflictError
     * @throws PreconditionFailedError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    PostObjectReturnBodyOutput postObjectReturnBody(PostObjectReturnBodyInput input, RequestOverrideConfig overrideConfig);

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default PushQueueItemsOutput pushQueueItems(PushQueueItemsInput input) {
        return pushQueueItems(input, null);
    }

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    PushQueueItemsOutput pushQueueItems(PushQueueItemsInput input, RequestOverrideConfig overrideConfig);

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotFoundError
     * @throws NotAcceptableError
     * @throws ConflictError
     * @throws PreconditionFailedError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default PutDefaultObjectOutput putDefaultObject(PutDefaultObjectOperationInput input) {
        return putDefaultObject(input, null);
    }

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotFoundError
     * @throws NotAcceptableError
     * @throws ConflictError
     * @throws PreconditionFailedError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    PutDefaultObjectOutput putDefaultObject(PutDefaultObjectOperationInput input, RequestOverrideConfig overrideConfig);

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotFoundError
     * @throws NotAcceptableError
     * @throws ConflictError
     * @throws PreconditionFailedError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default PutDefaultObjectReturnBodyOutput putDefaultObjectReturnBody(PutDefaultObjectReturnBodyInput input) {
        return putDefaultObjectReturnBody(input, null);
    }

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotFoundError
     * @throws NotAcceptableError
     * @throws ConflictError
     * @throws PreconditionFailedError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    PutDefaultObjectReturnBodyOutput putDefaultObjectReturnBody(PutDefaultObjectReturnBodyInput input, RequestOverrideConfig overrideConfig);

    /**
     * Legacy /riak/ object API. Deprecated in docs but still served on openriak-3.4.
     *
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotFoundError
     * @throws NotAcceptableError
     * @throws ConflictError
     * @throws PreconditionFailedError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default PutLegacyObjectOutput putLegacyObject(PutLegacyObjectInput input) {
        return putLegacyObject(input, null);
    }

    /**
     * Legacy /riak/ object API. Deprecated in docs but still served on openriak-3.4.
     *
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotFoundError
     * @throws NotAcceptableError
     * @throws ConflictError
     * @throws PreconditionFailedError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    PutLegacyObjectOutput putLegacyObject(PutLegacyObjectInput input, RequestOverrideConfig overrideConfig);

    /**
     * Legacy /riak/ object API. Deprecated in docs but still served on openriak-3.4.
     *
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotFoundError
     * @throws NotAcceptableError
     * @throws ConflictError
     * @throws PreconditionFailedError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default PutLegacyObjectReturnBodyOutput putLegacyObjectReturnBody(PutLegacyObjectReturnBodyInput input) {
        return putLegacyObjectReturnBody(input, null);
    }

    /**
     * Legacy /riak/ object API. Deprecated in docs but still served on openriak-3.4.
     *
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotFoundError
     * @throws NotAcceptableError
     * @throws ConflictError
     * @throws PreconditionFailedError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    PutLegacyObjectReturnBodyOutput putLegacyObjectReturnBody(PutLegacyObjectReturnBodyInput input, RequestOverrideConfig overrideConfig);

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotFoundError
     * @throws NotAcceptableError
     * @throws ConflictError
     * @throws PreconditionFailedError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default PutObjectOutput putObject(PutObjectOperationInput input) {
        return putObject(input, null);
    }

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotFoundError
     * @throws NotAcceptableError
     * @throws ConflictError
     * @throws PreconditionFailedError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    PutObjectOutput putObject(PutObjectOperationInput input, RequestOverrideConfig overrideConfig);

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotFoundError
     * @throws NotAcceptableError
     * @throws ConflictError
     * @throws PreconditionFailedError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default PutObjectReturnBodyOutput putObjectReturnBody(PutObjectReturnBodyInput input) {
        return putObjectReturnBody(input, null);
    }

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotFoundError
     * @throws NotAcceptableError
     * @throws ConflictError
     * @throws PreconditionFailedError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    PutObjectReturnBodyOutput putObjectReturnBody(PutObjectReturnBodyInput input, RequestOverrideConfig overrideConfig);

    /**
     * Deprecated legacy secondary index API but still served on openriak-3.4. Prefer the Query API.
     *
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default QueryDefaultSecondaryIndexOutput queryDefaultSecondaryIndex(QueryDefaultSecondaryIndexInput input) {
        return queryDefaultSecondaryIndex(input, null);
    }

    /**
     * Deprecated legacy secondary index API but still served on openriak-3.4. Prefer the Query API.
     *
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    QueryDefaultSecondaryIndexOutput queryDefaultSecondaryIndex(QueryDefaultSecondaryIndexInput input, RequestOverrideConfig overrideConfig);

    /**
     * Deprecated legacy secondary index API but still served on openriak-3.4. Prefer the Query API.
     *
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default QueryDefaultSecondaryIndexRangeOutput queryDefaultSecondaryIndexRange(QueryDefaultSecondaryIndexRangeInput input) {
        return queryDefaultSecondaryIndexRange(input, null);
    }

    /**
     * Deprecated legacy secondary index API but still served on openriak-3.4. Prefer the Query API.
     *
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    QueryDefaultSecondaryIndexRangeOutput queryDefaultSecondaryIndexRange(QueryDefaultSecondaryIndexRangeInput input, RequestOverrideConfig overrideConfig);

    /**
     * Deprecated legacy secondary index API but still served on openriak-3.4. Prefer the Query API.
     *
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default QuerySecondaryIndexOutput querySecondaryIndex(QuerySecondaryIndexInput input) {
        return querySecondaryIndex(input, null);
    }

    /**
     * Deprecated legacy secondary index API but still served on openriak-3.4. Prefer the Query API.
     *
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    QuerySecondaryIndexOutput querySecondaryIndex(QuerySecondaryIndexInput input, RequestOverrideConfig overrideConfig);

    /**
     * Deprecated legacy secondary index API but still served on openriak-3.4. Prefer the Query API.
     *
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default QuerySecondaryIndexRangeOutput querySecondaryIndexRange(QuerySecondaryIndexRangeInput input) {
        return querySecondaryIndexRange(input, null);
    }

    /**
     * Deprecated legacy secondary index API but still served on openriak-3.4. Prefer the Query API.
     *
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    QuerySecondaryIndexRangeOutput querySecondaryIndexRange(QuerySecondaryIndexRangeInput input, RequestOverrideConfig overrideConfig);

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotFoundError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default ResetBucketPropertiesOutput resetBucketProperties(ResetBucketPropertiesInput input) {
        return resetBucketProperties(input, null);
    }

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotFoundError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    ResetBucketPropertiesOutput resetBucketProperties(ResetBucketPropertiesInput input, RequestOverrideConfig overrideConfig);

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotFoundError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default ResetDefaultBucketPropertiesOutput resetDefaultBucketProperties(ResetDefaultBucketPropertiesInput input) {
        return resetDefaultBucketProperties(input, null);
    }

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotFoundError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    ResetDefaultBucketPropertiesOutput resetDefaultBucketProperties(ResetDefaultBucketPropertiesInput input, RequestOverrideConfig overrideConfig);

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default RunBucketQueryOutput runBucketQuery(RunBucketQueryInput input) {
        return runBucketQuery(input, null);
    }

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    RunBucketQueryOutput runBucketQuery(RunBucketQueryInput input, RequestOverrideConfig overrideConfig);

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default RunDefaultBucketQueryOutput runDefaultBucketQuery(RunDefaultBucketQueryInput input) {
        return runDefaultBucketQuery(input, null);
    }

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    RunDefaultBucketQueryOutput runDefaultBucketQuery(RunDefaultBucketQueryInput input, RequestOverrideConfig overrideConfig);

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotFoundError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default SetBucketPropertiesOutput setBucketProperties(SetBucketPropertiesInput input) {
        return setBucketProperties(input, null);
    }

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotFoundError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    SetBucketPropertiesOutput setBucketProperties(SetBucketPropertiesInput input, RequestOverrideConfig overrideConfig);

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotFoundError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default SetBucketTypePropertiesOutput setBucketTypeProperties(SetBucketTypePropertiesInput input) {
        return setBucketTypeProperties(input, null);
    }

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotFoundError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    SetBucketTypePropertiesOutput setBucketTypeProperties(SetBucketTypePropertiesInput input, RequestOverrideConfig overrideConfig);

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotFoundError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default SetDefaultBucketPropertiesOutput setDefaultBucketProperties(SetDefaultBucketPropertiesInput input) {
        return setDefaultBucketProperties(input, null);
    }

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotFoundError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    SetDefaultBucketPropertiesOutput setDefaultBucketProperties(SetDefaultBucketPropertiesInput input, RequestOverrideConfig overrideConfig);

    /**
     * Deprecated in docs but still served on openriak-3.4. Prefer the Query API or AAE folds for bucket
     * enumeration.
     *
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default StreamBucketsOutput streamBuckets(StreamBucketsInput input) {
        return streamBuckets(input, null);
    }

    /**
     * Deprecated in docs but still served on openriak-3.4. Prefer the Query API or AAE folds for bucket
     * enumeration.
     *
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    StreamBucketsOutput streamBuckets(StreamBucketsInput input, RequestOverrideConfig overrideConfig);

    /**
     * Deprecated in docs but still served on openriak-3.4. Prefer the Query API or AAE folds for bucket
     * enumeration.
     *
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default StreamDefaultBucketsOutput streamDefaultBuckets(StreamDefaultBucketsInput input) {
        return streamDefaultBuckets(input, null);
    }

    /**
     * Deprecated in docs but still served on openriak-3.4. Prefer the Query API or AAE folds for bucket
     * enumeration.
     *
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    StreamDefaultBucketsOutput streamDefaultBuckets(StreamDefaultBucketsInput input, RequestOverrideConfig overrideConfig);

    /**
     * Deprecated in docs but still served on openriak-3.4. Prefer the Query API or AAE folds for key
     * enumeration.
     *
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default StreamDefaultKeysOutput streamDefaultKeys(StreamDefaultKeysInput input) {
        return streamDefaultKeys(input, null);
    }

    /**
     * Deprecated in docs but still served on openriak-3.4. Prefer the Query API or AAE folds for key
     * enumeration.
     *
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    StreamDefaultKeysOutput streamDefaultKeys(StreamDefaultKeysInput input, RequestOverrideConfig overrideConfig);

    /**
     * Deprecated legacy secondary index API but still served on openriak-3.4. Prefer the Query API.
     *
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default StreamDefaultSecondaryIndexOutput streamDefaultSecondaryIndex(StreamDefaultSecondaryIndexInput input) {
        return streamDefaultSecondaryIndex(input, null);
    }

    /**
     * Deprecated legacy secondary index API but still served on openriak-3.4. Prefer the Query API.
     *
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    StreamDefaultSecondaryIndexOutput streamDefaultSecondaryIndex(StreamDefaultSecondaryIndexInput input, RequestOverrideConfig overrideConfig);

    /**
     * Deprecated legacy secondary index API but still served on openriak-3.4. Prefer the Query API.
     *
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default StreamDefaultSecondaryIndexRangeOutput streamDefaultSecondaryIndexRange(StreamDefaultSecondaryIndexRangeInput input) {
        return streamDefaultSecondaryIndexRange(input, null);
    }

    /**
     * Deprecated legacy secondary index API but still served on openriak-3.4. Prefer the Query API.
     *
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    StreamDefaultSecondaryIndexRangeOutput streamDefaultSecondaryIndexRange(StreamDefaultSecondaryIndexRangeInput input, RequestOverrideConfig overrideConfig);

    /**
     * Deprecated in docs but still served on openriak-3.4. Prefer the Query API or AAE folds for key
     * enumeration.
     *
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default StreamKeysOutput streamKeys(StreamKeysInput input) {
        return streamKeys(input, null);
    }

    /**
     * Deprecated in docs but still served on openriak-3.4. Prefer the Query API or AAE folds for key
     * enumeration.
     *
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    StreamKeysOutput streamKeys(StreamKeysInput input, RequestOverrideConfig overrideConfig);

    /**
     * Deprecated legacy secondary index API but still served on openriak-3.4. Prefer the Query API.
     *
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default StreamSecondaryIndexOutput streamSecondaryIndex(StreamSecondaryIndexInput input) {
        return streamSecondaryIndex(input, null);
    }

    /**
     * Deprecated legacy secondary index API but still served on openriak-3.4. Prefer the Query API.
     *
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    StreamSecondaryIndexOutput streamSecondaryIndex(StreamSecondaryIndexInput input, RequestOverrideConfig overrideConfig);

    /**
     * Deprecated legacy secondary index API but still served on openriak-3.4. Prefer the Query API.
     *
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default StreamSecondaryIndexRangeOutput streamSecondaryIndexRange(StreamSecondaryIndexRangeInput input) {
        return streamSecondaryIndexRange(input, null);
    }

    /**
     * Deprecated legacy secondary index API but still served on openriak-3.4. Prefer the Query API.
     *
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    StreamSecondaryIndexRangeOutput streamSecondaryIndexRange(StreamSecondaryIndexRangeInput input, RequestOverrideConfig overrideConfig);

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotFoundError
     * @throws ConflictError
     * @throws MovedPermanentlyError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default UpdateDatatypeOutput updateDatatype(UpdateDatatypeInput input) {
        return updateDatatype(input, null);
    }

    /**
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotFoundError
     * @throws ConflictError
     * @throws MovedPermanentlyError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    UpdateDatatypeOutput updateDatatype(UpdateDatatypeInput input, RequestOverrideConfig overrideConfig);

    /**
     * Legacy counter API on default-bucket paths. Deprecated in docs but still served on openriak-3.4.
     *
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotFoundError
     * @throws ConflictError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    default UpdateLegacyCounterOutput updateLegacyCounter(UpdateLegacyCounterInput input) {
        return updateLegacyCounter(input, null);
    }

    /**
     * Legacy counter API on default-bucket paths. Deprecated in docs but still served on openriak-3.4.
     *
     * @throws BadRequestError
     * @throws UnauthorizedError
     * @throws ForbiddenError
     * @throws NotFoundError
     * @throws ConflictError
     * @throws TimeoutError
     * @throws UpgradeRequiredError
     * @throws InternalServerError
     */
    UpdateLegacyCounterOutput updateLegacyCounter(UpdateLegacyCounterInput input, RequestOverrideConfig overrideConfig);

    /**
     * @return Configuration in use by client.
     */
    ClientConfig config();

    /**
     * Create a Builder for {@link OpenRiakClient}.
     */
    static Builder builder() {
        return new Builder();
    }

    /**
     * Create a {@link RequestOverrideConfig} builder for this client.
     */
    static RequestOverrideBuilder requestOverrideBuilder() {
        return new RequestOverrideBuilder();
    }

    /**
     * Builder for {@link OpenRiakClient}.
     */
    final class Builder extends Client.Builder<OpenRiakClient, Builder> {

        private static final HttpBasicAuthTrait httpBasicAuthScheme = new HttpBasicAuthTrait();
        private static final AuthSchemeFactory<HttpBasicAuthTrait> httpBasicAuthSchemeFactory = new HttpBasicAuthAuthScheme.Factory();

        private Builder() {
            configBuilder()
                .putSupportedAuthSchemes(httpBasicAuthSchemeFactory.createAuthScheme(httpBasicAuthScheme))
                .service(OpenRiakApiService.instance());
        }

        @Override
        public OpenRiakClient build() {
            if (configBuilder().transport() == null) {
                configBuilder().transport(new JavaHttpClientTransport.Factory().createTransport(Document.EMPTY_MAP, Document.EMPTY_MAP));
            }

            return new OpenRiakClientImpl(this);
        }
    }

    /**
     * Builder used to create a {@link RequestOverrideConfig} for {@link OpenRiakClient} operations.
     */
    final class RequestOverrideBuilder extends RequestOverrideConfig.OverrideBuilder<RequestOverrideBuilder> {}
}
