defmodule OpenRiakTypes do
  @moduledoc """
  OpenRiak HTTP API for openriak-3.4. Routes and payloads are modeled with standard Smithy HTTP binding traits only (@http, @httpLabel, @httpQuery, @httpHeader, @httpPrefixHeaders, @httpPayload, @httpResponseCode, @httpError). There is no custom protocol trait and no stock restJson1-style envelope; clients must implement Riak wire details (x-riak- prefix headers, opaque object bodies, multipart siblings, quorum query strings) in application or custom runtime code.

  When Riak security is enabled, call the API over HTTPS with HTTP Basic credentials (@httpBasicAuth). Missing or invalid credentials yield 401 with a WWW-Authenticate challenge (Basic realm="Riak"). Credentials sent over plain HTTP may yield 426 Upgrade Required.
  """

  # Streaming payload; framing deferred to protocol layer.
  @type byte_stream :: binary()
  @type header_value :: String.t()
  @type media_type :: String.t()
  @type non_empty_string :: String.t()
  @type quorum :: String.t()
  @type uri_safe_identifier :: String.t()
  @type v_clock :: String.t()
  @type v_tag :: String.t()
  @type http_date :: DateTime.t()
  @type json_document :: any()
  @type query_list :: [OpenRiakTypes.QuerySpec.t()]
  @type riak_headers :: %{String.t() => OpenRiakTypes.header_value()}
  # Error shape: openriak.v3_4.api#BadRequestError (client)
  defmodule BadRequestError do
    @moduledoc "Error from openriak.v3_4.api#BadRequestError (fault: client, retryable: false)."

    defexception message: nil,
                 content_type: nil,
                 riak_headers: nil,
                 __beam_error_kind: :client

    def retryable(%__MODULE__{}), do: :false

    def throttling(%__MODULE__{}), do: :false

    def message(e), do: inspect(e)
  end
  defmodule QuerySpec do
    @moduledoc "structure QuerySpec"

    @type t :: %__MODULE__{
              index_name: String.t(),
              start_term: String.t() | nil,
              end_term: String.t() | nil,
              aggregation_tag: String.t() | nil,
              regular_expression: String.t() | nil,
              evaluation_expression: String.t() | nil,
              filter_expression: String.t() | nil
            }

    defstruct [:index_name, :start_term, :end_term, :aggregation_tag, :regular_expression, :evaluation_expression, :filter_expression]
  end
  defmodule BucketQueryRequest do
    @moduledoc "Query request body. Wire JSON uses snake_case keys: query_list, aggregation_expression, accumulation_option, accumulation_term, inactivity_timeout, max_results."

    @type t :: %__MODULE__{
              query_list: OpenRiakTypes.query_list(),
              aggregation_expression: String.t() | nil,
              accumulation_option: String.t() | nil,
              accumulation_term: String.t() | nil,
              substitutions: any() | nil,
              timeout: integer() | nil,
              inactivity_timeout: integer() | nil,
              max_results: integer() | nil,
              continuation: String.t() | nil
            }

    defstruct [:query_list, :aggregation_expression, :accumulation_option, :accumulation_term, :substitutions, :timeout, :inactivity_timeout, :max_results, :continuation]
  end
  # Error shape: openriak.v3_4.api#ConflictError (client)
  defmodule ConflictError do
    @moduledoc "Error from openriak.v3_4.api#ConflictError (fault: client, retryable: false)."

    defexception message: nil,
                 riak_headers: nil,
                 __beam_error_kind: :client

    def retryable(%__MODULE__{}), do: :false

    def throttling(%__MODULE__{}), do: :false

    def message(e), do: inspect(e)
  end
  defmodule DatatypeUpdatePayload do
    @moduledoc "CRDT mutation payload. Wire shape depends on bucket datatype; counters may also accept a bare integer. Sets, maps, and other types use datatype-specific operation fields documented in OtherAPI."

    @type t :: %__MODULE__{
              increment: integer() | nil,
              decrement: integer() | nil,
              type: String.t() | nil,
              value: any() | nil,
              context: String.t() | nil
            }

    defstruct [:increment, :decrement, :type, :value, :context]
  end
  defmodule CreateDatatypeInput do
    @moduledoc "structure CreateDatatypeInput"

    @type t :: %__MODULE__{
              bucket_type: OpenRiakTypes.uri_safe_identifier() | nil,
              bucket: OpenRiakTypes.uri_safe_identifier() | nil,
              timeout: integer() | nil,
              r: OpenRiakTypes.quorum() | nil,
              pr: OpenRiakTypes.quorum() | nil,
              w: OpenRiakTypes.quorum() | nil,
              pw: OpenRiakTypes.quorum() | nil,
              dw: OpenRiakTypes.quorum() | nil,
              return_body: boolean() | nil,
              include_context: boolean() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              update: OpenRiakTypes.DatatypeUpdatePayload.t() | nil
            }

    defstruct [:bucket_type, :bucket, :timeout, :r, :pr, :w, :pw, :dw, :return_body, :include_context, :content_type, :update]
  end
  defmodule CreateDatatypeOutput do
    @moduledoc "structure CreateDatatypeOutput"

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              location: String.t() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              crdt_context: String.t() | nil,
              body: OpenRiakTypes.json_document() | nil
            }

    defstruct [:status_code, :location, :content_type, :crdt_context, :body]
  end
  # Error shape: openriak.v3_4.api#ForbiddenError (client)
  defmodule ForbiddenError do
    @moduledoc "Error from openriak.v3_4.api#ForbiddenError (fault: client, retryable: false)."

    defexception message: nil,
                 __beam_error_kind: :client

    def retryable(%__MODULE__{}), do: :false

    def throttling(%__MODULE__{}), do: :false

    def message(e), do: inspect(e)
  end
  # Error shape: openriak.v3_4.api#InternalServerError (server)
  defmodule InternalServerError do
    @moduledoc "Error from openriak.v3_4.api#InternalServerError (fault: server, retryable: false)."

    defexception message: nil,
                 __beam_error_kind: :server

    def retryable(%__MODULE__{}), do: :false

    def throttling(%__MODULE__{}), do: :false

    def message(e), do: inspect(e)
  end
  # Error shape: openriak.v3_4.api#MovedPermanentlyError (client)
  defmodule MovedPermanentlyError do
    @moduledoc "Default-bucket CRDT counter requests redirect to the legacy counter route at /buckets/{bucket}/counters/{key}."

    defexception message: nil,
                 location: nil,
                 __beam_error_kind: :client

    def retryable(%__MODULE__{}), do: :false

    def throttling(%__MODULE__{}), do: :false

    def message(e), do: inspect(e)
  end
  # Error shape: openriak.v3_4.api#TimeoutError (server)
  defmodule TimeoutError do
    @moduledoc "Error from openriak.v3_4.api#TimeoutError (fault: server, retryable: false)."

    defexception message: nil,
                 retry_after: nil,
                 riak_headers: nil,
                 __beam_error_kind: :server

    def retryable(%__MODULE__{}), do: :false

    def throttling(%__MODULE__{}), do: :false

    def message(e), do: inspect(e)
  end
  # Error shape: openriak.v3_4.api#UnauthorizedError (client)
  defmodule UnauthorizedError do
    @moduledoc "Returned when Riak security is enabled and credentials are missing or invalid. The response includes a WWW-Authenticate challenge (Basic realm=\"Riak\"); Smithy cannot bind that header on error shapes."

    defexception content_type: nil,
                 message: nil,
                 __beam_error_kind: :client

    def retryable(%__MODULE__{}), do: :false

    def throttling(%__MODULE__{}), do: :false

    def message(e), do: inspect(e)
  end
  # Error shape: openriak.v3_4.api#UpgradeRequiredError (client)
  defmodule UpgradeRequiredError do
    @moduledoc "Returned when Riak security is enabled and a request includes credentials over plain HTTP instead of HTTPS."

    defexception content_type: nil,
                 message: nil,
                 __beam_error_kind: :client

    def retryable(%__MODULE__{}), do: :false

    def throttling(%__MODULE__{}), do: :false

    def message(e), do: inspect(e)
  end
  defmodule SyncOnWrite do
    @moduledoc "String enum. Unknown values are represented as {:unknown, String.t()}."

    @type t :: :one | :all | :backend | {:unknown, String.t()}

    @spec from_string(String.t()) :: t()
    def from_string("one"), do: :one
    def from_string("all"), do: :all
    def from_string("backend"), do: :backend

    def from_string(v) when is_binary(v) do
      normalized = String.replace(v, "_", ".")

      if normalized == v do
        {:unknown, v}
      else
        case from_string(normalized) do
          {:unknown, _} -> {:unknown, v}
          result -> result
        end
      end
    end

    @spec to_string(t()) :: String.t()
    def to_string(:one), do: "one"
    def to_string(:all), do: "all"
    def to_string(:backend), do: "backend"
    def to_string({:unknown, v}), do: v

    @spec values() :: [t()]
    def values, do: [:one, :all, :backend]
  end
  defmodule CreateDefaultObjectOperationInput do
    @moduledoc "Supports x-riak-if-not-modified and standard conditional headers for Riak-native conditional updates."

    @type t :: %__MODULE__{
              bucket: OpenRiakTypes.uri_safe_identifier() | nil,
              timeout: integer() | nil,
              w: OpenRiakTypes.quorum() | nil,
              dw: OpenRiakTypes.quorum() | nil,
              pw: OpenRiakTypes.quorum() | nil,
              node_confirms: integer() | nil,
              sync_on_write: OpenRiakTypes.SyncOnWrite.t() | nil,
              asis: boolean() | nil,
              if_none_match: String.t() | nil,
              if_match: String.t() | nil,
              if_unmodified_since: OpenRiakTypes.http_date() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              content_encoding: String.t() | nil,
              link: String.t() | nil,
              riak_headers: OpenRiakTypes.riak_headers() | nil,
              body: OpenRiakTypes.byte_stream() | nil
            }

    defstruct [:bucket, :timeout, :w, :dw, :pw, :node_confirms, :sync_on_write, :asis, :if_none_match, :if_match, :if_unmodified_since, :content_type, :content_encoding, :link, :riak_headers, :body]
  end
  defmodule CreateDefaultObjectOutput do
    @moduledoc "structure CreateDefaultObjectOutput"

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              location: String.t() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              content_encoding: String.t() | nil,
              etag: String.t() | nil,
              last_modified: OpenRiakTypes.http_date() | nil,
              link: String.t() | nil,
              riak_headers: OpenRiakTypes.riak_headers() | nil
            }

    defstruct [:status_code, :location, :content_type, :content_encoding, :etag, :last_modified, :link, :riak_headers]
  end
  # Error shape: openriak.v3_4.api#NotAcceptableError (client)
  defmodule NotAcceptableError do
    @moduledoc "Error from openriak.v3_4.api#NotAcceptableError (fault: client, retryable: false)."

    defexception message: nil,
                 __beam_error_kind: :client

    def retryable(%__MODULE__{}), do: :false

    def throttling(%__MODULE__{}), do: :false

    def message(e), do: inspect(e)
  end
  # Error shape: openriak.v3_4.api#PreconditionFailedError (client)
  defmodule PreconditionFailedError do
    @moduledoc "Error from openriak.v3_4.api#PreconditionFailedError (fault: client, retryable: false)."

    defexception message: nil,
                 vclock: nil,
                 __beam_error_kind: :client

    def retryable(%__MODULE__{}), do: :false

    def throttling(%__MODULE__{}), do: :false

    def message(e), do: inspect(e)
  end
  defmodule CreateDefaultObjectReturnBodyInput do
    @moduledoc "Supports x-riak-if-not-modified and standard conditional headers for Riak-native conditional updates."

    @type t :: %__MODULE__{
              bucket: OpenRiakTypes.uri_safe_identifier() | nil,
              timeout: integer() | nil,
              w: OpenRiakTypes.quorum() | nil,
              dw: OpenRiakTypes.quorum() | nil,
              pw: OpenRiakTypes.quorum() | nil,
              node_confirms: integer() | nil,
              sync_on_write: OpenRiakTypes.SyncOnWrite.t() | nil,
              asis: boolean() | nil,
              if_none_match: String.t() | nil,
              if_match: String.t() | nil,
              if_unmodified_since: OpenRiakTypes.http_date() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              content_encoding: String.t() | nil,
              link: String.t() | nil,
              riak_headers: OpenRiakTypes.riak_headers() | nil,
              body: OpenRiakTypes.byte_stream() | nil
            }

    defstruct [:bucket, :timeout, :w, :dw, :pw, :node_confirms, :sync_on_write, :asis, :if_none_match, :if_match, :if_unmodified_since, :content_type, :content_encoding, :link, :riak_headers, :body]
  end
  defmodule CreateDefaultObjectReturnBodyOutput do
    @moduledoc "structure CreateDefaultObjectReturnBodyOutput"

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              location: String.t() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              content_encoding: String.t() | nil,
              etag: String.t() | nil,
              last_modified: OpenRiakTypes.http_date() | nil,
              link: String.t() | nil,
              riak_headers: OpenRiakTypes.riak_headers() | nil,
              body: OpenRiakTypes.byte_stream()
            }

    defstruct [:status_code, :location, :content_type, :content_encoding, :etag, :last_modified, :link, :riak_headers, :body]
  end
  defmodule CreateObjectOperationInput do
    @moduledoc "Supports x-riak-if-not-modified and standard conditional headers for Riak-native conditional updates."

    @type t :: %__MODULE__{
              bucket_type: OpenRiakTypes.uri_safe_identifier() | nil,
              bucket: OpenRiakTypes.uri_safe_identifier() | nil,
              timeout: integer() | nil,
              w: OpenRiakTypes.quorum() | nil,
              dw: OpenRiakTypes.quorum() | nil,
              pw: OpenRiakTypes.quorum() | nil,
              node_confirms: integer() | nil,
              sync_on_write: OpenRiakTypes.SyncOnWrite.t() | nil,
              asis: boolean() | nil,
              if_none_match: String.t() | nil,
              if_match: String.t() | nil,
              if_unmodified_since: OpenRiakTypes.http_date() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              content_encoding: String.t() | nil,
              link: String.t() | nil,
              riak_headers: OpenRiakTypes.riak_headers() | nil,
              body: OpenRiakTypes.byte_stream() | nil
            }

    defstruct [:bucket_type, :bucket, :timeout, :w, :dw, :pw, :node_confirms, :sync_on_write, :asis, :if_none_match, :if_match, :if_unmodified_since, :content_type, :content_encoding, :link, :riak_headers, :body]
  end
  defmodule CreateObjectOperationOutput do
    @moduledoc "structure CreateObjectOperationOutput"

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              location: String.t() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              content_encoding: String.t() | nil,
              etag: String.t() | nil,
              last_modified: OpenRiakTypes.http_date() | nil,
              link: String.t() | nil,
              riak_headers: OpenRiakTypes.riak_headers() | nil
            }

    defstruct [:status_code, :location, :content_type, :content_encoding, :etag, :last_modified, :link, :riak_headers]
  end
  defmodule CreateObjectReturnBodyInput do
    @moduledoc "Supports x-riak-if-not-modified and standard conditional headers for Riak-native conditional updates."

    @type t :: %__MODULE__{
              bucket_type: OpenRiakTypes.uri_safe_identifier() | nil,
              bucket: OpenRiakTypes.uri_safe_identifier() | nil,
              timeout: integer() | nil,
              w: OpenRiakTypes.quorum() | nil,
              dw: OpenRiakTypes.quorum() | nil,
              pw: OpenRiakTypes.quorum() | nil,
              node_confirms: integer() | nil,
              sync_on_write: OpenRiakTypes.SyncOnWrite.t() | nil,
              asis: boolean() | nil,
              if_none_match: String.t() | nil,
              if_match: String.t() | nil,
              if_unmodified_since: OpenRiakTypes.http_date() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              content_encoding: String.t() | nil,
              link: String.t() | nil,
              riak_headers: OpenRiakTypes.riak_headers() | nil,
              body: OpenRiakTypes.byte_stream() | nil
            }

    defstruct [:bucket_type, :bucket, :timeout, :w, :dw, :pw, :node_confirms, :sync_on_write, :asis, :if_none_match, :if_match, :if_unmodified_since, :content_type, :content_encoding, :link, :riak_headers, :body]
  end
  defmodule CreateObjectReturnBodyOperationOutput do
    @moduledoc "structure CreateObjectReturnBodyOperationOutput"

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              location: String.t() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              content_encoding: String.t() | nil,
              etag: String.t() | nil,
              last_modified: OpenRiakTypes.http_date() | nil,
              link: String.t() | nil,
              riak_headers: OpenRiakTypes.riak_headers() | nil,
              body: OpenRiakTypes.byte_stream()
            }

    defstruct [:status_code, :location, :content_type, :content_encoding, :etag, :last_modified, :link, :riak_headers, :body]
  end
  defmodule DeleteDefaultObjectOperationInput do
    @moduledoc "Riak-native conditional writes use x-riak-if-not-modified with an encoded vclock from a prior read, alongside standard If-Match and If-Unmodified-Since headers. Set riakHeaders key if-not-modified to the encoded vclock."

    @type t :: %__MODULE__{
              bucket: OpenRiakTypes.uri_safe_identifier() | nil,
              key: String.t() | nil,
              timeout: integer() | nil,
              r: OpenRiakTypes.quorum() | nil,
              w: OpenRiakTypes.quorum() | nil,
              rw: OpenRiakTypes.quorum() | nil,
              pr: OpenRiakTypes.quorum() | nil,
              pw: OpenRiakTypes.quorum() | nil,
              dw: OpenRiakTypes.quorum() | nil,
              if_none_match: String.t() | nil,
              if_match: String.t() | nil,
              if_unmodified_since: OpenRiakTypes.http_date() | nil,
              riak_headers: OpenRiakTypes.riak_headers() | nil
            }

    defstruct [:bucket, :key, :timeout, :r, :w, :rw, :pr, :pw, :dw, :if_none_match, :if_match, :if_unmodified_since, :riak_headers]
  end
  defmodule DeleteDefaultObjectOutput do
    @moduledoc "structure DeleteDefaultObjectOutput"

    @type t :: %__MODULE__{
              status_code: integer() | nil
            }

    defstruct [:status_code]
  end
  # Error shape: openriak.v3_4.api#NotFoundError (client)
  defmodule NotFoundError do
    @moduledoc "Error from openriak.v3_4.api#NotFoundError (fault: client, retryable: false)."

    defexception message: nil,
                 riak_headers: nil,
                 __beam_error_kind: :client

    def retryable(%__MODULE__{}), do: :false

    def throttling(%__MODULE__{}), do: :false

    def message(e), do: inspect(e)
  end
  defmodule DeleteLegacyObjectInput do
    @moduledoc "Riak-native conditional writes use x-riak-if-not-modified with an encoded vclock from a prior read, alongside standard If-Match and If-Unmodified-Since headers. Set riakHeaders key if-not-modified to the encoded vclock."

    @type t :: %__MODULE__{
              bucket: OpenRiakTypes.uri_safe_identifier() | nil,
              key: String.t() | nil,
              timeout: integer() | nil,
              r: OpenRiakTypes.quorum() | nil,
              w: OpenRiakTypes.quorum() | nil,
              rw: OpenRiakTypes.quorum() | nil,
              pr: OpenRiakTypes.quorum() | nil,
              pw: OpenRiakTypes.quorum() | nil,
              dw: OpenRiakTypes.quorum() | nil,
              if_none_match: String.t() | nil,
              if_match: String.t() | nil,
              if_unmodified_since: OpenRiakTypes.http_date() | nil,
              riak_headers: OpenRiakTypes.riak_headers() | nil
            }

    defstruct [:bucket, :key, :timeout, :r, :w, :rw, :pr, :pw, :dw, :if_none_match, :if_match, :if_unmodified_since, :riak_headers]
  end
  defmodule DeleteLegacyObjectOutput do
    @moduledoc "structure DeleteLegacyObjectOutput"

    @type t :: %__MODULE__{
              status_code: integer() | nil
            }

    defstruct [:status_code]
  end
  defmodule DeleteObjectInput do
    @moduledoc "Riak-native conditional writes use x-riak-if-not-modified with an encoded vclock from a prior read, alongside standard If-Match and If-Unmodified-Since headers. Set riakHeaders key if-not-modified to the encoded vclock."

    @type t :: %__MODULE__{
              bucket_type: OpenRiakTypes.uri_safe_identifier() | nil,
              bucket: OpenRiakTypes.uri_safe_identifier() | nil,
              key: String.t() | nil,
              timeout: integer() | nil,
              r: OpenRiakTypes.quorum() | nil,
              w: OpenRiakTypes.quorum() | nil,
              rw: OpenRiakTypes.quorum() | nil,
              pr: OpenRiakTypes.quorum() | nil,
              pw: OpenRiakTypes.quorum() | nil,
              dw: OpenRiakTypes.quorum() | nil,
              if_none_match: String.t() | nil,
              if_match: String.t() | nil,
              if_unmodified_since: OpenRiakTypes.http_date() | nil,
              riak_headers: OpenRiakTypes.riak_headers() | nil
            }

    defstruct [:bucket_type, :bucket, :key, :timeout, :r, :w, :rw, :pr, :pw, :dw, :if_none_match, :if_match, :if_unmodified_since, :riak_headers]
  end
  defmodule DeleteObjectOutput do
    @moduledoc "structure DeleteObjectOutput"

    @type t :: %__MODULE__{
              status_code: integer() | nil
            }

    defstruct [:status_code]
  end
  defmodule GetBucketPropertiesInput do
    @moduledoc "structure GetBucketPropertiesInput"

    @type t :: %__MODULE__{
              bucket_type: OpenRiakTypes.uri_safe_identifier() | nil,
              bucket: OpenRiakTypes.uri_safe_identifier() | nil,
              timeout: integer() | nil
            }

    defstruct [:bucket_type, :bucket, :timeout]
  end
  defmodule GetBucketPropertiesOutput do
    @moduledoc "structure GetBucketPropertiesOutput"

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              body: OpenRiakTypes.json_document() | nil
            }

    defstruct [:status_code, :content_type, :body]
  end
  defmodule GetBucketQueryResultsInput do
    @moduledoc "structure GetBucketQueryResultsInput"

    @type t :: %__MODULE__{
              bucket_type: OpenRiakTypes.uri_safe_identifier() | nil,
              bucket: OpenRiakTypes.uri_safe_identifier() | nil,
              timeout: integer() | nil,
              result_queue: String.t() | nil,
              max_results: integer() | nil
            }

    defstruct [:bucket_type, :bucket, :timeout, :result_queue, :max_results]
  end
  defmodule GetBucketQueryResultsOutput do
    @moduledoc "Paginated query results. Fetch responses may include returned_count, queued_count, and query_complete keys. queue_raw_keys and queue_raw_terms accumulation options return a result_queue reference for subsequent GET fetches."

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              continuation: String.t() | nil,
              body: OpenRiakTypes.json_document() | nil
            }

    defstruct [:status_code, :content_type, :continuation, :body]
  end
  # Error shape: openriak.v3_4.api#GoneError (client)
  defmodule GoneError do
    @moduledoc "Error from openriak.v3_4.api#GoneError (fault: client, retryable: false)."

    defexception message: nil,
                 __beam_error_kind: :client

    def retryable(%__MODULE__{}), do: :false

    def throttling(%__MODULE__{}), do: :false

    def message(e), do: inspect(e)
  end
  defmodule GetBucketTypePropertiesInput do
    @moduledoc "structure GetBucketTypePropertiesInput"

    @type t :: %__MODULE__{
              bucket_type: OpenRiakTypes.uri_safe_identifier() | nil,
              timeout: integer() | nil
            }

    defstruct [:bucket_type, :timeout]
  end
  defmodule GetBucketTypePropertiesOutput do
    @moduledoc "structure GetBucketTypePropertiesOutput"

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              body: OpenRiakTypes.json_document() | nil
            }

    defstruct [:status_code, :content_type, :body]
  end
  defmodule GetDatatypeInput do
    @moduledoc "structure GetDatatypeInput"

    @type t :: %__MODULE__{
              bucket_type: OpenRiakTypes.uri_safe_identifier() | nil,
              bucket: OpenRiakTypes.uri_safe_identifier() | nil,
              key: String.t() | nil,
              timeout: integer() | nil,
              r: OpenRiakTypes.quorum() | nil,
              pr: OpenRiakTypes.quorum() | nil,
              w: OpenRiakTypes.quorum() | nil,
              pw: OpenRiakTypes.quorum() | nil,
              dw: OpenRiakTypes.quorum() | nil,
              return_body: boolean() | nil,
              include_context: boolean() | nil
            }

    defstruct [:bucket_type, :bucket, :key, :timeout, :r, :pr, :w, :pw, :dw, :return_body, :include_context]
  end
  defmodule GetDatatypeOutput do
    @moduledoc "CRDT fetch or update response. When include_context is true, the opaque context may appear in the JSON body and in X-Riak-CRDT-Ctx."

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              crdt_context: String.t() | nil,
              body: OpenRiakTypes.json_document() | nil
            }

    defstruct [:status_code, :content_type, :crdt_context, :body]
  end
  defmodule GetDefaultBucketPropertiesInput do
    @moduledoc "structure GetDefaultBucketPropertiesInput"

    @type t :: %__MODULE__{
              bucket: OpenRiakTypes.uri_safe_identifier() | nil,
              timeout: integer() | nil
            }

    defstruct [:bucket, :timeout]
  end
  defmodule GetDefaultBucketPropertiesOutput do
    @moduledoc "structure GetDefaultBucketPropertiesOutput"

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              body: OpenRiakTypes.json_document() | nil
            }

    defstruct [:status_code, :content_type, :body]
  end
  defmodule GetDefaultBucketQueryResultsInput do
    @moduledoc "structure GetDefaultBucketQueryResultsInput"

    @type t :: %__MODULE__{
              bucket: OpenRiakTypes.uri_safe_identifier() | nil,
              timeout: integer() | nil,
              result_queue: String.t() | nil,
              max_results: integer() | nil
            }

    defstruct [:bucket, :timeout, :result_queue, :max_results]
  end
  defmodule GetDefaultBucketQueryResultsOutput do
    @moduledoc "Paginated query results. Fetch responses may include returned_count, queued_count, and query_complete keys. queue_raw_keys and queue_raw_terms accumulation options return a result_queue reference for subsequent GET fetches."

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              continuation: String.t() | nil,
              body: OpenRiakTypes.json_document() | nil
            }

    defstruct [:status_code, :content_type, :continuation, :body]
  end
  defmodule GetDefaultEraseKeysInput do
    @moduledoc "structure GetDefaultEraseKeysInput"

    @type t :: %__MODULE__{
              bucket: OpenRiakTypes.uri_safe_identifier() | nil,
              filter: String.t() | nil,
              timeout: integer() | nil
            }

    defstruct [:bucket, :filter, :timeout]
  end
  defmodule GetDefaultEraseKeysOutput do
    @moduledoc "structure GetDefaultEraseKeysOutput"

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              link: String.t() | nil,
              riak_headers: OpenRiakTypes.riak_headers() | nil,
              body: OpenRiakTypes.byte_stream()
            }

    defstruct [:status_code, :content_type, :link, :riak_headers, :body]
  end
  defmodule GetDefaultFetchClocksRangeInput do
    @moduledoc "structure GetDefaultFetchClocksRangeInput"

    @type t :: %__MODULE__{
              bucket: OpenRiakTypes.uri_safe_identifier() | nil,
              filter: String.t() | nil,
              timeout: integer() | nil
            }

    defstruct [:bucket, :filter, :timeout]
  end
  defmodule GetDefaultFetchClocksRangeOutput do
    @moduledoc "structure GetDefaultFetchClocksRangeOutput"

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              link: String.t() | nil,
              riak_headers: OpenRiakTypes.riak_headers() | nil,
              body: OpenRiakTypes.byte_stream()
            }

    defstruct [:status_code, :content_type, :link, :riak_headers, :body]
  end
  defmodule GetDefaultFindKeysByObjectSizeInput do
    @moduledoc "structure GetDefaultFindKeysByObjectSizeInput"

    @type t :: %__MODULE__{
              bucket: OpenRiakTypes.uri_safe_identifier() | nil,
              size: integer() | nil,
              filter: String.t() | nil,
              timeout: integer() | nil
            }

    defstruct [:bucket, :size, :filter, :timeout]
  end
  defmodule GetDefaultFindKeysByObjectSizeOutput do
    @moduledoc "structure GetDefaultFindKeysByObjectSizeOutput"

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              link: String.t() | nil,
              riak_headers: OpenRiakTypes.riak_headers() | nil,
              body: OpenRiakTypes.byte_stream()
            }

    defstruct [:status_code, :content_type, :link, :riak_headers, :body]
  end
  defmodule GetDefaultFindKeysBySiblingCountInput do
    @moduledoc "structure GetDefaultFindKeysBySiblingCountInput"

    @type t :: %__MODULE__{
              bucket: OpenRiakTypes.uri_safe_identifier() | nil,
              count: integer() | nil,
              filter: String.t() | nil,
              timeout: integer() | nil
            }

    defstruct [:bucket, :count, :filter, :timeout]
  end
  defmodule GetDefaultFindKeysBySiblingCountOutput do
    @moduledoc "structure GetDefaultFindKeysBySiblingCountOutput"

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              link: String.t() | nil,
              riak_headers: OpenRiakTypes.riak_headers() | nil,
              body: OpenRiakTypes.byte_stream()
            }

    defstruct [:status_code, :content_type, :link, :riak_headers, :body]
  end
  defmodule GetDefaultFindTombsInput do
    @moduledoc "structure GetDefaultFindTombsInput"

    @type t :: %__MODULE__{
              bucket: OpenRiakTypes.uri_safe_identifier() | nil,
              filter: String.t() | nil,
              timeout: integer() | nil
            }

    defstruct [:bucket, :filter, :timeout]
  end
  defmodule GetDefaultFindTombsOutput do
    @moduledoc "structure GetDefaultFindTombsOutput"

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              link: String.t() | nil,
              riak_headers: OpenRiakTypes.riak_headers() | nil,
              body: OpenRiakTypes.byte_stream()
            }

    defstruct [:status_code, :content_type, :link, :riak_headers, :body]
  end
  defmodule GetDefaultMergeTreeRangeInput do
    @moduledoc "structure GetDefaultMergeTreeRangeInput"

    @type t :: %__MODULE__{
              bucket: OpenRiakTypes.uri_safe_identifier() | nil,
              tree_size: OpenRiakTypes.non_empty_string() | nil,
              filter: String.t() | nil,
              timeout: integer() | nil
            }

    defstruct [:bucket, :tree_size, :filter, :timeout]
  end
  defmodule GetDefaultMergeTreeRangeOutput do
    @moduledoc "structure GetDefaultMergeTreeRangeOutput"

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              link: String.t() | nil,
              riak_headers: OpenRiakTypes.riak_headers() | nil,
              body: OpenRiakTypes.byte_stream()
            }

    defstruct [:status_code, :content_type, :link, :riak_headers, :body]
  end
  defmodule GetDefaultObjectOperationInput do
    @moduledoc "Accept drives sibling resolution: multipart/mixed returns all siblings at 200; other values may yield 300 with a vtag list when siblings are unresolved."

    @type t :: %__MODULE__{
              bucket: OpenRiakTypes.uri_safe_identifier() | nil,
              key: String.t() | nil,
              timeout: integer() | nil,
              r: OpenRiakTypes.quorum() | nil,
              pr: OpenRiakTypes.quorum() | nil,
              basic_quorum: boolean() | nil,
              notfound_ok: boolean() | nil,
              node_confirms: integer() | nil,
              deleted_v_clock: boolean() | nil,
              accept: OpenRiakTypes.media_type() | nil,
              if_none_match: String.t() | nil,
              if_modified_since: OpenRiakTypes.http_date() | nil,
              vtag: OpenRiakTypes.v_tag() | nil
            }

    defstruct [:bucket, :key, :timeout, :r, :pr, :basic_quorum, :notfound_ok, :node_confirms, :deleted_v_clock, :accept, :if_none_match, :if_modified_since, :vtag]
  end
  defmodule GetDefaultObjectOutput do
    @moduledoc "Tombstone reads expose X-Riak-Deleted via riakHeaders key deleted."

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              content_encoding: String.t() | nil,
              etag: String.t() | nil,
              last_modified: OpenRiakTypes.http_date() | nil,
              link: String.t() | nil,
              riak_headers: OpenRiakTypes.riak_headers() | nil,
              body: OpenRiakTypes.byte_stream()
            }

    defstruct [:status_code, :content_type, :content_encoding, :etag, :last_modified, :link, :riak_headers, :body]
  end
  # Error shape: openriak.v3_4.api#MultipleChoicesError (client)
  defmodule MultipleChoicesError do
    @moduledoc "Error from openriak.v3_4.api#MultipleChoicesError (fault: client, retryable: false)."

    defexception content_type: nil,
                 vclock: nil,
                 body: nil,
                 __beam_error_kind: :client

    def retryable(%__MODULE__{}), do: :false

    def throttling(%__MODULE__{}), do: :false

    def message(e), do: inspect(e)
  end
  defmodule GetDefaultObjectStatsInput do
    @moduledoc "structure GetDefaultObjectStatsInput"

    @type t :: %__MODULE__{
              bucket: OpenRiakTypes.uri_safe_identifier() | nil,
              filter: String.t() | nil,
              timeout: integer() | nil
            }

    defstruct [:bucket, :filter, :timeout]
  end
  defmodule GetDefaultObjectStatsOutput do
    @moduledoc "structure GetDefaultObjectStatsOutput"

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              link: String.t() | nil,
              riak_headers: OpenRiakTypes.riak_headers() | nil,
              body: OpenRiakTypes.byte_stream()
            }

    defstruct [:status_code, :content_type, :link, :riak_headers, :body]
  end
  defmodule GetDefaultReapTombsInput do
    @moduledoc "structure GetDefaultReapTombsInput"

    @type t :: %__MODULE__{
              bucket: OpenRiakTypes.uri_safe_identifier() | nil,
              filter: String.t() | nil,
              timeout: integer() | nil
            }

    defstruct [:bucket, :filter, :timeout]
  end
  defmodule GetDefaultReapTombsOutput do
    @moduledoc "structure GetDefaultReapTombsOutput"

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              link: String.t() | nil,
              riak_headers: OpenRiakTypes.riak_headers() | nil,
              body: OpenRiakTypes.byte_stream()
            }

    defstruct [:status_code, :content_type, :link, :riak_headers, :body]
  end
  defmodule GetDefaultRepairKeysRangeInput do
    @moduledoc "structure GetDefaultRepairKeysRangeInput"

    @type t :: %__MODULE__{
              bucket: OpenRiakTypes.uri_safe_identifier() | nil,
              filter: String.t() | nil,
              timeout: integer() | nil
            }

    defstruct [:bucket, :filter, :timeout]
  end
  defmodule GetDefaultRepairKeysRangeOutput do
    @moduledoc "structure GetDefaultRepairKeysRangeOutput"

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              link: String.t() | nil,
              riak_headers: OpenRiakTypes.riak_headers() | nil,
              body: OpenRiakTypes.byte_stream()
            }

    defstruct [:status_code, :content_type, :link, :riak_headers, :body]
  end
  defmodule GetDefaultReplKeysRangeInput do
    @moduledoc "structure GetDefaultReplKeysRangeInput"

    @type t :: %__MODULE__{
              bucket: OpenRiakTypes.uri_safe_identifier() | nil,
              queue_name: OpenRiakTypes.uri_safe_identifier() | nil,
              filter: String.t() | nil,
              timeout: integer() | nil
            }

    defstruct [:bucket, :queue_name, :filter, :timeout]
  end
  defmodule GetDefaultReplKeysRangeOutput do
    @moduledoc "structure GetDefaultReplKeysRangeOutput"

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              link: String.t() | nil,
              riak_headers: OpenRiakTypes.riak_headers() | nil,
              body: OpenRiakTypes.byte_stream()
            }

    defstruct [:status_code, :content_type, :link, :riak_headers, :body]
  end
  defmodule GetEraseKeysInput do
    @moduledoc "structure GetEraseKeysInput"

    @type t :: %__MODULE__{
              bucket_type: OpenRiakTypes.uri_safe_identifier() | nil,
              bucket: OpenRiakTypes.uri_safe_identifier() | nil,
              filter: String.t() | nil,
              timeout: integer() | nil
            }

    defstruct [:bucket_type, :bucket, :filter, :timeout]
  end
  defmodule GetEraseKeysOutput do
    @moduledoc "structure GetEraseKeysOutput"

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              link: String.t() | nil,
              riak_headers: OpenRiakTypes.riak_headers() | nil,
              body: OpenRiakTypes.byte_stream()
            }

    defstruct [:status_code, :content_type, :link, :riak_headers, :body]
  end
  defmodule GetFetchClocksNvalInput do
    @moduledoc "structure GetFetchClocksNvalInput"

    @type t :: %__MODULE__{
              n_val: integer() | nil,
              filter: String.t() | nil,
              timeout: integer() | nil
            }

    defstruct [:n_val, :filter, :timeout]
  end
  defmodule GetFetchClocksNvalOutput do
    @moduledoc "structure GetFetchClocksNvalOutput"

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              link: String.t() | nil,
              riak_headers: OpenRiakTypes.riak_headers() | nil,
              body: OpenRiakTypes.byte_stream()
            }

    defstruct [:status_code, :content_type, :link, :riak_headers, :body]
  end
  defmodule GetFetchClocksRangeInput do
    @moduledoc "structure GetFetchClocksRangeInput"

    @type t :: %__MODULE__{
              bucket_type: OpenRiakTypes.uri_safe_identifier() | nil,
              bucket: OpenRiakTypes.uri_safe_identifier() | nil,
              filter: String.t() | nil,
              timeout: integer() | nil
            }

    defstruct [:bucket_type, :bucket, :filter, :timeout]
  end
  defmodule GetFetchClocksRangeOutput do
    @moduledoc "structure GetFetchClocksRangeOutput"

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              link: String.t() | nil,
              riak_headers: OpenRiakTypes.riak_headers() | nil,
              body: OpenRiakTypes.byte_stream()
            }

    defstruct [:status_code, :content_type, :link, :riak_headers, :body]
  end
  defmodule GetFindKeysByObjectSizeInput do
    @moduledoc "structure GetFindKeysByObjectSizeInput"

    @type t :: %__MODULE__{
              bucket_type: OpenRiakTypes.uri_safe_identifier() | nil,
              bucket: OpenRiakTypes.uri_safe_identifier() | nil,
              size: integer() | nil,
              filter: String.t() | nil,
              timeout: integer() | nil
            }

    defstruct [:bucket_type, :bucket, :size, :filter, :timeout]
  end
  defmodule GetFindKeysByObjectSizeOutput do
    @moduledoc "structure GetFindKeysByObjectSizeOutput"

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              link: String.t() | nil,
              riak_headers: OpenRiakTypes.riak_headers() | nil,
              body: OpenRiakTypes.byte_stream()
            }

    defstruct [:status_code, :content_type, :link, :riak_headers, :body]
  end
  defmodule GetFindKeysBySiblingCountInput do
    @moduledoc "structure GetFindKeysBySiblingCountInput"

    @type t :: %__MODULE__{
              bucket_type: OpenRiakTypes.uri_safe_identifier() | nil,
              bucket: OpenRiakTypes.uri_safe_identifier() | nil,
              count: integer() | nil,
              filter: String.t() | nil,
              timeout: integer() | nil
            }

    defstruct [:bucket_type, :bucket, :count, :filter, :timeout]
  end
  defmodule GetFindKeysBySiblingCountOutput do
    @moduledoc "structure GetFindKeysBySiblingCountOutput"

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              link: String.t() | nil,
              riak_headers: OpenRiakTypes.riak_headers() | nil,
              body: OpenRiakTypes.byte_stream()
            }

    defstruct [:status_code, :content_type, :link, :riak_headers, :body]
  end
  defmodule GetFindTombsInput do
    @moduledoc "structure GetFindTombsInput"

    @type t :: %__MODULE__{
              bucket_type: OpenRiakTypes.uri_safe_identifier() | nil,
              bucket: OpenRiakTypes.uri_safe_identifier() | nil,
              filter: String.t() | nil,
              timeout: integer() | nil
            }

    defstruct [:bucket_type, :bucket, :filter, :timeout]
  end
  defmodule GetFindTombsOutput do
    @moduledoc "structure GetFindTombsOutput"

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              link: String.t() | nil,
              riak_headers: OpenRiakTypes.riak_headers() | nil,
              body: OpenRiakTypes.byte_stream()
            }

    defstruct [:status_code, :content_type, :link, :riak_headers, :body]
  end
  defmodule GetLegacyCounterInput do
    @moduledoc "structure GetLegacyCounterInput"

    @type t :: %__MODULE__{
              bucket: OpenRiakTypes.uri_safe_identifier() | nil,
              key: String.t() | nil,
              timeout: integer() | nil,
              r: OpenRiakTypes.quorum() | nil,
              pr: OpenRiakTypes.quorum() | nil,
              basic_quorum: boolean() | nil,
              notfound_ok: boolean() | nil,
              node_confirms: integer() | nil,
              deleted_v_clock: boolean() | nil
            }

    defstruct [:bucket, :key, :timeout, :r, :pr, :basic_quorum, :notfound_ok, :node_confirms, :deleted_v_clock]
  end
  defmodule GetLegacyCounterOutput do
    @moduledoc "structure GetLegacyCounterOutput"

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              body: String.t() | nil
            }

    defstruct [:status_code, :content_type, :body]
  end
  defmodule GetLegacyObjectInput do
    @moduledoc "Accept drives sibling resolution: multipart/mixed returns all siblings at 200; other values may yield 300 with a vtag list when siblings are unresolved."

    @type t :: %__MODULE__{
              bucket: OpenRiakTypes.uri_safe_identifier() | nil,
              key: String.t() | nil,
              timeout: integer() | nil,
              r: OpenRiakTypes.quorum() | nil,
              pr: OpenRiakTypes.quorum() | nil,
              basic_quorum: boolean() | nil,
              notfound_ok: boolean() | nil,
              node_confirms: integer() | nil,
              deleted_v_clock: boolean() | nil,
              accept: OpenRiakTypes.media_type() | nil,
              if_none_match: String.t() | nil,
              if_modified_since: OpenRiakTypes.http_date() | nil,
              vtag: OpenRiakTypes.v_tag() | nil
            }

    defstruct [:bucket, :key, :timeout, :r, :pr, :basic_quorum, :notfound_ok, :node_confirms, :deleted_v_clock, :accept, :if_none_match, :if_modified_since, :vtag]
  end
  defmodule GetLegacyObjectOutput do
    @moduledoc "Tombstone reads expose X-Riak-Deleted via riakHeaders key deleted."

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              content_encoding: String.t() | nil,
              etag: String.t() | nil,
              last_modified: OpenRiakTypes.http_date() | nil,
              link: String.t() | nil,
              riak_headers: OpenRiakTypes.riak_headers() | nil,
              body: OpenRiakTypes.byte_stream()
            }

    defstruct [:status_code, :content_type, :content_encoding, :etag, :last_modified, :link, :riak_headers, :body]
  end
  defmodule GetMapReduceUsageInput do
    @moduledoc "structure GetMapReduceUsageInput"

    @type t :: %__MODULE__{
            }

    defstruct []
  end
  defmodule GetMapReduceUsageOutput do
    @moduledoc "structure GetMapReduceUsageOutput"

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              body: String.t() | nil
            }

    defstruct [:status_code, :content_type, :body]
  end
  defmodule GetMembershipInput do
    @moduledoc "structure GetMembershipInput"

    @type t :: %__MODULE__{
              timeout: integer() | nil
            }

    defstruct [:timeout]
  end
  defmodule GetMembershipOutput do
    @moduledoc "structure GetMembershipOutput"

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              body: OpenRiakTypes.json_document() | nil
            }

    defstruct [:status_code, :content_type, :body]
  end
  defmodule GetMergeBranchNvalInput do
    @moduledoc "structure GetMergeBranchNvalInput"

    @type t :: %__MODULE__{
              n_val: integer() | nil,
              filter: String.t() | nil,
              timeout: integer() | nil
            }

    defstruct [:n_val, :filter, :timeout]
  end
  defmodule GetMergeBranchNvalOutput do
    @moduledoc "structure GetMergeBranchNvalOutput"

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              link: String.t() | nil,
              riak_headers: OpenRiakTypes.riak_headers() | nil,
              body: OpenRiakTypes.byte_stream()
            }

    defstruct [:status_code, :content_type, :link, :riak_headers, :body]
  end
  defmodule GetMergeRootNvalInput do
    @moduledoc "structure GetMergeRootNvalInput"

    @type t :: %__MODULE__{
              n_val: integer() | nil,
              timeout: integer() | nil
            }

    defstruct [:n_val, :timeout]
  end
  defmodule GetMergeRootNvalOutput do
    @moduledoc "structure GetMergeRootNvalOutput"

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              link: String.t() | nil,
              riak_headers: OpenRiakTypes.riak_headers() | nil,
              body: OpenRiakTypes.byte_stream()
            }

    defstruct [:status_code, :content_type, :link, :riak_headers, :body]
  end
  defmodule GetMergeTreeRangeInput do
    @moduledoc "structure GetMergeTreeRangeInput"

    @type t :: %__MODULE__{
              bucket_type: OpenRiakTypes.uri_safe_identifier() | nil,
              bucket: OpenRiakTypes.uri_safe_identifier() | nil,
              tree_size: OpenRiakTypes.non_empty_string() | nil,
              filter: String.t() | nil,
              timeout: integer() | nil
            }

    defstruct [:bucket_type, :bucket, :tree_size, :filter, :timeout]
  end
  defmodule GetMergeTreeRangeOutput do
    @moduledoc "structure GetMergeTreeRangeOutput"

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              link: String.t() | nil,
              riak_headers: OpenRiakTypes.riak_headers() | nil,
              body: OpenRiakTypes.byte_stream()
            }

    defstruct [:status_code, :content_type, :link, :riak_headers, :body]
  end
  defmodule GetObjectInput do
    @moduledoc "Accept drives sibling resolution: multipart/mixed returns all siblings at 200; other values may yield 300 with a vtag list when siblings are unresolved."

    @type t :: %__MODULE__{
              bucket_type: OpenRiakTypes.uri_safe_identifier() | nil,
              bucket: OpenRiakTypes.uri_safe_identifier() | nil,
              key: String.t() | nil,
              timeout: integer() | nil,
              r: OpenRiakTypes.quorum() | nil,
              pr: OpenRiakTypes.quorum() | nil,
              basic_quorum: boolean() | nil,
              notfound_ok: boolean() | nil,
              node_confirms: integer() | nil,
              deleted_v_clock: boolean() | nil,
              accept: OpenRiakTypes.media_type() | nil,
              if_none_match: String.t() | nil,
              if_modified_since: OpenRiakTypes.http_date() | nil,
              vtag: OpenRiakTypes.v_tag() | nil
            }

    defstruct [:bucket_type, :bucket, :key, :timeout, :r, :pr, :basic_quorum, :notfound_ok, :node_confirms, :deleted_v_clock, :accept, :if_none_match, :if_modified_since, :vtag]
  end
  defmodule GetObjectOutput do
    @moduledoc "Tombstone reads expose X-Riak-Deleted via riakHeaders key deleted."

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              content_encoding: String.t() | nil,
              etag: String.t() | nil,
              last_modified: OpenRiakTypes.http_date() | nil,
              link: String.t() | nil,
              riak_headers: OpenRiakTypes.riak_headers() | nil,
              body: OpenRiakTypes.byte_stream()
            }

    defstruct [:status_code, :content_type, :content_encoding, :etag, :last_modified, :link, :riak_headers, :body]
  end
  defmodule GetObjectStatsInput do
    @moduledoc "structure GetObjectStatsInput"

    @type t :: %__MODULE__{
              bucket_type: OpenRiakTypes.uri_safe_identifier() | nil,
              bucket: OpenRiakTypes.uri_safe_identifier() | nil,
              filter: String.t() | nil,
              timeout: integer() | nil
            }

    defstruct [:bucket_type, :bucket, :filter, :timeout]
  end
  defmodule GetObjectStatsOutput do
    @moduledoc "structure GetObjectStatsOutput"

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              link: String.t() | nil,
              riak_headers: OpenRiakTypes.riak_headers() | nil,
              body: OpenRiakTypes.byte_stream()
            }

    defstruct [:status_code, :content_type, :link, :riak_headers, :body]
  end
  defmodule QueueObjectFormat do
    @moduledoc "String enum. Unknown values are represented as {:unknown, String.t()}."

    @type t :: :internal | :internal_aaehash | {:unknown, String.t()}

    @spec from_string(String.t()) :: t()
    def from_string("internal"), do: :internal
    def from_string("internal_aaehash"), do: :internal_aaehash

    def from_string(v) when is_binary(v) do
      normalized = String.replace(v, "_", ".")

      if normalized == v do
        {:unknown, v}
      else
        case from_string(normalized) do
          {:unknown, _} -> {:unknown, v}
          result -> result
        end
      end
    end

    @spec to_string(t()) :: String.t()
    def to_string(:internal), do: "internal"
    def to_string(:internal_aaehash), do: "internal_aaehash"
    def to_string({:unknown, v}), do: v

    @spec values() :: [t()]
    def values, do: [:internal, :internal_aaehash]
  end
  defmodule GetQueueItemInput do
    @moduledoc "structure GetQueueItemInput"

    @type t :: %__MODULE__{
              queue_name: OpenRiakTypes.uri_safe_identifier() | nil,
              object_format: OpenRiakTypes.QueueObjectFormat.t() | nil
            }

    defstruct [:queue_name, :object_format]
  end
  defmodule GetQueueItemOutput do
    @moduledoc "structure GetQueueItemOutput"

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              body: OpenRiakTypes.byte_stream()
            }

    defstruct [:status_code, :content_type, :body]
  end
  defmodule GetReapTombsInput do
    @moduledoc "structure GetReapTombsInput"

    @type t :: %__MODULE__{
              bucket_type: OpenRiakTypes.uri_safe_identifier() | nil,
              bucket: OpenRiakTypes.uri_safe_identifier() | nil,
              filter: String.t() | nil,
              timeout: integer() | nil
            }

    defstruct [:bucket_type, :bucket, :filter, :timeout]
  end
  defmodule GetReapTombsOutput do
    @moduledoc "structure GetReapTombsOutput"

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              link: String.t() | nil,
              riak_headers: OpenRiakTypes.riak_headers() | nil,
              body: OpenRiakTypes.byte_stream()
            }

    defstruct [:status_code, :content_type, :link, :riak_headers, :body]
  end
  defmodule GetRepairKeysRangeInput do
    @moduledoc "structure GetRepairKeysRangeInput"

    @type t :: %__MODULE__{
              bucket_type: OpenRiakTypes.uri_safe_identifier() | nil,
              bucket: OpenRiakTypes.uri_safe_identifier() | nil,
              filter: String.t() | nil,
              timeout: integer() | nil
            }

    defstruct [:bucket_type, :bucket, :filter, :timeout]
  end
  defmodule GetRepairKeysRangeOutput do
    @moduledoc "structure GetRepairKeysRangeOutput"

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              link: String.t() | nil,
              riak_headers: OpenRiakTypes.riak_headers() | nil,
              body: OpenRiakTypes.byte_stream()
            }

    defstruct [:status_code, :content_type, :link, :riak_headers, :body]
  end
  defmodule GetReplKeysRangeInput do
    @moduledoc "structure GetReplKeysRangeInput"

    @type t :: %__MODULE__{
              bucket_type: OpenRiakTypes.uri_safe_identifier() | nil,
              bucket: OpenRiakTypes.uri_safe_identifier() | nil,
              queue_name: OpenRiakTypes.uri_safe_identifier() | nil,
              filter: String.t() | nil,
              timeout: integer() | nil
            }

    defstruct [:bucket_type, :bucket, :queue_name, :filter, :timeout]
  end
  defmodule GetReplKeysRangeOutput do
    @moduledoc "structure GetReplKeysRangeOutput"

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              link: String.t() | nil,
              riak_headers: OpenRiakTypes.riak_headers() | nil,
              body: OpenRiakTypes.byte_stream()
            }

    defstruct [:status_code, :content_type, :link, :riak_headers, :body]
  end
  defmodule GetRootInput do
    @moduledoc "structure GetRootInput"

    @type t :: %__MODULE__{
              accept: OpenRiakTypes.media_type() | nil
            }

    defstruct [:accept]
  end
  defmodule GetRootOutput do
    @moduledoc "structure GetRootOutput"

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              link: String.t() | nil,
              body: OpenRiakTypes.byte_stream()
            }

    defstruct [:status_code, :content_type, :link, :body]
  end
  defmodule GetStatsInput do
    @moduledoc "structure GetStatsInput"

    @type t :: %__MODULE__{
              timeout: integer() | nil,
              accept: OpenRiakTypes.media_type() | nil
            }

    defstruct [:timeout, :accept]
  end
  defmodule GetStatsOutput do
    @moduledoc "structure GetStatsOutput"

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              body: OpenRiakTypes.byte_stream()
            }

    defstruct [:status_code, :content_type, :body]
  end
  defmodule HeadDefaultObjectOperationInput do
    @moduledoc "Accept drives sibling resolution: multipart/mixed returns all siblings at 200; other values may yield 300 with a vtag list when siblings are unresolved."

    @type t :: %__MODULE__{
              bucket: OpenRiakTypes.uri_safe_identifier() | nil,
              key: String.t() | nil,
              timeout: integer() | nil,
              r: OpenRiakTypes.quorum() | nil,
              pr: OpenRiakTypes.quorum() | nil,
              basic_quorum: boolean() | nil,
              notfound_ok: boolean() | nil,
              node_confirms: integer() | nil,
              deleted_v_clock: boolean() | nil,
              accept: OpenRiakTypes.media_type() | nil,
              if_none_match: String.t() | nil,
              if_modified_since: OpenRiakTypes.http_date() | nil,
              vtag: OpenRiakTypes.v_tag() | nil
            }

    defstruct [:bucket, :key, :timeout, :r, :pr, :basic_quorum, :notfound_ok, :node_confirms, :deleted_v_clock, :accept, :if_none_match, :if_modified_since, :vtag]
  end
  defmodule HeadDefaultObjectOutput do
    @moduledoc "Tombstone reads expose X-Riak-Deleted via riakHeaders key deleted."

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              content_encoding: String.t() | nil,
              etag: String.t() | nil,
              last_modified: OpenRiakTypes.http_date() | nil,
              link: String.t() | nil,
              riak_headers: OpenRiakTypes.riak_headers() | nil
            }

    defstruct [:status_code, :content_type, :content_encoding, :etag, :last_modified, :link, :riak_headers]
  end
  defmodule HeadLegacyObjectInput do
    @moduledoc "Accept drives sibling resolution: multipart/mixed returns all siblings at 200; other values may yield 300 with a vtag list when siblings are unresolved."

    @type t :: %__MODULE__{
              bucket: OpenRiakTypes.uri_safe_identifier() | nil,
              key: String.t() | nil,
              timeout: integer() | nil,
              r: OpenRiakTypes.quorum() | nil,
              pr: OpenRiakTypes.quorum() | nil,
              basic_quorum: boolean() | nil,
              notfound_ok: boolean() | nil,
              node_confirms: integer() | nil,
              deleted_v_clock: boolean() | nil,
              accept: OpenRiakTypes.media_type() | nil,
              if_none_match: String.t() | nil,
              if_modified_since: OpenRiakTypes.http_date() | nil,
              vtag: OpenRiakTypes.v_tag() | nil
            }

    defstruct [:bucket, :key, :timeout, :r, :pr, :basic_quorum, :notfound_ok, :node_confirms, :deleted_v_clock, :accept, :if_none_match, :if_modified_since, :vtag]
  end
  defmodule HeadLegacyObjectOutput do
    @moduledoc "Tombstone reads expose X-Riak-Deleted via riakHeaders key deleted."

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              content_encoding: String.t() | nil,
              etag: String.t() | nil,
              last_modified: OpenRiakTypes.http_date() | nil,
              link: String.t() | nil,
              riak_headers: OpenRiakTypes.riak_headers() | nil
            }

    defstruct [:status_code, :content_type, :content_encoding, :etag, :last_modified, :link, :riak_headers]
  end
  defmodule HeadMapReduceInput do
    @moduledoc "structure HeadMapReduceInput"

    @type t :: %__MODULE__{
            }

    defstruct []
  end
  defmodule HeadMapReduceOutput do
    @moduledoc "structure HeadMapReduceOutput"

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              link: String.t() | nil,
              riak_headers: OpenRiakTypes.riak_headers() | nil
            }

    defstruct [:status_code, :content_type, :link, :riak_headers]
  end
  defmodule HeadObjectInput do
    @moduledoc "Accept drives sibling resolution: multipart/mixed returns all siblings at 200; other values may yield 300 with a vtag list when siblings are unresolved."

    @type t :: %__MODULE__{
              bucket_type: OpenRiakTypes.uri_safe_identifier() | nil,
              bucket: OpenRiakTypes.uri_safe_identifier() | nil,
              key: String.t() | nil,
              timeout: integer() | nil,
              r: OpenRiakTypes.quorum() | nil,
              pr: OpenRiakTypes.quorum() | nil,
              basic_quorum: boolean() | nil,
              notfound_ok: boolean() | nil,
              node_confirms: integer() | nil,
              deleted_v_clock: boolean() | nil,
              accept: OpenRiakTypes.media_type() | nil,
              if_none_match: String.t() | nil,
              if_modified_since: OpenRiakTypes.http_date() | nil,
              vtag: OpenRiakTypes.v_tag() | nil
            }

    defstruct [:bucket_type, :bucket, :key, :timeout, :r, :pr, :basic_quorum, :notfound_ok, :node_confirms, :deleted_v_clock, :accept, :if_none_match, :if_modified_since, :vtag]
  end
  defmodule HeadObjectOperationOutput do
    @moduledoc "Tombstone reads expose X-Riak-Deleted via riakHeaders key deleted."

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              content_encoding: String.t() | nil,
              etag: String.t() | nil,
              last_modified: OpenRiakTypes.http_date() | nil,
              link: String.t() | nil,
              riak_headers: OpenRiakTypes.riak_headers() | nil
            }

    defstruct [:status_code, :content_type, :content_encoding, :etag, :last_modified, :link, :riak_headers]
  end
  defmodule HeadStatsInput do
    @moduledoc "structure HeadStatsInput"

    @type t :: %__MODULE__{
              timeout: integer() | nil,
              accept: OpenRiakTypes.media_type() | nil
            }

    defstruct [:timeout, :accept]
  end
  defmodule HeadStatsOutput do
    @moduledoc "structure HeadStatsOutput"

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              link: String.t() | nil,
              riak_headers: OpenRiakTypes.riak_headers() | nil
            }

    defstruct [:status_code, :content_type, :link, :riak_headers]
  end
  defmodule LinkWalkInput do
    @moduledoc "structure LinkWalkInput"

    @type t :: %__MODULE__{
              bucket_type: OpenRiakTypes.uri_safe_identifier() | nil,
              bucket: OpenRiakTypes.uri_safe_identifier() | nil,
              key: String.t() | nil,
              walk: String.t() | nil
            }

    defstruct [:bucket_type, :bucket, :key, :walk]
  end
  defmodule LinkWalkOutput do
    @moduledoc "structure LinkWalkOutput"

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              link: String.t() | nil,
              riak_headers: OpenRiakTypes.riak_headers() | nil,
              body: OpenRiakTypes.byte_stream()
            }

    defstruct [:status_code, :content_type, :link, :riak_headers, :body]
  end
  defmodule LinkWalkDefaultOperationInput do
    @moduledoc "structure LinkWalkDefaultOperationInput"

    @type t :: %__MODULE__{
              bucket: OpenRiakTypes.uri_safe_identifier() | nil,
              key: String.t() | nil,
              walk: String.t() | nil
            }

    defstruct [:bucket, :key, :walk]
  end
  defmodule LinkWalkDefaultOutput do
    @moduledoc "structure LinkWalkDefaultOutput"

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              link: String.t() | nil,
              riak_headers: OpenRiakTypes.riak_headers() | nil,
              body: OpenRiakTypes.byte_stream()
            }

    defstruct [:status_code, :content_type, :link, :riak_headers, :body]
  end
  defmodule LinkWalkLegacyInput do
    @moduledoc "structure LinkWalkLegacyInput"

    @type t :: %__MODULE__{
              bucket: OpenRiakTypes.uri_safe_identifier() | nil,
              key: String.t() | nil,
              walk: String.t() | nil
            }

    defstruct [:bucket, :key, :walk]
  end
  defmodule LinkWalkLegacyOutput do
    @moduledoc "structure LinkWalkLegacyOutput"

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              link: String.t() | nil,
              riak_headers: OpenRiakTypes.riak_headers() | nil,
              body: OpenRiakTypes.byte_stream()
            }

    defstruct [:status_code, :content_type, :link, :riak_headers, :body]
  end
  defmodule ListAaeBucketsInput do
    @moduledoc "structure ListAaeBucketsInput"

    @type t :: %__MODULE__{
              nval: integer() | nil,
              timeout: integer() | nil
            }

    defstruct [:nval, :timeout]
  end
  defmodule ListAaeBucketsOutput do
    @moduledoc "structure ListAaeBucketsOutput"

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              link: String.t() | nil,
              riak_headers: OpenRiakTypes.riak_headers() | nil,
              body: OpenRiakTypes.byte_stream()
            }

    defstruct [:status_code, :content_type, :link, :riak_headers, :body]
  end
  defmodule ListBucketsOperationInput do
    @moduledoc "structure ListBucketsOperationInput"

    @type t :: %__MODULE__{
              bucket_type: OpenRiakTypes.uri_safe_identifier() | nil,
              timeout: integer() | nil
            }

    defstruct [:bucket_type, :timeout]
  end
  defmodule ListBucketsOutput do
    @moduledoc "structure ListBucketsOutput"

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              body: OpenRiakTypes.json_document() | nil
            }

    defstruct [:status_code, :content_type, :body]
  end
  defmodule ListDefaultBucketsInput do
    @moduledoc "structure ListDefaultBucketsInput"

    @type t :: %__MODULE__{
              timeout: integer() | nil
            }

    defstruct [:timeout]
  end
  defmodule ListDefaultBucketsOutput do
    @moduledoc "structure ListDefaultBucketsOutput"

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              body: OpenRiakTypes.json_document() | nil
            }

    defstruct [:status_code, :content_type, :body]
  end
  defmodule ListDefaultKeysOperationInput do
    @moduledoc "structure ListDefaultKeysOperationInput"

    @type t :: %__MODULE__{
              bucket: OpenRiakTypes.uri_safe_identifier() | nil,
              timeout: integer() | nil,
              props: boolean() | nil
            }

    defstruct [:bucket, :timeout, :props]
  end
  defmodule ListDefaultKeysOutput do
    @moduledoc "structure ListDefaultKeysOutput"

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              body: OpenRiakTypes.json_document() | nil
            }

    defstruct [:status_code, :content_type, :body]
  end
  defmodule ListKeysOperationInput do
    @moduledoc "structure ListKeysOperationInput"

    @type t :: %__MODULE__{
              bucket_type: OpenRiakTypes.uri_safe_identifier() | nil,
              bucket: OpenRiakTypes.uri_safe_identifier() | nil,
              timeout: integer() | nil,
              props: boolean() | nil
            }

    defstruct [:bucket_type, :bucket, :timeout, :props]
  end
  defmodule ListKeysOutput do
    @moduledoc "structure ListKeysOutput"

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              body: OpenRiakTypes.json_document() | nil
            }

    defstruct [:status_code, :content_type, :body]
  end
  defmodule MapReduceJob do
    @moduledoc "structure MapReduceJob"

    @type t :: %__MODULE__{
              inputs: any(),
              query: any()
            }

    defstruct [:inputs, :query]
  end
  defmodule MapReduceOperationInput do
    @moduledoc "structure MapReduceOperationInput"

    @type t :: %__MODULE__{
              content_type: OpenRiakTypes.media_type() | nil,
              accept: OpenRiakTypes.media_type() | nil,
              request: OpenRiakTypes.MapReduceJob.t() | nil
            }

    defstruct [:content_type, :accept, :request]
  end
  defmodule MapReduceOutput do
    @moduledoc "structure MapReduceOutput"

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              body: OpenRiakTypes.json_document() | nil
            }

    defstruct [:status_code, :content_type, :body]
  end
  defmodule MapReduceChunkedInput do
    @moduledoc "structure MapReduceChunkedInput"

    @type t :: %__MODULE__{
              content_type: OpenRiakTypes.media_type() | nil,
              accept: OpenRiakTypes.media_type() | nil,
              request: OpenRiakTypes.MapReduceJob.t() | nil
            }

    defstruct [:content_type, :accept, :request]
  end
  defmodule MapReduceChunkedOutput do
    @moduledoc "structure MapReduceChunkedOutput"

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              link: String.t() | nil,
              riak_headers: OpenRiakTypes.riak_headers() | nil,
              body: OpenRiakTypes.byte_stream()
            }

    defstruct [:status_code, :content_type, :link, :riak_headers, :body]
  end
  defmodule PingInput do
    @moduledoc "structure PingInput"

    @type t :: %__MODULE__{
            }

    defstruct []
  end
  defmodule PingOutput do
    @moduledoc "structure PingOutput"

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              body: String.t() | nil
            }

    defstruct [:status_code, :content_type, :body]
  end
  defmodule PostDefaultObjectInput do
    @moduledoc "Supports x-riak-if-not-modified and standard conditional headers for Riak-native conditional updates."

    @type t :: %__MODULE__{
              bucket: OpenRiakTypes.uri_safe_identifier() | nil,
              key: String.t() | nil,
              timeout: integer() | nil,
              w: OpenRiakTypes.quorum() | nil,
              dw: OpenRiakTypes.quorum() | nil,
              pw: OpenRiakTypes.quorum() | nil,
              node_confirms: integer() | nil,
              sync_on_write: OpenRiakTypes.SyncOnWrite.t() | nil,
              asis: boolean() | nil,
              if_none_match: String.t() | nil,
              if_match: String.t() | nil,
              if_unmodified_since: OpenRiakTypes.http_date() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              content_encoding: String.t() | nil,
              link: String.t() | nil,
              riak_headers: OpenRiakTypes.riak_headers() | nil,
              body: OpenRiakTypes.byte_stream() | nil
            }

    defstruct [:bucket, :key, :timeout, :w, :dw, :pw, :node_confirms, :sync_on_write, :asis, :if_none_match, :if_match, :if_unmodified_since, :content_type, :content_encoding, :link, :riak_headers, :body]
  end
  defmodule PostDefaultObjectOutput do
    @moduledoc "structure PostDefaultObjectOutput"

    @type t :: %__MODULE__{
              status_code: integer() | nil
            }

    defstruct [:status_code]
  end
  defmodule PostDefaultObjectReturnBodyInput do
    @moduledoc "Supports x-riak-if-not-modified and standard conditional headers for Riak-native conditional updates."

    @type t :: %__MODULE__{
              bucket: OpenRiakTypes.uri_safe_identifier() | nil,
              key: String.t() | nil,
              timeout: integer() | nil,
              w: OpenRiakTypes.quorum() | nil,
              dw: OpenRiakTypes.quorum() | nil,
              pw: OpenRiakTypes.quorum() | nil,
              node_confirms: integer() | nil,
              sync_on_write: OpenRiakTypes.SyncOnWrite.t() | nil,
              asis: boolean() | nil,
              if_none_match: String.t() | nil,
              if_match: String.t() | nil,
              if_unmodified_since: OpenRiakTypes.http_date() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              content_encoding: String.t() | nil,
              link: String.t() | nil,
              riak_headers: OpenRiakTypes.riak_headers() | nil,
              body: OpenRiakTypes.byte_stream() | nil
            }

    defstruct [:bucket, :key, :timeout, :w, :dw, :pw, :node_confirms, :sync_on_write, :asis, :if_none_match, :if_match, :if_unmodified_since, :content_type, :content_encoding, :link, :riak_headers, :body]
  end
  defmodule PostDefaultObjectReturnBodyOutput do
    @moduledoc "Tombstone reads expose X-Riak-Deleted via riakHeaders key deleted."

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              content_encoding: String.t() | nil,
              etag: String.t() | nil,
              last_modified: OpenRiakTypes.http_date() | nil,
              link: String.t() | nil,
              riak_headers: OpenRiakTypes.riak_headers() | nil,
              body: OpenRiakTypes.byte_stream()
            }

    defstruct [:status_code, :content_type, :content_encoding, :etag, :last_modified, :link, :riak_headers, :body]
  end
  defmodule PostLegacyObjectInput do
    @moduledoc "Supports x-riak-if-not-modified and standard conditional headers for Riak-native conditional updates."

    @type t :: %__MODULE__{
              bucket: OpenRiakTypes.uri_safe_identifier() | nil,
              key: String.t() | nil,
              timeout: integer() | nil,
              w: OpenRiakTypes.quorum() | nil,
              dw: OpenRiakTypes.quorum() | nil,
              pw: OpenRiakTypes.quorum() | nil,
              node_confirms: integer() | nil,
              sync_on_write: OpenRiakTypes.SyncOnWrite.t() | nil,
              asis: boolean() | nil,
              if_none_match: String.t() | nil,
              if_match: String.t() | nil,
              if_unmodified_since: OpenRiakTypes.http_date() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              content_encoding: String.t() | nil,
              link: String.t() | nil,
              riak_headers: OpenRiakTypes.riak_headers() | nil,
              body: OpenRiakTypes.byte_stream() | nil
            }

    defstruct [:bucket, :key, :timeout, :w, :dw, :pw, :node_confirms, :sync_on_write, :asis, :if_none_match, :if_match, :if_unmodified_since, :content_type, :content_encoding, :link, :riak_headers, :body]
  end
  defmodule PostLegacyObjectOutput do
    @moduledoc "structure PostLegacyObjectOutput"

    @type t :: %__MODULE__{
              status_code: integer() | nil
            }

    defstruct [:status_code]
  end
  defmodule PostLegacyObjectReturnBodyInput do
    @moduledoc "Supports x-riak-if-not-modified and standard conditional headers for Riak-native conditional updates."

    @type t :: %__MODULE__{
              bucket: OpenRiakTypes.uri_safe_identifier() | nil,
              key: String.t() | nil,
              timeout: integer() | nil,
              w: OpenRiakTypes.quorum() | nil,
              dw: OpenRiakTypes.quorum() | nil,
              pw: OpenRiakTypes.quorum() | nil,
              node_confirms: integer() | nil,
              sync_on_write: OpenRiakTypes.SyncOnWrite.t() | nil,
              asis: boolean() | nil,
              if_none_match: String.t() | nil,
              if_match: String.t() | nil,
              if_unmodified_since: OpenRiakTypes.http_date() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              content_encoding: String.t() | nil,
              link: String.t() | nil,
              riak_headers: OpenRiakTypes.riak_headers() | nil,
              body: OpenRiakTypes.byte_stream() | nil
            }

    defstruct [:bucket, :key, :timeout, :w, :dw, :pw, :node_confirms, :sync_on_write, :asis, :if_none_match, :if_match, :if_unmodified_since, :content_type, :content_encoding, :link, :riak_headers, :body]
  end
  defmodule PostLegacyObjectReturnBodyOutput do
    @moduledoc "Tombstone reads expose X-Riak-Deleted via riakHeaders key deleted."

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              content_encoding: String.t() | nil,
              etag: String.t() | nil,
              last_modified: OpenRiakTypes.http_date() | nil,
              link: String.t() | nil,
              riak_headers: OpenRiakTypes.riak_headers() | nil,
              body: OpenRiakTypes.byte_stream()
            }

    defstruct [:status_code, :content_type, :content_encoding, :etag, :last_modified, :link, :riak_headers, :body]
  end
  defmodule PostObjectInput do
    @moduledoc "Supports x-riak-if-not-modified and standard conditional headers for Riak-native conditional updates."

    @type t :: %__MODULE__{
              bucket_type: OpenRiakTypes.uri_safe_identifier() | nil,
              bucket: OpenRiakTypes.uri_safe_identifier() | nil,
              key: String.t() | nil,
              timeout: integer() | nil,
              w: OpenRiakTypes.quorum() | nil,
              dw: OpenRiakTypes.quorum() | nil,
              pw: OpenRiakTypes.quorum() | nil,
              node_confirms: integer() | nil,
              sync_on_write: OpenRiakTypes.SyncOnWrite.t() | nil,
              asis: boolean() | nil,
              if_none_match: String.t() | nil,
              if_match: String.t() | nil,
              if_unmodified_since: OpenRiakTypes.http_date() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              content_encoding: String.t() | nil,
              link: String.t() | nil,
              riak_headers: OpenRiakTypes.riak_headers() | nil,
              body: OpenRiakTypes.byte_stream() | nil
            }

    defstruct [:bucket_type, :bucket, :key, :timeout, :w, :dw, :pw, :node_confirms, :sync_on_write, :asis, :if_none_match, :if_match, :if_unmodified_since, :content_type, :content_encoding, :link, :riak_headers, :body]
  end
  defmodule PostObjectOutput do
    @moduledoc "structure PostObjectOutput"

    @type t :: %__MODULE__{
              status_code: integer() | nil
            }

    defstruct [:status_code]
  end
  defmodule PostObjectReturnBodyInput do
    @moduledoc "Supports x-riak-if-not-modified and standard conditional headers for Riak-native conditional updates."

    @type t :: %__MODULE__{
              bucket_type: OpenRiakTypes.uri_safe_identifier() | nil,
              bucket: OpenRiakTypes.uri_safe_identifier() | nil,
              key: String.t() | nil,
              timeout: integer() | nil,
              w: OpenRiakTypes.quorum() | nil,
              dw: OpenRiakTypes.quorum() | nil,
              pw: OpenRiakTypes.quorum() | nil,
              node_confirms: integer() | nil,
              sync_on_write: OpenRiakTypes.SyncOnWrite.t() | nil,
              asis: boolean() | nil,
              if_none_match: String.t() | nil,
              if_match: String.t() | nil,
              if_unmodified_since: OpenRiakTypes.http_date() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              content_encoding: String.t() | nil,
              link: String.t() | nil,
              riak_headers: OpenRiakTypes.riak_headers() | nil,
              body: OpenRiakTypes.byte_stream() | nil
            }

    defstruct [:bucket_type, :bucket, :key, :timeout, :w, :dw, :pw, :node_confirms, :sync_on_write, :asis, :if_none_match, :if_match, :if_unmodified_since, :content_type, :content_encoding, :link, :riak_headers, :body]
  end
  defmodule PostObjectReturnBodyOutput do
    @moduledoc "Tombstone reads expose X-Riak-Deleted via riakHeaders key deleted."

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              content_encoding: String.t() | nil,
              etag: String.t() | nil,
              last_modified: OpenRiakTypes.http_date() | nil,
              link: String.t() | nil,
              riak_headers: OpenRiakTypes.riak_headers() | nil,
              body: OpenRiakTypes.byte_stream()
            }

    defstruct [:status_code, :content_type, :content_encoding, :etag, :last_modified, :link, :riak_headers, :body]
  end
  defmodule PushQueueItemsInput do
    @moduledoc "structure PushQueueItemsInput"

    @type t :: %__MODULE__{
              queue_name: OpenRiakTypes.uri_safe_identifier() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              keys_clocks: OpenRiakTypes.json_document() | nil
            }

    defstruct [:queue_name, :content_type, :keys_clocks]
  end
  defmodule PushQueueItemsOutput do
    @moduledoc "structure PushQueueItemsOutput"

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              body: String.t() | nil
            }

    defstruct [:status_code, :content_type, :body]
  end
  defmodule PutDefaultObjectOperationInput do
    @moduledoc "Supports x-riak-if-not-modified and standard conditional headers for Riak-native conditional updates."

    @type t :: %__MODULE__{
              bucket: OpenRiakTypes.uri_safe_identifier() | nil,
              key: String.t() | nil,
              timeout: integer() | nil,
              w: OpenRiakTypes.quorum() | nil,
              dw: OpenRiakTypes.quorum() | nil,
              pw: OpenRiakTypes.quorum() | nil,
              node_confirms: integer() | nil,
              sync_on_write: OpenRiakTypes.SyncOnWrite.t() | nil,
              asis: boolean() | nil,
              if_none_match: String.t() | nil,
              if_match: String.t() | nil,
              if_unmodified_since: OpenRiakTypes.http_date() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              content_encoding: String.t() | nil,
              link: String.t() | nil,
              riak_headers: OpenRiakTypes.riak_headers() | nil,
              body: OpenRiakTypes.byte_stream() | nil
            }

    defstruct [:bucket, :key, :timeout, :w, :dw, :pw, :node_confirms, :sync_on_write, :asis, :if_none_match, :if_match, :if_unmodified_since, :content_type, :content_encoding, :link, :riak_headers, :body]
  end
  defmodule PutDefaultObjectOutput do
    @moduledoc "structure PutDefaultObjectOutput"

    @type t :: %__MODULE__{
              status_code: integer() | nil
            }

    defstruct [:status_code]
  end
  defmodule PutDefaultObjectReturnBodyInput do
    @moduledoc "Supports x-riak-if-not-modified and standard conditional headers for Riak-native conditional updates."

    @type t :: %__MODULE__{
              bucket: OpenRiakTypes.uri_safe_identifier() | nil,
              key: String.t() | nil,
              timeout: integer() | nil,
              w: OpenRiakTypes.quorum() | nil,
              dw: OpenRiakTypes.quorum() | nil,
              pw: OpenRiakTypes.quorum() | nil,
              node_confirms: integer() | nil,
              sync_on_write: OpenRiakTypes.SyncOnWrite.t() | nil,
              asis: boolean() | nil,
              if_none_match: String.t() | nil,
              if_match: String.t() | nil,
              if_unmodified_since: OpenRiakTypes.http_date() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              content_encoding: String.t() | nil,
              link: String.t() | nil,
              riak_headers: OpenRiakTypes.riak_headers() | nil,
              body: OpenRiakTypes.byte_stream() | nil
            }

    defstruct [:bucket, :key, :timeout, :w, :dw, :pw, :node_confirms, :sync_on_write, :asis, :if_none_match, :if_match, :if_unmodified_since, :content_type, :content_encoding, :link, :riak_headers, :body]
  end
  defmodule PutDefaultObjectReturnBodyOutput do
    @moduledoc "Tombstone reads expose X-Riak-Deleted via riakHeaders key deleted."

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              content_encoding: String.t() | nil,
              etag: String.t() | nil,
              last_modified: OpenRiakTypes.http_date() | nil,
              link: String.t() | nil,
              riak_headers: OpenRiakTypes.riak_headers() | nil,
              body: OpenRiakTypes.byte_stream()
            }

    defstruct [:status_code, :content_type, :content_encoding, :etag, :last_modified, :link, :riak_headers, :body]
  end
  defmodule PutLegacyObjectInput do
    @moduledoc "Supports x-riak-if-not-modified and standard conditional headers for Riak-native conditional updates."

    @type t :: %__MODULE__{
              bucket: OpenRiakTypes.uri_safe_identifier() | nil,
              key: String.t() | nil,
              timeout: integer() | nil,
              w: OpenRiakTypes.quorum() | nil,
              dw: OpenRiakTypes.quorum() | nil,
              pw: OpenRiakTypes.quorum() | nil,
              node_confirms: integer() | nil,
              sync_on_write: OpenRiakTypes.SyncOnWrite.t() | nil,
              asis: boolean() | nil,
              if_none_match: String.t() | nil,
              if_match: String.t() | nil,
              if_unmodified_since: OpenRiakTypes.http_date() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              content_encoding: String.t() | nil,
              link: String.t() | nil,
              riak_headers: OpenRiakTypes.riak_headers() | nil,
              body: OpenRiakTypes.byte_stream() | nil
            }

    defstruct [:bucket, :key, :timeout, :w, :dw, :pw, :node_confirms, :sync_on_write, :asis, :if_none_match, :if_match, :if_unmodified_since, :content_type, :content_encoding, :link, :riak_headers, :body]
  end
  defmodule PutLegacyObjectOutput do
    @moduledoc "structure PutLegacyObjectOutput"

    @type t :: %__MODULE__{
              status_code: integer() | nil
            }

    defstruct [:status_code]
  end
  defmodule PutLegacyObjectReturnBodyInput do
    @moduledoc "Supports x-riak-if-not-modified and standard conditional headers for Riak-native conditional updates."

    @type t :: %__MODULE__{
              bucket: OpenRiakTypes.uri_safe_identifier() | nil,
              key: String.t() | nil,
              timeout: integer() | nil,
              w: OpenRiakTypes.quorum() | nil,
              dw: OpenRiakTypes.quorum() | nil,
              pw: OpenRiakTypes.quorum() | nil,
              node_confirms: integer() | nil,
              sync_on_write: OpenRiakTypes.SyncOnWrite.t() | nil,
              asis: boolean() | nil,
              if_none_match: String.t() | nil,
              if_match: String.t() | nil,
              if_unmodified_since: OpenRiakTypes.http_date() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              content_encoding: String.t() | nil,
              link: String.t() | nil,
              riak_headers: OpenRiakTypes.riak_headers() | nil,
              body: OpenRiakTypes.byte_stream() | nil
            }

    defstruct [:bucket, :key, :timeout, :w, :dw, :pw, :node_confirms, :sync_on_write, :asis, :if_none_match, :if_match, :if_unmodified_since, :content_type, :content_encoding, :link, :riak_headers, :body]
  end
  defmodule PutLegacyObjectReturnBodyOutput do
    @moduledoc "Tombstone reads expose X-Riak-Deleted via riakHeaders key deleted."

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              content_encoding: String.t() | nil,
              etag: String.t() | nil,
              last_modified: OpenRiakTypes.http_date() | nil,
              link: String.t() | nil,
              riak_headers: OpenRiakTypes.riak_headers() | nil,
              body: OpenRiakTypes.byte_stream()
            }

    defstruct [:status_code, :content_type, :content_encoding, :etag, :last_modified, :link, :riak_headers, :body]
  end
  defmodule PutObjectOperationInput do
    @moduledoc "Supports x-riak-if-not-modified and standard conditional headers for Riak-native conditional updates."

    @type t :: %__MODULE__{
              bucket_type: OpenRiakTypes.uri_safe_identifier() | nil,
              bucket: OpenRiakTypes.uri_safe_identifier() | nil,
              key: String.t() | nil,
              timeout: integer() | nil,
              w: OpenRiakTypes.quorum() | nil,
              dw: OpenRiakTypes.quorum() | nil,
              pw: OpenRiakTypes.quorum() | nil,
              node_confirms: integer() | nil,
              sync_on_write: OpenRiakTypes.SyncOnWrite.t() | nil,
              asis: boolean() | nil,
              if_none_match: String.t() | nil,
              if_match: String.t() | nil,
              if_unmodified_since: OpenRiakTypes.http_date() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              content_encoding: String.t() | nil,
              link: String.t() | nil,
              riak_headers: OpenRiakTypes.riak_headers() | nil,
              body: OpenRiakTypes.byte_stream() | nil
            }

    defstruct [:bucket_type, :bucket, :key, :timeout, :w, :dw, :pw, :node_confirms, :sync_on_write, :asis, :if_none_match, :if_match, :if_unmodified_since, :content_type, :content_encoding, :link, :riak_headers, :body]
  end
  defmodule PutObjectOutput do
    @moduledoc "structure PutObjectOutput"

    @type t :: %__MODULE__{
              status_code: integer() | nil
            }

    defstruct [:status_code]
  end
  defmodule PutObjectReturnBodyInput do
    @moduledoc "Supports x-riak-if-not-modified and standard conditional headers for Riak-native conditional updates."

    @type t :: %__MODULE__{
              bucket_type: OpenRiakTypes.uri_safe_identifier() | nil,
              bucket: OpenRiakTypes.uri_safe_identifier() | nil,
              key: String.t() | nil,
              timeout: integer() | nil,
              w: OpenRiakTypes.quorum() | nil,
              dw: OpenRiakTypes.quorum() | nil,
              pw: OpenRiakTypes.quorum() | nil,
              node_confirms: integer() | nil,
              sync_on_write: OpenRiakTypes.SyncOnWrite.t() | nil,
              asis: boolean() | nil,
              if_none_match: String.t() | nil,
              if_match: String.t() | nil,
              if_unmodified_since: OpenRiakTypes.http_date() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              content_encoding: String.t() | nil,
              link: String.t() | nil,
              riak_headers: OpenRiakTypes.riak_headers() | nil,
              body: OpenRiakTypes.byte_stream() | nil
            }

    defstruct [:bucket_type, :bucket, :key, :timeout, :w, :dw, :pw, :node_confirms, :sync_on_write, :asis, :if_none_match, :if_match, :if_unmodified_since, :content_type, :content_encoding, :link, :riak_headers, :body]
  end
  defmodule PutObjectReturnBodyOutput do
    @moduledoc "Tombstone reads expose X-Riak-Deleted via riakHeaders key deleted."

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              content_encoding: String.t() | nil,
              etag: String.t() | nil,
              last_modified: OpenRiakTypes.http_date() | nil,
              link: String.t() | nil,
              riak_headers: OpenRiakTypes.riak_headers() | nil,
              body: OpenRiakTypes.byte_stream()
            }

    defstruct [:status_code, :content_type, :content_encoding, :etag, :last_modified, :link, :riak_headers, :body]
  end
  defmodule QueryDefaultSecondaryIndexInput do
    @moduledoc "structure QueryDefaultSecondaryIndexInput"

    @type t :: %__MODULE__{
              bucket: OpenRiakTypes.uri_safe_identifier() | nil,
              timeout: integer() | nil,
              max_results: integer() | nil,
              continuation: String.t() | nil,
              return_terms: boolean() | nil,
              pagination_sort: boolean() | nil,
              term_regex: String.t() | nil,
              field: OpenRiakTypes.non_empty_string() | nil,
              value: String.t() | nil
            }

    defstruct [:bucket, :timeout, :max_results, :continuation, :return_terms, :pagination_sort, :term_regex, :field, :value]
  end
  defmodule QueryDefaultSecondaryIndexOutput do
    @moduledoc "structure QueryDefaultSecondaryIndexOutput"

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              body: OpenRiakTypes.json_document() | nil
            }

    defstruct [:status_code, :content_type, :body]
  end
  defmodule QueryDefaultSecondaryIndexRangeInput do
    @moduledoc "structure QueryDefaultSecondaryIndexRangeInput"

    @type t :: %__MODULE__{
              bucket: OpenRiakTypes.uri_safe_identifier() | nil,
              timeout: integer() | nil,
              max_results: integer() | nil,
              continuation: String.t() | nil,
              return_terms: boolean() | nil,
              pagination_sort: boolean() | nil,
              term_regex: String.t() | nil,
              field: OpenRiakTypes.non_empty_string() | nil,
              start: String.t() | nil,
              end_: String.t() | nil
            }

    defstruct [:bucket, :timeout, :max_results, :continuation, :return_terms, :pagination_sort, :term_regex, :field, :start, :end_]
  end
  defmodule QueryDefaultSecondaryIndexRangeOutput do
    @moduledoc "structure QueryDefaultSecondaryIndexRangeOutput"

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              body: OpenRiakTypes.json_document() | nil
            }

    defstruct [:status_code, :content_type, :body]
  end
  defmodule QuerySecondaryIndexInput do
    @moduledoc "structure QuerySecondaryIndexInput"

    @type t :: %__MODULE__{
              bucket_type: OpenRiakTypes.uri_safe_identifier() | nil,
              bucket: OpenRiakTypes.uri_safe_identifier() | nil,
              timeout: integer() | nil,
              max_results: integer() | nil,
              continuation: String.t() | nil,
              return_terms: boolean() | nil,
              pagination_sort: boolean() | nil,
              term_regex: String.t() | nil,
              field: OpenRiakTypes.non_empty_string() | nil,
              value: String.t() | nil
            }

    defstruct [:bucket_type, :bucket, :timeout, :max_results, :continuation, :return_terms, :pagination_sort, :term_regex, :field, :value]
  end
  defmodule QuerySecondaryIndexOutput do
    @moduledoc "structure QuerySecondaryIndexOutput"

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              body: OpenRiakTypes.json_document() | nil
            }

    defstruct [:status_code, :content_type, :body]
  end
  defmodule QuerySecondaryIndexRangeInput do
    @moduledoc "structure QuerySecondaryIndexRangeInput"

    @type t :: %__MODULE__{
              bucket_type: OpenRiakTypes.uri_safe_identifier() | nil,
              bucket: OpenRiakTypes.uri_safe_identifier() | nil,
              timeout: integer() | nil,
              max_results: integer() | nil,
              continuation: String.t() | nil,
              return_terms: boolean() | nil,
              pagination_sort: boolean() | nil,
              term_regex: String.t() | nil,
              field: OpenRiakTypes.non_empty_string() | nil,
              start: String.t() | nil,
              end_: String.t() | nil
            }

    defstruct [:bucket_type, :bucket, :timeout, :max_results, :continuation, :return_terms, :pagination_sort, :term_regex, :field, :start, :end_]
  end
  defmodule QuerySecondaryIndexRangeOutput do
    @moduledoc "structure QuerySecondaryIndexRangeOutput"

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              body: OpenRiakTypes.json_document() | nil
            }

    defstruct [:status_code, :content_type, :body]
  end
  defmodule ResetBucketPropertiesInput do
    @moduledoc "structure ResetBucketPropertiesInput"

    @type t :: %__MODULE__{
              bucket_type: OpenRiakTypes.uri_safe_identifier() | nil,
              bucket: OpenRiakTypes.uri_safe_identifier() | nil,
              timeout: integer() | nil
            }

    defstruct [:bucket_type, :bucket, :timeout]
  end
  defmodule ResetBucketPropertiesOutput do
    @moduledoc "structure ResetBucketPropertiesOutput"

    @type t :: %__MODULE__{
              status_code: integer() | nil
            }

    defstruct [:status_code]
  end
  defmodule ResetDefaultBucketPropertiesInput do
    @moduledoc "structure ResetDefaultBucketPropertiesInput"

    @type t :: %__MODULE__{
              bucket: OpenRiakTypes.uri_safe_identifier() | nil,
              timeout: integer() | nil
            }

    defstruct [:bucket, :timeout]
  end
  defmodule ResetDefaultBucketPropertiesOutput do
    @moduledoc "structure ResetDefaultBucketPropertiesOutput"

    @type t :: %__MODULE__{
              status_code: integer() | nil
            }

    defstruct [:status_code]
  end
  defmodule RunBucketQueryInput do
    @moduledoc "structure RunBucketQueryInput"

    @type t :: %__MODULE__{
              bucket_type: OpenRiakTypes.uri_safe_identifier() | nil,
              bucket: OpenRiakTypes.uri_safe_identifier() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              query: OpenRiakTypes.BucketQueryRequest.t() | nil
            }

    defstruct [:bucket_type, :bucket, :content_type, :query]
  end
  defmodule RunBucketQueryOutput do
    @moduledoc "structure RunBucketQueryOutput"

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              body: OpenRiakTypes.json_document() | nil
            }

    defstruct [:status_code, :content_type, :body]
  end
  defmodule RunDefaultBucketQueryInput do
    @moduledoc "structure RunDefaultBucketQueryInput"

    @type t :: %__MODULE__{
              bucket: OpenRiakTypes.uri_safe_identifier() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              query: OpenRiakTypes.BucketQueryRequest.t() | nil
            }

    defstruct [:bucket, :content_type, :query]
  end
  defmodule RunDefaultBucketQueryOutput do
    @moduledoc "structure RunDefaultBucketQueryOutput"

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              body: OpenRiakTypes.json_document() | nil
            }

    defstruct [:status_code, :content_type, :body]
  end
  defmodule SetBucketPropertiesInput do
    @moduledoc "structure SetBucketPropertiesInput"

    @type t :: %__MODULE__{
              bucket_type: OpenRiakTypes.uri_safe_identifier() | nil,
              bucket: OpenRiakTypes.uri_safe_identifier() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              props: OpenRiakTypes.json_document() | nil
            }

    defstruct [:bucket_type, :bucket, :content_type, :props]
  end
  defmodule SetBucketPropertiesOutput do
    @moduledoc "structure SetBucketPropertiesOutput"

    @type t :: %__MODULE__{
              status_code: integer() | nil
            }

    defstruct [:status_code]
  end
  defmodule SetBucketTypePropertiesInput do
    @moduledoc "structure SetBucketTypePropertiesInput"

    @type t :: %__MODULE__{
              bucket_type: OpenRiakTypes.uri_safe_identifier() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              props: OpenRiakTypes.json_document() | nil
            }

    defstruct [:bucket_type, :content_type, :props]
  end
  defmodule SetBucketTypePropertiesOutput do
    @moduledoc "structure SetBucketTypePropertiesOutput"

    @type t :: %__MODULE__{
              status_code: integer() | nil
            }

    defstruct [:status_code]
  end
  defmodule SetDefaultBucketPropertiesInput do
    @moduledoc "structure SetDefaultBucketPropertiesInput"

    @type t :: %__MODULE__{
              bucket: OpenRiakTypes.uri_safe_identifier() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              props: OpenRiakTypes.json_document() | nil
            }

    defstruct [:bucket, :content_type, :props]
  end
  defmodule SetDefaultBucketPropertiesOutput do
    @moduledoc "structure SetDefaultBucketPropertiesOutput"

    @type t :: %__MODULE__{
              status_code: integer() | nil
            }

    defstruct [:status_code]
  end
  defmodule StreamBucketsInput do
    @moduledoc "structure StreamBucketsInput"

    @type t :: %__MODULE__{
              bucket_type: OpenRiakTypes.uri_safe_identifier() | nil,
              timeout: integer() | nil
            }

    defstruct [:bucket_type, :timeout]
  end
  defmodule StreamBucketsOutput do
    @moduledoc "structure StreamBucketsOutput"

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              link: String.t() | nil,
              riak_headers: OpenRiakTypes.riak_headers() | nil,
              body: OpenRiakTypes.byte_stream()
            }

    defstruct [:status_code, :content_type, :link, :riak_headers, :body]
  end
  defmodule StreamDefaultBucketsInput do
    @moduledoc "structure StreamDefaultBucketsInput"

    @type t :: %__MODULE__{
              timeout: integer() | nil
            }

    defstruct [:timeout]
  end
  defmodule StreamDefaultBucketsOutput do
    @moduledoc "structure StreamDefaultBucketsOutput"

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              link: String.t() | nil,
              riak_headers: OpenRiakTypes.riak_headers() | nil,
              body: OpenRiakTypes.byte_stream()
            }

    defstruct [:status_code, :content_type, :link, :riak_headers, :body]
  end
  defmodule StreamDefaultKeysInput do
    @moduledoc "structure StreamDefaultKeysInput"

    @type t :: %__MODULE__{
              bucket: OpenRiakTypes.uri_safe_identifier() | nil,
              timeout: integer() | nil,
              props: boolean() | nil
            }

    defstruct [:bucket, :timeout, :props]
  end
  defmodule StreamDefaultKeysOutput do
    @moduledoc "structure StreamDefaultKeysOutput"

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              link: String.t() | nil,
              riak_headers: OpenRiakTypes.riak_headers() | nil,
              body: OpenRiakTypes.byte_stream()
            }

    defstruct [:status_code, :content_type, :link, :riak_headers, :body]
  end
  defmodule StreamDefaultSecondaryIndexInput do
    @moduledoc "structure StreamDefaultSecondaryIndexInput"

    @type t :: %__MODULE__{
              bucket: OpenRiakTypes.uri_safe_identifier() | nil,
              timeout: integer() | nil,
              max_results: integer() | nil,
              continuation: String.t() | nil,
              return_terms: boolean() | nil,
              pagination_sort: boolean() | nil,
              term_regex: String.t() | nil,
              field: OpenRiakTypes.non_empty_string() | nil,
              value: String.t() | nil
            }

    defstruct [:bucket, :timeout, :max_results, :continuation, :return_terms, :pagination_sort, :term_regex, :field, :value]
  end
  defmodule StreamDefaultSecondaryIndexOutput do
    @moduledoc "structure StreamDefaultSecondaryIndexOutput"

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              link: String.t() | nil,
              riak_headers: OpenRiakTypes.riak_headers() | nil,
              body: OpenRiakTypes.byte_stream()
            }

    defstruct [:status_code, :content_type, :link, :riak_headers, :body]
  end
  defmodule StreamDefaultSecondaryIndexRangeInput do
    @moduledoc "structure StreamDefaultSecondaryIndexRangeInput"

    @type t :: %__MODULE__{
              bucket: OpenRiakTypes.uri_safe_identifier() | nil,
              timeout: integer() | nil,
              max_results: integer() | nil,
              continuation: String.t() | nil,
              return_terms: boolean() | nil,
              pagination_sort: boolean() | nil,
              term_regex: String.t() | nil,
              field: OpenRiakTypes.non_empty_string() | nil,
              start: String.t() | nil,
              end_: String.t() | nil
            }

    defstruct [:bucket, :timeout, :max_results, :continuation, :return_terms, :pagination_sort, :term_regex, :field, :start, :end_]
  end
  defmodule StreamDefaultSecondaryIndexRangeOutput do
    @moduledoc "structure StreamDefaultSecondaryIndexRangeOutput"

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              link: String.t() | nil,
              riak_headers: OpenRiakTypes.riak_headers() | nil,
              body: OpenRiakTypes.byte_stream()
            }

    defstruct [:status_code, :content_type, :link, :riak_headers, :body]
  end
  defmodule StreamKeysInput do
    @moduledoc "structure StreamKeysInput"

    @type t :: %__MODULE__{
              bucket_type: OpenRiakTypes.uri_safe_identifier() | nil,
              bucket: OpenRiakTypes.uri_safe_identifier() | nil,
              timeout: integer() | nil,
              props: boolean() | nil
            }

    defstruct [:bucket_type, :bucket, :timeout, :props]
  end
  defmodule StreamKeysOutput do
    @moduledoc "structure StreamKeysOutput"

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              link: String.t() | nil,
              riak_headers: OpenRiakTypes.riak_headers() | nil,
              body: OpenRiakTypes.byte_stream()
            }

    defstruct [:status_code, :content_type, :link, :riak_headers, :body]
  end
  defmodule StreamSecondaryIndexInput do
    @moduledoc "structure StreamSecondaryIndexInput"

    @type t :: %__MODULE__{
              bucket_type: OpenRiakTypes.uri_safe_identifier() | nil,
              bucket: OpenRiakTypes.uri_safe_identifier() | nil,
              timeout: integer() | nil,
              max_results: integer() | nil,
              continuation: String.t() | nil,
              return_terms: boolean() | nil,
              pagination_sort: boolean() | nil,
              term_regex: String.t() | nil,
              field: OpenRiakTypes.non_empty_string() | nil,
              value: String.t() | nil
            }

    defstruct [:bucket_type, :bucket, :timeout, :max_results, :continuation, :return_terms, :pagination_sort, :term_regex, :field, :value]
  end
  defmodule StreamSecondaryIndexOutput do
    @moduledoc "structure StreamSecondaryIndexOutput"

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              link: String.t() | nil,
              riak_headers: OpenRiakTypes.riak_headers() | nil,
              body: OpenRiakTypes.byte_stream()
            }

    defstruct [:status_code, :content_type, :link, :riak_headers, :body]
  end
  defmodule StreamSecondaryIndexRangeInput do
    @moduledoc "structure StreamSecondaryIndexRangeInput"

    @type t :: %__MODULE__{
              bucket_type: OpenRiakTypes.uri_safe_identifier() | nil,
              bucket: OpenRiakTypes.uri_safe_identifier() | nil,
              timeout: integer() | nil,
              max_results: integer() | nil,
              continuation: String.t() | nil,
              return_terms: boolean() | nil,
              pagination_sort: boolean() | nil,
              term_regex: String.t() | nil,
              field: OpenRiakTypes.non_empty_string() | nil,
              start: String.t() | nil,
              end_: String.t() | nil
            }

    defstruct [:bucket_type, :bucket, :timeout, :max_results, :continuation, :return_terms, :pagination_sort, :term_regex, :field, :start, :end_]
  end
  defmodule StreamSecondaryIndexRangeOutput do
    @moduledoc "structure StreamSecondaryIndexRangeOutput"

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              link: String.t() | nil,
              riak_headers: OpenRiakTypes.riak_headers() | nil,
              body: OpenRiakTypes.byte_stream()
            }

    defstruct [:status_code, :content_type, :link, :riak_headers, :body]
  end
  defmodule UpdateDatatypeInput do
    @moduledoc "structure UpdateDatatypeInput"

    @type t :: %__MODULE__{
              bucket_type: OpenRiakTypes.uri_safe_identifier() | nil,
              bucket: OpenRiakTypes.uri_safe_identifier() | nil,
              key: String.t() | nil,
              timeout: integer() | nil,
              r: OpenRiakTypes.quorum() | nil,
              pr: OpenRiakTypes.quorum() | nil,
              w: OpenRiakTypes.quorum() | nil,
              pw: OpenRiakTypes.quorum() | nil,
              dw: OpenRiakTypes.quorum() | nil,
              return_body: boolean() | nil,
              include_context: boolean() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              update: OpenRiakTypes.DatatypeUpdatePayload.t() | nil
            }

    defstruct [:bucket_type, :bucket, :key, :timeout, :r, :pr, :w, :pw, :dw, :return_body, :include_context, :content_type, :update]
  end
  defmodule UpdateDatatypeOutput do
    @moduledoc "CRDT fetch or update response. When include_context is true, the opaque context may appear in the JSON body and in X-Riak-CRDT-Ctx."

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              crdt_context: String.t() | nil,
              body: OpenRiakTypes.json_document() | nil
            }

    defstruct [:status_code, :content_type, :crdt_context, :body]
  end
  defmodule UpdateLegacyCounterInput do
    @moduledoc "structure UpdateLegacyCounterInput"

    @type t :: %__MODULE__{
              bucket: OpenRiakTypes.uri_safe_identifier() | nil,
              key: String.t() | nil,
              timeout: integer() | nil,
              w: OpenRiakTypes.quorum() | nil,
              pw: OpenRiakTypes.quorum() | nil,
              dw: OpenRiakTypes.quorum() | nil,
              return_value: boolean() | nil,
              amount: String.t() | nil
            }

    defstruct [:bucket, :key, :timeout, :w, :pw, :dw, :return_value, :amount]
  end
  defmodule UpdateLegacyCounterOutput do
    @moduledoc "structure UpdateLegacyCounterOutput"

    @type t :: %__MODULE__{
              status_code: integer() | nil,
              content_type: OpenRiakTypes.media_type() | nil,
              body: String.t() | nil
            }

    defstruct [:status_code, :content_type, :body]
  end
end
