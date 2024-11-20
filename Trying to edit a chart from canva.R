library(httr)

# Define headers
headers <- c(
  'Authorization' = 'Bearer eyJraWQiOiIyMzY4ZjRhYi00N2ZiLTQwN2MtYjM5Ni00NzgxODcwMjZkN2UiLCJhbGciOiJSUzI1NiJ9.eyJqdGkiOiJITS1qRTktNDFVQnhVV3hiUFZLbW5nIiwiY2xpZW50X2lkIjoiT0MtQVpMODl2LUI0UnhnIiwiYXVkIjoiaHR0cHM6Ly93d3cuY2FudmEuY29tIiwiaWF0IjoxNzMyMTIzODY0LCJuYmYiOjE3MzIxMjM4NjQsImV4cCI6MTczMjEzODI2NCwiYnVuZGxlcyI6WyJBRkZJIiwiUEFJRCJdLCJ0aWVyIjoicGFpZCIsInJvbGVzIjoicVRCdW90MHFTa3ZNV25kdlhVcFd6aEhhNTFQNHhnaHpoZkV3WkdIbWw2R0E2WEJCOEg5U1I1LU9scHk5c3h4b3dWcVZ5dyIsImxvY2FsZSI6IjBmblVTdkxUelN0TFpSWXN4OFZ5Rm1zbVI1aUNXWXBYSjlzYWtqbW9aTk8tT01zdUoxZDJMcTdnZ3FpN1ROWVZHZlM5N2ciLCJzY29wZXMiOlsiYXBwOnJlYWQiLCJhcHA6d3JpdGUiLCJkZXNpZ246Y29udGVudDpyZWFkIiwiZGVzaWduOm1ldGE6cmVhZCIsImRlc2lnbjpjb250ZW50OndyaXRlIiwiZGVzaWduOnBlcm1pc3Npb246cmVhZCIsImRlc2lnbjpwZXJtaXNzaW9uOndyaXRlIiwiZm9sZGVyOnJlYWQiLCJmb2xkZXI6d3JpdGUiLCJmb2xkZXI6cGVybWlzc2lvbjpyZWFkIiwiZm9sZGVyOnBlcm1pc3Npb246d3JpdGUiLCJhc3NldDpyZWFkIiwiYXNzZXQ6d3JpdGUiLCJjb21tZW50OnJlYWQiLCJjb21tZW50OndyaXRlIiwiYnJhbmR0ZW1wbGF0ZTptZXRhOnJlYWQiLCJicmFuZHRlbXBsYXRlOmNvbnRlbnQ6cmVhZCIsInByb2ZpbGU6cmVhZCJdLCJzdWIiOiJvVVZ3bnFUTjRETmtkMGgyQkNUZDZFIiwiYnJhbmQiOiJvQlZ3bjJZazZneGFYSl9jdHh5QWg0Iiwib3JnYW5pemF0aW9uIjpudWxsLCJjb2RlX2lkIjoiY0ZGdlZOWk9fZDhTb2VmYm1hZEltZyJ9.i5co3v1fUaaMC_SQAILiVIavJh0z8P_SVzUKtpqY4nus-Hg2zf89UIOrbeHPouYcivcjXi0-NwtcU5xA2YAmf0ICiY84PYBoQ7U1uIoUMMri00rKphS47MtMWX_BCld-nLHFAVQB4lSSTmotVCRPAKExGU3ClQdUcNEYLJum2fWLEfKY7vo1Go32lQFxVkAZkxmp_M2qCVf9zox8YeLa_CYCGjGnpeQh_kUqnutFqV92TpXeeNH3kK9X7mvu_OXenn8FSgN29tqmkyJHvfaKrdeBNgdZDBl9UP3ZGAH-cnhIFhpYcJeemYMFIc10Puk0DBqh_QHIFyZWi25zPfOBlw',
  'Content-Type' = 'application/json'
)

# Define body
body <- list(
  brand_template_id = "DAGUVydZ3L4",
  title = "2024-11-18, 2:41pm - November 2024 MH Board Meeting Slide Deck",
  data = list(
    MonthYear = list(
      type = "text",
      text = "October 2024"
    ),
    slide3_visits = list(
      type = "text",
      text = "202456"
    ),
    slide4_EthnicityChart = list(
      type = "chart",
      chart_data = list(
        rows = list(
          list(
            cells = list(
              list(type = "string", value = "Geographic Region"),
              list(type = "string", value = "Sales (millions AUD)"),
              list(type = "string", value = "Target met?"),
              list(type = "string", value = "Date met")
            )
          ),
          list(
            cells = list(
              list(type = "string", value = "Asia Pacific"),
              list(type = "number", value = 10.2),
              list(type = "boolean", value = TRUE),
              list(type = "string", value = "2024-11-18")
            )
          ),
          list(
            cells = list(
              list(type = "string", value = "EMEA"),
              list(type = "number", value = 13.8),
              list(type = "boolean", value = FALSE),
              list(type = "string", value = "")
            )
          )
        )
      )
    )
  )
)

# Serialize the body to JSON
json_body <- toJSON(body, auto_unbox = TRUE,pretty = TRUE)

# Make the POST request
res <- POST(
  url = "https://api.canva.com/rest/v1/autofills",
  body = json_body,
  add_headers(.headers = headers),
  encode = "raw"
)

# Display the response content
cat(content(res, "text", encoding = "UTF-8"))