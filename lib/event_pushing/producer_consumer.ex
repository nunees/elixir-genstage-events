defmodule EventPushing.ProducerConsumer  do
  @moduledoc """
  This module implements a producer-consumer that subscribes to the producer and prints the events.
  It act as a consumer for the producer and a producer for the consumer.
  It amplifies the events from the producer and prints them.
  In real-world scenarios, the consumer can be a database or a file system.
  """
  use GenStage

  @doc """
    Starts the producer-consumer.
  """
  def start_link, do: start_link([])
  def start_link(_), do: GenStage.start_link(__MODULE__, :ok, name: __MODULE__)

  @doc """
    Initializes the producer-consumer.
  """
  def init(:ok) do
    state = %{producer: EventPushing.Producer}
    {:producer_consumer, state, subscribe_to: [{state.producer, []}]}
  end

  @doc """
    handle_events/3 is called when a message is sent to the producer-consumer.
    """
  def handle_events(events, from, state) do
    IO.puts "Producer-Consumer was called by #{inspect from}"
    IO.puts "Producer-Consumer received events: #{inspect events} at #{inspect(DateTime.utc_now())}"
    {:noreply, events, state}
  end


end
