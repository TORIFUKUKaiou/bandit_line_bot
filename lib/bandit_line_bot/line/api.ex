defmodule BanditLineBot.Line.Api do

  # https://developers.line.biz/ja/reference/messaging-api/#send-reply-message
  def reply(text, reply_token) do
    json =
      %{
        replyToken: reply_token,
        messages: [
          %{
            type: "text",
            text: text
          }
        ]
      }
      |> Jason.encode!()

    url = "https://api.line.me/v2/bot/message/reply"

    headers = [
      "Content-type": "application/json",
      Authorization: "Bearer #{channel_access_token()}"
    ]

    {:ok, _response} = HTTPoison.post(url, json, headers)
  end

  defp channel_access_token do
    System.get_env("CHANNEL_ACCESS_TOKEN")
  end
end
