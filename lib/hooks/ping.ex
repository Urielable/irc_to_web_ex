defmodule IrcToWebEx.Hooks.PingHook do
  @replies ["jei", "puk", "shu", "zurra", "upa"]
  
  @num_replies Enum.count(@replies)

  def run(sender, text) do
    case String.downcase(text) do      
      "ping" ->
        response = Enum.at(@replies, :random.uniform(@num_replies) - 1)
        IrcToWebEx.Endpoint.broadcast "rooms:lobby", "pong", %{nick: sender, response: response}
        {:reply, sender, response}      
      _ -> nil
    end
  end  
end
