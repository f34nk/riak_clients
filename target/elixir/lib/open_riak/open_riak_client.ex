defmodule OpenRiak.OpenRiakClient do
  @moduledoc """
  Placeholder OpenRiak client. Functionality will be added later.
  """

  defstruct endpoint: "http://127.0.0.1:8098"

  @type t :: %__MODULE__{endpoint: String.t()}

  @spec new(keyword()) :: t()
  def new(opts \\ []) do
    %__MODULE__{endpoint: Keyword.get(opts, :endpoint, "http://127.0.0.1:8098")}
  end
end
