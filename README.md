import boto3

def start_fleet(fleet_name):
    client = boto3.client('appstream')
    
    response = client.start_fleet(Name=fleet_name)
    print(f"Fleet '{fleet_name}' is starting...")
    return response

def generate_streaming_url(stack_name, fleet_name, user_id):
    client = boto3.client('appstream')
    
    response = client.create_streaming_url(
        StackName=stack_name,
        FleetName=fleet_name,
        UserId=user_id,
        Validity=3600  # URL valid for 1 hour
    )
    
    url = response.get('StreamingURL', 'No URL generated')
    print(f"Streaming URL: {url}")
    return url

if __name__ == "__main__":
    fleet_name = "f1"
    stack_name = "your-stack-name"
    user_id = "test-user"
    
    start_fleet(fleet_name)
    generate_streaming_url(stack_name, fleet_name, user_id)
    
