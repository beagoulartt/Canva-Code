library(httr)
library(jsonlite)

# Set the request headers with Authorization token and Content-Type
headers <- c(
  'Authorization' = 'Bearer eyJraWQiOiIyMzY4ZjRhYi00N2ZiLTQwN2MtYjM5Ni00NzgxODcwMjZkN2UiLCJhbGciOiJSUzI1NiJ9.eyJqdGkiOiJ5ZXQwdWx6cnZiY2o2TlM3cElqNFBRIiwiY2xpZW50X2lkIjoiT0MtQVpMODl2LUI0UnhnIiwiYXVkIjoiaHR0cHM6Ly93d3cuY2FudmEuY29tIiwiaWF0IjoxNzMxOTU0NjI4LCJuYmYiOjE3MzE5NTQ2MjgsImV4cCI6MTczMTk2OTAyOCwiYnVuZGxlcyI6WyJBRkZJIiwiUEFJRCJdLCJ0aWVyIjoicGFpZCIsInJvbGVzIjoiR2h3RVlveVJSSklPOWw1eHdNb2E5eGE2cm1ZWUpHLWw0bmFCRkllUHRWb0h4N2M3QjlsRXJnUTVlZ01hcDU5TnFseFJ1dyIsImxvY2FsZSI6Im5KWGE3OGtVdHhhOHpWV1RSb2Zrbm5OV0lfQmlCQmhpMlBfUDctUzFzd0IzUzRWWE1ISEZhSWhLdVFOR2FQZ0RSbTZfNVEiLCJzY29wZXMiOlsiYXBwOnJlYWQiLCJhcHA6d3JpdGUiLCJkZXNpZ246Y29udGVudDpyZWFkIiwiZGVzaWduOm1ldGE6cmVhZCIsImRlc2lnbjpjb250ZW50OndyaXRlIiwiZGVzaWduOnBlcm1pc3Npb246cmVhZCIsImRlc2lnbjpwZXJtaXNzaW9uOndyaXRlIiwiZm9sZGVyOnJlYWQiLCJmb2xkZXI6d3JpdGUiLCJmb2xkZXI6cGVybWlzc2lvbjpyZWFkIiwiZm9sZGVyOnBlcm1pc3Npb246d3JpdGUiLCJhc3NldDpyZWFkIiwiYXNzZXQ6d3JpdGUiLCJjb21tZW50OnJlYWQiLCJjb21tZW50OndyaXRlIiwiYnJhbmR0ZW1wbGF0ZTptZXRhOnJlYWQiLCJicmFuZHRlbXBsYXRlOmNvbnRlbnQ6cmVhZCIsInByb2ZpbGU6cmVhZCJdLCJzdWIiOiJvVVZ3bnFUTjRETmtkMGgyQkNUZDZFIiwiYnJhbmQiOiJvQlZ3bjJZazZneGFYSl9jdHh5QWg0Iiwib3JnYW5pemF0aW9uIjpudWxsLCJjb2RlX2lkIjoiMlhzdUJYVXpxZ0RNbUVNZkgzX1FCZyJ9.VgTVFyrmeZOj2FVflESdJfup4kq3tAsxU_xNkKvYr7WfVsjok_1JXSVgP8FZHpJhtv_g6Uo40o46uRs8o25gKame5SmwXbuU1-oA7Na1cWCKV86a8vVCX1ax5ax52qh4kt2ZdUBh8JOkOc9iYj62ofYzowxkVn9n3XILP2UrAeXAcVCsEXxyumvjVGuhpQoTFyVW0ybTvfSOO9--09Eb3ODSHGPmm1gJnkj3ciYJsG6hQ9hz5WBZkFOIiIjiL2Z7ZcG5lKvOnpm17MVeKW5NuPpORe2yh_u9fiGVRhjetgCm0PPxBFxRrauomu-sHssOZnSoSplilTzal9w2-FBQeg',
  'Content-Type' = 'application/json'
)

# Prepare the body of the request with random data for the chart
body <- '{
  "dataset": {
    "slide5_monthlyVisits": {
      "type": "chart",
      "chart_data": {
        "categories": ["January", "February", "March", "April", "May"],
        "values": [250, 300, 200, 450, 500]
      },
      "chart_type": "line",
      "title": "Monthly Visits"
    }
  }
}'

# Make the POST request to Canva API
res <- VERB("POST", url = "https://api.canva.com/rest/v1/slides/update", body = body, add_headers(headers))

# Display the response content
cat(content(res, 'text'))