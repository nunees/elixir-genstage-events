defmodule EventPushing.Producer do
  use GenStage

  def start_link, do: GenStage.start_link(__MODULE__, :ok, name: __MODULE__)
  def start_link(opts), do: GenStage.start_link(__MODULE__, opts, name: __MODULE__)

  def init(:ok), do: {:producer, []}
  def init(opts), do: {:producer, opts}

  @doc """
    handle_info/2 is called when a message is sent to the producer.
  """
  def handle_info(_, state), do: {:noreply, [], state}

  @doc """
    add/1 is called to add events to the producer.
  """
  def add(events), do: GenServer.cast(__MODULE__, {:add, events})

  @doc """
    handle_cast/2 is called when a message is sent to the producer.
  """
  def handle_cast({:add, events}, state) when is_map(events) do
    IO.puts "Adding events: #{inspect events} #{inspect(DateTime.utc_now())}"
    {:noreply, [events], state}
  end

  def handle_cast({:add, events}, state) do
    IO.puts "Invalid events: #{inspect events}"
    {:noreply, [], state}
  end

  @doc """
    handle_demand/2 is called when a consumer asks for events.
  """
  def handle_demand(_demand, state), do: {:noreply, [], state}

  ## Helpers

  @doc """
    generate_events/0 is called to generate events.
  """
  def generate_events() do
    # Generate a random delay between 1 and 1000 milliseconds
    delay = :rand.uniform(5000            )

    # Schedule sending the :add message to self after the random delay
    add(%{id: UUID.uuid4()})

    # Print the generated event with delay information
    IO.puts "Generating event from producer after #{delay} milliseconds at #{inspect :utc_datetime}"

    :timer.sleep(delay)

    # Call the function recursively to generate the next event
    generate_events()
  end

end
