package openriak.v3_4.api.client;

import java.util.concurrent.CompletionException;
import openriak.v3_4.api.model.CreateDatatype;
import openriak.v3_4.api.model.CreateDatatypeInput;
import openriak.v3_4.api.model.CreateDatatypeOutput;
import openriak.v3_4.api.model.CreateDefaultObject;
import openriak.v3_4.api.model.CreateDefaultObjectOperationInput;
import openriak.v3_4.api.model.CreateDefaultObjectOutput;
import openriak.v3_4.api.model.CreateDefaultObjectReturnBody;
import openriak.v3_4.api.model.CreateDefaultObjectReturnBodyInput;
import openriak.v3_4.api.model.CreateDefaultObjectReturnBodyOutput;
import openriak.v3_4.api.model.CreateObject;
import openriak.v3_4.api.model.CreateObjectOperationInput;
import openriak.v3_4.api.model.CreateObjectOperationOutput;
import openriak.v3_4.api.model.CreateObjectReturnBody;
import openriak.v3_4.api.model.CreateObjectReturnBodyInput;
import openriak.v3_4.api.model.CreateObjectReturnBodyOperationOutput;
import openriak.v3_4.api.model.DeleteDefaultObject;
import openriak.v3_4.api.model.DeleteDefaultObjectOperationInput;
import openriak.v3_4.api.model.DeleteDefaultObjectOutput;
import openriak.v3_4.api.model.DeleteLegacyObject;
import openriak.v3_4.api.model.DeleteLegacyObjectInput;
import openriak.v3_4.api.model.DeleteLegacyObjectOutput;
import openriak.v3_4.api.model.DeleteObject;
import openriak.v3_4.api.model.DeleteObjectInput;
import openriak.v3_4.api.model.DeleteObjectOutput;
import openriak.v3_4.api.model.GetBucketProperties;
import openriak.v3_4.api.model.GetBucketPropertiesInput;
import openriak.v3_4.api.model.GetBucketPropertiesOutput;
import openriak.v3_4.api.model.GetBucketQueryResults;
import openriak.v3_4.api.model.GetBucketQueryResultsInput;
import openriak.v3_4.api.model.GetBucketQueryResultsOutput;
import openriak.v3_4.api.model.GetBucketTypeProperties;
import openriak.v3_4.api.model.GetBucketTypePropertiesInput;
import openriak.v3_4.api.model.GetBucketTypePropertiesOutput;
import openriak.v3_4.api.model.GetDatatype;
import openriak.v3_4.api.model.GetDatatypeInput;
import openriak.v3_4.api.model.GetDatatypeOutput;
import openriak.v3_4.api.model.GetDefaultBucketProperties;
import openriak.v3_4.api.model.GetDefaultBucketPropertiesInput;
import openriak.v3_4.api.model.GetDefaultBucketPropertiesOutput;
import openriak.v3_4.api.model.GetDefaultBucketQueryResults;
import openriak.v3_4.api.model.GetDefaultBucketQueryResultsInput;
import openriak.v3_4.api.model.GetDefaultBucketQueryResultsOutput;
import openriak.v3_4.api.model.GetDefaultEraseKeys;
import openriak.v3_4.api.model.GetDefaultEraseKeysInput;
import openriak.v3_4.api.model.GetDefaultEraseKeysOutput;
import openriak.v3_4.api.model.GetDefaultFetchClocksRange;
import openriak.v3_4.api.model.GetDefaultFetchClocksRangeInput;
import openriak.v3_4.api.model.GetDefaultFetchClocksRangeOutput;
import openriak.v3_4.api.model.GetDefaultFindKeysByObjectSize;
import openriak.v3_4.api.model.GetDefaultFindKeysByObjectSizeInput;
import openriak.v3_4.api.model.GetDefaultFindKeysByObjectSizeOutput;
import openriak.v3_4.api.model.GetDefaultFindKeysBySiblingCount;
import openriak.v3_4.api.model.GetDefaultFindKeysBySiblingCountInput;
import openriak.v3_4.api.model.GetDefaultFindKeysBySiblingCountOutput;
import openriak.v3_4.api.model.GetDefaultFindTombs;
import openriak.v3_4.api.model.GetDefaultFindTombsInput;
import openriak.v3_4.api.model.GetDefaultFindTombsOutput;
import openriak.v3_4.api.model.GetDefaultMergeTreeRange;
import openriak.v3_4.api.model.GetDefaultMergeTreeRangeInput;
import openriak.v3_4.api.model.GetDefaultMergeTreeRangeOutput;
import openriak.v3_4.api.model.GetDefaultObject;
import openriak.v3_4.api.model.GetDefaultObjectOperationInput;
import openriak.v3_4.api.model.GetDefaultObjectOutput;
import openriak.v3_4.api.model.GetDefaultObjectStats;
import openriak.v3_4.api.model.GetDefaultObjectStatsInput;
import openriak.v3_4.api.model.GetDefaultObjectStatsOutput;
import openriak.v3_4.api.model.GetDefaultReapTombs;
import openriak.v3_4.api.model.GetDefaultReapTombsInput;
import openriak.v3_4.api.model.GetDefaultReapTombsOutput;
import openriak.v3_4.api.model.GetDefaultRepairKeysRange;
import openriak.v3_4.api.model.GetDefaultRepairKeysRangeInput;
import openriak.v3_4.api.model.GetDefaultRepairKeysRangeOutput;
import openriak.v3_4.api.model.GetDefaultReplKeysRange;
import openriak.v3_4.api.model.GetDefaultReplKeysRangeInput;
import openriak.v3_4.api.model.GetDefaultReplKeysRangeOutput;
import openriak.v3_4.api.model.GetEraseKeys;
import openriak.v3_4.api.model.GetEraseKeysInput;
import openriak.v3_4.api.model.GetEraseKeysOutput;
import openriak.v3_4.api.model.GetFetchClocksNval;
import openriak.v3_4.api.model.GetFetchClocksNvalInput;
import openriak.v3_4.api.model.GetFetchClocksNvalOutput;
import openriak.v3_4.api.model.GetFetchClocksRange;
import openriak.v3_4.api.model.GetFetchClocksRangeInput;
import openriak.v3_4.api.model.GetFetchClocksRangeOutput;
import openriak.v3_4.api.model.GetFindKeysByObjectSize;
import openriak.v3_4.api.model.GetFindKeysByObjectSizeInput;
import openriak.v3_4.api.model.GetFindKeysByObjectSizeOutput;
import openriak.v3_4.api.model.GetFindKeysBySiblingCount;
import openriak.v3_4.api.model.GetFindKeysBySiblingCountInput;
import openriak.v3_4.api.model.GetFindKeysBySiblingCountOutput;
import openriak.v3_4.api.model.GetFindTombs;
import openriak.v3_4.api.model.GetFindTombsInput;
import openriak.v3_4.api.model.GetFindTombsOutput;
import openriak.v3_4.api.model.GetLegacyCounter;
import openriak.v3_4.api.model.GetLegacyCounterInput;
import openriak.v3_4.api.model.GetLegacyCounterOutput;
import openriak.v3_4.api.model.GetLegacyObject;
import openriak.v3_4.api.model.GetLegacyObjectInput;
import openriak.v3_4.api.model.GetLegacyObjectOutput;
import openriak.v3_4.api.model.GetMapReduceUsage;
import openriak.v3_4.api.model.GetMapReduceUsageInput;
import openriak.v3_4.api.model.GetMapReduceUsageOutput;
import openriak.v3_4.api.model.GetMembership;
import openriak.v3_4.api.model.GetMembershipInput;
import openriak.v3_4.api.model.GetMembershipOutput;
import openriak.v3_4.api.model.GetMergeBranchNval;
import openriak.v3_4.api.model.GetMergeBranchNvalInput;
import openriak.v3_4.api.model.GetMergeBranchNvalOutput;
import openriak.v3_4.api.model.GetMergeRootNval;
import openriak.v3_4.api.model.GetMergeRootNvalInput;
import openriak.v3_4.api.model.GetMergeRootNvalOutput;
import openriak.v3_4.api.model.GetMergeTreeRange;
import openriak.v3_4.api.model.GetMergeTreeRangeInput;
import openriak.v3_4.api.model.GetMergeTreeRangeOutput;
import openriak.v3_4.api.model.GetObject;
import openriak.v3_4.api.model.GetObjectInput;
import openriak.v3_4.api.model.GetObjectOutput;
import openriak.v3_4.api.model.GetObjectStats;
import openriak.v3_4.api.model.GetObjectStatsInput;
import openriak.v3_4.api.model.GetObjectStatsOutput;
import openriak.v3_4.api.model.GetQueueItem;
import openriak.v3_4.api.model.GetQueueItemInput;
import openriak.v3_4.api.model.GetQueueItemOutput;
import openriak.v3_4.api.model.GetReapTombs;
import openriak.v3_4.api.model.GetReapTombsInput;
import openriak.v3_4.api.model.GetReapTombsOutput;
import openriak.v3_4.api.model.GetRepairKeysRange;
import openriak.v3_4.api.model.GetRepairKeysRangeInput;
import openriak.v3_4.api.model.GetRepairKeysRangeOutput;
import openriak.v3_4.api.model.GetReplKeysRange;
import openriak.v3_4.api.model.GetReplKeysRangeInput;
import openriak.v3_4.api.model.GetReplKeysRangeOutput;
import openriak.v3_4.api.model.GetRoot;
import openriak.v3_4.api.model.GetRootInput;
import openriak.v3_4.api.model.GetRootOutput;
import openriak.v3_4.api.model.GetStats;
import openriak.v3_4.api.model.GetStatsInput;
import openriak.v3_4.api.model.GetStatsOutput;
import openriak.v3_4.api.model.HeadDefaultObject;
import openriak.v3_4.api.model.HeadDefaultObjectOperationInput;
import openriak.v3_4.api.model.HeadDefaultObjectOutput;
import openriak.v3_4.api.model.HeadLegacyObject;
import openriak.v3_4.api.model.HeadLegacyObjectInput;
import openriak.v3_4.api.model.HeadLegacyObjectOutput;
import openriak.v3_4.api.model.HeadMapReduce;
import openriak.v3_4.api.model.HeadMapReduceInput;
import openriak.v3_4.api.model.HeadMapReduceOutput;
import openriak.v3_4.api.model.HeadObject;
import openriak.v3_4.api.model.HeadObjectInput;
import openriak.v3_4.api.model.HeadObjectOperationOutput;
import openriak.v3_4.api.model.HeadStats;
import openriak.v3_4.api.model.HeadStatsInput;
import openriak.v3_4.api.model.HeadStatsOutput;
import openriak.v3_4.api.model.LinkWalk;
import openriak.v3_4.api.model.LinkWalkDefault;
import openriak.v3_4.api.model.LinkWalkDefaultOperationInput;
import openriak.v3_4.api.model.LinkWalkDefaultOutput;
import openriak.v3_4.api.model.LinkWalkInput;
import openriak.v3_4.api.model.LinkWalkLegacy;
import openriak.v3_4.api.model.LinkWalkLegacyInput;
import openriak.v3_4.api.model.LinkWalkLegacyOutput;
import openriak.v3_4.api.model.LinkWalkOutput;
import openriak.v3_4.api.model.ListAaeBuckets;
import openriak.v3_4.api.model.ListAaeBucketsInput;
import openriak.v3_4.api.model.ListAaeBucketsOutput;
import openriak.v3_4.api.model.ListBuckets;
import openriak.v3_4.api.model.ListBucketsOperationInput;
import openriak.v3_4.api.model.ListBucketsOutput;
import openriak.v3_4.api.model.ListDefaultBuckets;
import openriak.v3_4.api.model.ListDefaultBucketsInput;
import openriak.v3_4.api.model.ListDefaultBucketsOutput;
import openriak.v3_4.api.model.ListDefaultKeys;
import openriak.v3_4.api.model.ListDefaultKeysOperationInput;
import openriak.v3_4.api.model.ListDefaultKeysOutput;
import openriak.v3_4.api.model.ListKeys;
import openriak.v3_4.api.model.ListKeysOperationInput;
import openriak.v3_4.api.model.ListKeysOutput;
import openriak.v3_4.api.model.MapReduce;
import openriak.v3_4.api.model.MapReduceChunked;
import openriak.v3_4.api.model.MapReduceChunkedInput;
import openriak.v3_4.api.model.MapReduceChunkedOutput;
import openriak.v3_4.api.model.MapReduceOperationInput;
import openriak.v3_4.api.model.MapReduceOutput;
import openriak.v3_4.api.model.Ping;
import openriak.v3_4.api.model.PingInput;
import openriak.v3_4.api.model.PingOutput;
import openriak.v3_4.api.model.PostDefaultObject;
import openriak.v3_4.api.model.PostDefaultObjectInput;
import openriak.v3_4.api.model.PostDefaultObjectOutput;
import openriak.v3_4.api.model.PostDefaultObjectReturnBody;
import openriak.v3_4.api.model.PostDefaultObjectReturnBodyInput;
import openriak.v3_4.api.model.PostDefaultObjectReturnBodyOutput;
import openriak.v3_4.api.model.PostLegacyObject;
import openriak.v3_4.api.model.PostLegacyObjectInput;
import openriak.v3_4.api.model.PostLegacyObjectOutput;
import openriak.v3_4.api.model.PostLegacyObjectReturnBody;
import openriak.v3_4.api.model.PostLegacyObjectReturnBodyInput;
import openriak.v3_4.api.model.PostLegacyObjectReturnBodyOutput;
import openriak.v3_4.api.model.PostObject;
import openriak.v3_4.api.model.PostObjectInput;
import openriak.v3_4.api.model.PostObjectOutput;
import openriak.v3_4.api.model.PostObjectReturnBody;
import openriak.v3_4.api.model.PostObjectReturnBodyInput;
import openriak.v3_4.api.model.PostObjectReturnBodyOutput;
import openriak.v3_4.api.model.PushQueueItems;
import openriak.v3_4.api.model.PushQueueItemsInput;
import openriak.v3_4.api.model.PushQueueItemsOutput;
import openriak.v3_4.api.model.PutDefaultObject;
import openriak.v3_4.api.model.PutDefaultObjectOperationInput;
import openriak.v3_4.api.model.PutDefaultObjectOutput;
import openriak.v3_4.api.model.PutDefaultObjectReturnBody;
import openriak.v3_4.api.model.PutDefaultObjectReturnBodyInput;
import openriak.v3_4.api.model.PutDefaultObjectReturnBodyOutput;
import openriak.v3_4.api.model.PutLegacyObject;
import openriak.v3_4.api.model.PutLegacyObjectInput;
import openriak.v3_4.api.model.PutLegacyObjectOutput;
import openriak.v3_4.api.model.PutLegacyObjectReturnBody;
import openriak.v3_4.api.model.PutLegacyObjectReturnBodyInput;
import openriak.v3_4.api.model.PutLegacyObjectReturnBodyOutput;
import openriak.v3_4.api.model.PutObject;
import openriak.v3_4.api.model.PutObjectOperationInput;
import openriak.v3_4.api.model.PutObjectOutput;
import openriak.v3_4.api.model.PutObjectReturnBody;
import openriak.v3_4.api.model.PutObjectReturnBodyInput;
import openriak.v3_4.api.model.PutObjectReturnBodyOutput;
import openriak.v3_4.api.model.QueryDefaultSecondaryIndex;
import openriak.v3_4.api.model.QueryDefaultSecondaryIndexInput;
import openriak.v3_4.api.model.QueryDefaultSecondaryIndexOutput;
import openriak.v3_4.api.model.QueryDefaultSecondaryIndexRange;
import openriak.v3_4.api.model.QueryDefaultSecondaryIndexRangeInput;
import openriak.v3_4.api.model.QueryDefaultSecondaryIndexRangeOutput;
import openriak.v3_4.api.model.QuerySecondaryIndex;
import openriak.v3_4.api.model.QuerySecondaryIndexInput;
import openriak.v3_4.api.model.QuerySecondaryIndexOutput;
import openriak.v3_4.api.model.QuerySecondaryIndexRange;
import openriak.v3_4.api.model.QuerySecondaryIndexRangeInput;
import openriak.v3_4.api.model.QuerySecondaryIndexRangeOutput;
import openriak.v3_4.api.model.ResetBucketProperties;
import openriak.v3_4.api.model.ResetBucketPropertiesInput;
import openriak.v3_4.api.model.ResetBucketPropertiesOutput;
import openriak.v3_4.api.model.ResetDefaultBucketProperties;
import openriak.v3_4.api.model.ResetDefaultBucketPropertiesInput;
import openriak.v3_4.api.model.ResetDefaultBucketPropertiesOutput;
import openriak.v3_4.api.model.RunBucketQuery;
import openriak.v3_4.api.model.RunBucketQueryInput;
import openriak.v3_4.api.model.RunBucketQueryOutput;
import openriak.v3_4.api.model.RunDefaultBucketQuery;
import openriak.v3_4.api.model.RunDefaultBucketQueryInput;
import openriak.v3_4.api.model.RunDefaultBucketQueryOutput;
import openriak.v3_4.api.model.SetBucketProperties;
import openriak.v3_4.api.model.SetBucketPropertiesInput;
import openriak.v3_4.api.model.SetBucketPropertiesOutput;
import openriak.v3_4.api.model.SetBucketTypeProperties;
import openriak.v3_4.api.model.SetBucketTypePropertiesInput;
import openriak.v3_4.api.model.SetBucketTypePropertiesOutput;
import openriak.v3_4.api.model.SetDefaultBucketProperties;
import openriak.v3_4.api.model.SetDefaultBucketPropertiesInput;
import openriak.v3_4.api.model.SetDefaultBucketPropertiesOutput;
import openriak.v3_4.api.model.StreamBuckets;
import openriak.v3_4.api.model.StreamBucketsInput;
import openriak.v3_4.api.model.StreamBucketsOutput;
import openriak.v3_4.api.model.StreamDefaultBuckets;
import openriak.v3_4.api.model.StreamDefaultBucketsInput;
import openriak.v3_4.api.model.StreamDefaultBucketsOutput;
import openriak.v3_4.api.model.StreamDefaultKeys;
import openriak.v3_4.api.model.StreamDefaultKeysInput;
import openriak.v3_4.api.model.StreamDefaultKeysOutput;
import openriak.v3_4.api.model.StreamDefaultSecondaryIndex;
import openriak.v3_4.api.model.StreamDefaultSecondaryIndexInput;
import openriak.v3_4.api.model.StreamDefaultSecondaryIndexOutput;
import openriak.v3_4.api.model.StreamDefaultSecondaryIndexRange;
import openriak.v3_4.api.model.StreamDefaultSecondaryIndexRangeInput;
import openriak.v3_4.api.model.StreamDefaultSecondaryIndexRangeOutput;
import openriak.v3_4.api.model.StreamKeys;
import openriak.v3_4.api.model.StreamKeysInput;
import openriak.v3_4.api.model.StreamKeysOutput;
import openriak.v3_4.api.model.StreamSecondaryIndex;
import openriak.v3_4.api.model.StreamSecondaryIndexInput;
import openriak.v3_4.api.model.StreamSecondaryIndexOutput;
import openriak.v3_4.api.model.StreamSecondaryIndexRange;
import openriak.v3_4.api.model.StreamSecondaryIndexRangeInput;
import openriak.v3_4.api.model.StreamSecondaryIndexRangeOutput;
import openriak.v3_4.api.model.UpdateDatatype;
import openriak.v3_4.api.model.UpdateDatatypeInput;
import openriak.v3_4.api.model.UpdateDatatypeOutput;
import openriak.v3_4.api.model.UpdateLegacyCounter;
import openriak.v3_4.api.model.UpdateLegacyCounterInput;
import openriak.v3_4.api.model.UpdateLegacyCounterOutput;
import software.amazon.smithy.java.client.core.Client;
import software.amazon.smithy.java.client.core.RequestOverrideConfig;
import software.amazon.smithy.java.core.serde.TypeRegistry;
import software.amazon.smithy.java.framework.model.AccessDeniedException;
import software.amazon.smithy.java.framework.model.InternalFailureException;
import software.amazon.smithy.java.framework.model.MalformedRequestException;
import software.amazon.smithy.java.framework.model.NotAuthorizedException;
import software.amazon.smithy.java.framework.model.ThrottlingException;
import software.amazon.smithy.java.framework.model.UnknownOperationException;
import software.amazon.smithy.java.framework.model.ValidationException;
import software.amazon.smithy.utils.SmithyGenerated;

@SmithyGenerated
final class OpenRiakClientImpl extends Client implements OpenRiakClient {
    private static final TypeRegistry TYPE_REGISTRY = TypeRegistry.builder()
        .putType(AccessDeniedException.$ID, AccessDeniedException.class, AccessDeniedException::builder)
        .putType(InternalFailureException.$ID, InternalFailureException.class, InternalFailureException::builder)
        .putType(MalformedRequestException.$ID, MalformedRequestException.class, MalformedRequestException::builder)
        .putType(NotAuthorizedException.$ID, NotAuthorizedException.class, NotAuthorizedException::builder)
        .putType(ThrottlingException.$ID, ThrottlingException.class, ThrottlingException::builder)
        .putType(UnknownOperationException.$ID, UnknownOperationException.class, UnknownOperationException::builder)
        .putType(ValidationException.$ID, ValidationException.class, ValidationException::builder)
        .build();

    OpenRiakClientImpl(OpenRiakClient.Builder builder) {
        super(builder);
    }

    @Override
    public CreateDatatypeOutput createDatatype(CreateDatatypeInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, CreateDatatype.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public CreateDefaultObjectOutput createDefaultObject(CreateDefaultObjectOperationInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, CreateDefaultObject.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public CreateDefaultObjectReturnBodyOutput createDefaultObjectReturnBody(CreateDefaultObjectReturnBodyInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, CreateDefaultObjectReturnBody.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public CreateObjectOperationOutput createObject(CreateObjectOperationInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, CreateObject.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public CreateObjectReturnBodyOperationOutput createObjectReturnBody(CreateObjectReturnBodyInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, CreateObjectReturnBody.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public DeleteDefaultObjectOutput deleteDefaultObject(DeleteDefaultObjectOperationInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, DeleteDefaultObject.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public DeleteLegacyObjectOutput deleteLegacyObject(DeleteLegacyObjectInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, DeleteLegacyObject.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public DeleteObjectOutput deleteObject(DeleteObjectInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, DeleteObject.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public GetBucketPropertiesOutput getBucketProperties(GetBucketPropertiesInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, GetBucketProperties.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public GetBucketQueryResultsOutput getBucketQueryResults(GetBucketQueryResultsInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, GetBucketQueryResults.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public GetBucketTypePropertiesOutput getBucketTypeProperties(GetBucketTypePropertiesInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, GetBucketTypeProperties.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public GetDatatypeOutput getDatatype(GetDatatypeInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, GetDatatype.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public GetDefaultBucketPropertiesOutput getDefaultBucketProperties(GetDefaultBucketPropertiesInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, GetDefaultBucketProperties.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public GetDefaultBucketQueryResultsOutput getDefaultBucketQueryResults(GetDefaultBucketQueryResultsInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, GetDefaultBucketQueryResults.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public GetDefaultEraseKeysOutput getDefaultEraseKeys(GetDefaultEraseKeysInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, GetDefaultEraseKeys.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public GetDefaultFetchClocksRangeOutput getDefaultFetchClocksRange(GetDefaultFetchClocksRangeInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, GetDefaultFetchClocksRange.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public GetDefaultFindKeysByObjectSizeOutput getDefaultFindKeysByObjectSize(GetDefaultFindKeysByObjectSizeInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, GetDefaultFindKeysByObjectSize.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public GetDefaultFindKeysBySiblingCountOutput getDefaultFindKeysBySiblingCount(GetDefaultFindKeysBySiblingCountInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, GetDefaultFindKeysBySiblingCount.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public GetDefaultFindTombsOutput getDefaultFindTombs(GetDefaultFindTombsInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, GetDefaultFindTombs.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public GetDefaultMergeTreeRangeOutput getDefaultMergeTreeRange(GetDefaultMergeTreeRangeInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, GetDefaultMergeTreeRange.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public GetDefaultObjectOutput getDefaultObject(GetDefaultObjectOperationInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, GetDefaultObject.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public GetDefaultObjectStatsOutput getDefaultObjectStats(GetDefaultObjectStatsInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, GetDefaultObjectStats.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public GetDefaultReapTombsOutput getDefaultReapTombs(GetDefaultReapTombsInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, GetDefaultReapTombs.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public GetDefaultRepairKeysRangeOutput getDefaultRepairKeysRange(GetDefaultRepairKeysRangeInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, GetDefaultRepairKeysRange.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public GetDefaultReplKeysRangeOutput getDefaultReplKeysRange(GetDefaultReplKeysRangeInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, GetDefaultReplKeysRange.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public GetEraseKeysOutput getEraseKeys(GetEraseKeysInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, GetEraseKeys.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public GetFetchClocksNvalOutput getFetchClocksNval(GetFetchClocksNvalInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, GetFetchClocksNval.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public GetFetchClocksRangeOutput getFetchClocksRange(GetFetchClocksRangeInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, GetFetchClocksRange.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public GetFindKeysByObjectSizeOutput getFindKeysByObjectSize(GetFindKeysByObjectSizeInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, GetFindKeysByObjectSize.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public GetFindKeysBySiblingCountOutput getFindKeysBySiblingCount(GetFindKeysBySiblingCountInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, GetFindKeysBySiblingCount.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public GetFindTombsOutput getFindTombs(GetFindTombsInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, GetFindTombs.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public GetLegacyCounterOutput getLegacyCounter(GetLegacyCounterInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, GetLegacyCounter.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public GetLegacyObjectOutput getLegacyObject(GetLegacyObjectInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, GetLegacyObject.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public GetMapReduceUsageOutput getMapReduceUsage(GetMapReduceUsageInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, GetMapReduceUsage.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public GetMembershipOutput getMembership(GetMembershipInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, GetMembership.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public GetMergeBranchNvalOutput getMergeBranchNval(GetMergeBranchNvalInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, GetMergeBranchNval.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public GetMergeRootNvalOutput getMergeRootNval(GetMergeRootNvalInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, GetMergeRootNval.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public GetMergeTreeRangeOutput getMergeTreeRange(GetMergeTreeRangeInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, GetMergeTreeRange.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public GetObjectOutput getObject(GetObjectInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, GetObject.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public GetObjectStatsOutput getObjectStats(GetObjectStatsInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, GetObjectStats.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public GetQueueItemOutput getQueueItem(GetQueueItemInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, GetQueueItem.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public GetReapTombsOutput getReapTombs(GetReapTombsInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, GetReapTombs.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public GetRepairKeysRangeOutput getRepairKeysRange(GetRepairKeysRangeInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, GetRepairKeysRange.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public GetReplKeysRangeOutput getReplKeysRange(GetReplKeysRangeInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, GetReplKeysRange.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public GetRootOutput getRoot(GetRootInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, GetRoot.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public GetStatsOutput getStats(GetStatsInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, GetStats.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public HeadDefaultObjectOutput headDefaultObject(HeadDefaultObjectOperationInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, HeadDefaultObject.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public HeadLegacyObjectOutput headLegacyObject(HeadLegacyObjectInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, HeadLegacyObject.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public HeadMapReduceOutput headMapReduce(HeadMapReduceInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, HeadMapReduce.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public HeadObjectOperationOutput headObject(HeadObjectInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, HeadObject.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public HeadStatsOutput headStats(HeadStatsInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, HeadStats.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public LinkWalkOutput linkWalk(LinkWalkInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, LinkWalk.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public LinkWalkDefaultOutput linkWalkDefault(LinkWalkDefaultOperationInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, LinkWalkDefault.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public LinkWalkLegacyOutput linkWalkLegacy(LinkWalkLegacyInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, LinkWalkLegacy.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public ListAaeBucketsOutput listAaeBuckets(ListAaeBucketsInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, ListAaeBuckets.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public ListBucketsOutput listBuckets(ListBucketsOperationInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, ListBuckets.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public ListDefaultBucketsOutput listDefaultBuckets(ListDefaultBucketsInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, ListDefaultBuckets.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public ListDefaultKeysOutput listDefaultKeys(ListDefaultKeysOperationInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, ListDefaultKeys.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public ListKeysOutput listKeys(ListKeysOperationInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, ListKeys.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public MapReduceOutput mapReduce(MapReduceOperationInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, MapReduce.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public MapReduceChunkedOutput mapReduceChunked(MapReduceChunkedInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, MapReduceChunked.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public PingOutput ping(PingInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, Ping.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public PostDefaultObjectOutput postDefaultObject(PostDefaultObjectInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, PostDefaultObject.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public PostDefaultObjectReturnBodyOutput postDefaultObjectReturnBody(PostDefaultObjectReturnBodyInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, PostDefaultObjectReturnBody.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public PostLegacyObjectOutput postLegacyObject(PostLegacyObjectInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, PostLegacyObject.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public PostLegacyObjectReturnBodyOutput postLegacyObjectReturnBody(PostLegacyObjectReturnBodyInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, PostLegacyObjectReturnBody.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public PostObjectOutput postObject(PostObjectInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, PostObject.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public PostObjectReturnBodyOutput postObjectReturnBody(PostObjectReturnBodyInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, PostObjectReturnBody.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public PushQueueItemsOutput pushQueueItems(PushQueueItemsInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, PushQueueItems.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public PutDefaultObjectOutput putDefaultObject(PutDefaultObjectOperationInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, PutDefaultObject.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public PutDefaultObjectReturnBodyOutput putDefaultObjectReturnBody(PutDefaultObjectReturnBodyInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, PutDefaultObjectReturnBody.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public PutLegacyObjectOutput putLegacyObject(PutLegacyObjectInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, PutLegacyObject.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public PutLegacyObjectReturnBodyOutput putLegacyObjectReturnBody(PutLegacyObjectReturnBodyInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, PutLegacyObjectReturnBody.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public PutObjectOutput putObject(PutObjectOperationInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, PutObject.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public PutObjectReturnBodyOutput putObjectReturnBody(PutObjectReturnBodyInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, PutObjectReturnBody.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public QueryDefaultSecondaryIndexOutput queryDefaultSecondaryIndex(QueryDefaultSecondaryIndexInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, QueryDefaultSecondaryIndex.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public QueryDefaultSecondaryIndexRangeOutput queryDefaultSecondaryIndexRange(QueryDefaultSecondaryIndexRangeInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, QueryDefaultSecondaryIndexRange.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public QuerySecondaryIndexOutput querySecondaryIndex(QuerySecondaryIndexInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, QuerySecondaryIndex.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public QuerySecondaryIndexRangeOutput querySecondaryIndexRange(QuerySecondaryIndexRangeInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, QuerySecondaryIndexRange.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public ResetBucketPropertiesOutput resetBucketProperties(ResetBucketPropertiesInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, ResetBucketProperties.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public ResetDefaultBucketPropertiesOutput resetDefaultBucketProperties(ResetDefaultBucketPropertiesInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, ResetDefaultBucketProperties.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public RunBucketQueryOutput runBucketQuery(RunBucketQueryInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, RunBucketQuery.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public RunDefaultBucketQueryOutput runDefaultBucketQuery(RunDefaultBucketQueryInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, RunDefaultBucketQuery.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public SetBucketPropertiesOutput setBucketProperties(SetBucketPropertiesInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, SetBucketProperties.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public SetBucketTypePropertiesOutput setBucketTypeProperties(SetBucketTypePropertiesInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, SetBucketTypeProperties.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public SetDefaultBucketPropertiesOutput setDefaultBucketProperties(SetDefaultBucketPropertiesInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, SetDefaultBucketProperties.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public StreamBucketsOutput streamBuckets(StreamBucketsInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, StreamBuckets.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public StreamDefaultBucketsOutput streamDefaultBuckets(StreamDefaultBucketsInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, StreamDefaultBuckets.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public StreamDefaultKeysOutput streamDefaultKeys(StreamDefaultKeysInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, StreamDefaultKeys.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public StreamDefaultSecondaryIndexOutput streamDefaultSecondaryIndex(StreamDefaultSecondaryIndexInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, StreamDefaultSecondaryIndex.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public StreamDefaultSecondaryIndexRangeOutput streamDefaultSecondaryIndexRange(StreamDefaultSecondaryIndexRangeInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, StreamDefaultSecondaryIndexRange.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public StreamKeysOutput streamKeys(StreamKeysInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, StreamKeys.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public StreamSecondaryIndexOutput streamSecondaryIndex(StreamSecondaryIndexInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, StreamSecondaryIndex.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public StreamSecondaryIndexRangeOutput streamSecondaryIndexRange(StreamSecondaryIndexRangeInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, StreamSecondaryIndexRange.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public UpdateDatatypeOutput updateDatatype(UpdateDatatypeInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, UpdateDatatype.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    public UpdateLegacyCounterOutput updateLegacyCounter(UpdateLegacyCounterInput input, RequestOverrideConfig overrideConfig) {
        try {
            return call(input, UpdateLegacyCounter.instance(), overrideConfig);
        } catch (CompletionException e) {
            throw unwrapAndThrow(e);
        }
    }

    @Override
    protected TypeRegistry typeRegistry() {
        return TYPE_REGISTRY;
    }
}
