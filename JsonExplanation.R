# 
# {
#   "job": {
#     "result": {
#       "design": {
#         "url": "https://example.com/design-url",
#         "status": "success",
#         "title": "Beatriz Code"
#       },
#       "time": "2024-11-26T12:47:00"
#     }
#   }
# }

# Sample response (replace this with your actual response)
res <- '{"job": {"result": {"design": {"url": "https://example.com/design-url", "status": "success", "title": "Beatriz Code"}, "time": "2024-11-26T12:47:00"}}}'

# Parse the JSON response into a list
response_list <- jsonlite::fromJSON(res)

# Extract the URL from the parsed JSON response
design_url <- response_list$job$result$design$url

# Extract the status from the parsed JSON response
design_status <- response_list$job$result$design$status

# Extract the title from the parsed JSON response
title <- response_list$job$result$design$title


# Extract the time from the parsed JSON response

# Print the extracted values
print(design_url)       # https://example.com/design-url
print(design_status)    # success
print(response_time)    # 2024-11-26T12:47:00
print(title)