defmodule EventPushing.Consumer do
  use GenStage

  @doc """
    Starts the consumer.
  """
  def start_link, do: start_link([])
  def start_link(_), do: GenStage.start_link(__MODULE__, :ok, name: __MODULE__)

  @doc """
    Initializes the consumer.
  """
  def init(:ok) do
    # The state is a map with the producer and the events.
    state = %{producer_consumer: EventPushing.ProducerConsumer}

    # We subscribe to the producer.
    {:consumer, state, subscribe_to: [{state.producer_consumer, []}]}
  end

  @doc """
    handle_info/2 is called when a message is sent to the consumer.
  """
  def handle_info(_, state), do: {:noreply, [], state}

  @doc """
    handle_event/3 is called when a message is sent to the consumer.
  """
  def handle_events(events, _from, state) do
    # We print the events.
    IO.puts "Final consumer received events: #{inspect events} at #{inspect(DateTime.utc_now())}"
    IO.puts "\n"

    # We reply with the events and the state.
    {:noreply, [], state}
  end


end
