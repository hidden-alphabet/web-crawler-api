require 'aws-sdk-sqs'
require 'json'

def handle(event, context)
  sqs = Aws::SQS::Client.new(region: ENV['AWS_REGION_CODE'])
  message = 'success'

  sqs.send_message(queue_url: ENV['AWS_SQS_URL'], message_body: event.to_json )

  {
    'statusCode' => status,
    'headers' => headers,
    'body' => { "message" => message }.to_json
  }
end