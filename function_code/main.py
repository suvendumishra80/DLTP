import os, sys, datetime, traceback
import json
import yaml
from google.cloud import storage

def convert_yaml_to_json(data):
    # Load YAML data
    yaml_data = yaml.safe_load(data)

    # Convert YAML to JSON
    json_data = json.dumps(yaml_data)

    # Return JSON data
    return json_data

def convert_yaml_to_json_gcs(event):
    try:        
        # Get the GCS client
        storage_client = storage.Client()

        # Get the bucket name and object name from the event
        bucket_name = os.environ['BUCKET_NAME']

        # Get the GCS client
        storage_client = storage.Client()

        # Get the bucket and object
        bucket = storage_client.get_bucket(bucket_name)

        # List all the files from the bucket
        blobs = bucket.list_blobs()

        # adding all YAML files in the list for further process
        yaml_files = []
        for blob in blobs:
            if blob.name.endswith('.yaml'):
                yaml_files.append(blob.name)

        # conversion of ymal files data into json file
        for entry in yaml_files:
            blob = bucket.blob(entry)

            # Read the YAML file contents from the object
            yaml_data = blob.download_as_string()

            # Convert the YAML to JSON
            json_data = convert_yaml_to_json(yaml_data)

            # Upload the JSON file to the same bucket with the same name as the YAML file
            json_blob = bucket.blob(os.path.splitext(entry)[0] +'-output.json')
            json_blob.upload_from_string(json_data)

            # Log the output
            print(f'Converted {entry} to JSON successfully.')

        return "Conversion of YAML Files is successful"
    except Exception as e:
        timestamp = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        exc_type, exc_value, exc_traceback = sys.exc_info()
        traceback_str = "".join(traceback.format_exception(exc_type, exc_value, exc_traceback))
        return f"Execution Unsuccessful: {timestamp}: Exception {e} occurred:\n{traceback_str}"    
